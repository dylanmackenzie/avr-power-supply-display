#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdint.h>

#include "bcd.h"
#include "seven_seg.h"

#define CHANGE_RAIL_MSG_TIME 60
#define BOOT_MSG_TIME 100
#define DEBOUNCE_TIME 100

#define ADC_PORT PORTA
#define ADC_DDR DDRA
#define ADC_PIN PINA

#define DIGIT_PORT PORTA
#define DIGIT_DDR DDRA

#define SEG_PORT PORTB
#define SEG_DDR DDRB

#define ADC_PLUS_PIN PA0
#define ADC_MINUS_PIN PA1
#define ADC_SELECT_PIN PA2
#define ADC_LED_PIN PA3

// bits for ADMUX that select the plus or minus pins
#define ADC_PLUS_MUX 0b00000
#define ADC_MINUS_MUX 0b00001

// pins responsible for selecting digits
#define D0 PA7
#define D1 PA6
#define D2 PA5
#define D3 PA4

// bits in ADMUX responsible for selecting input
#define MUX_MASK 0x1f

volatile uint8_t i = 0;

Segment segments[4] = { 0b01111100, 0b01011100, 0b01011100, 0b01111000 };
Digit digits[4] = { 17, 12, 12, 18 }; //'b', 'o', 'o', 't'

static inline void initTimer(void)
{
  TCCR0A = _BV(CTC0);
  TCCR0B = _BV(CS01) | _BV(CS00);
  TIMSK = _BV(OCIE0A);
  OCR0A = 35;
}

static inline void initADC(void)
{
  ADMUX = _BV(REFS1) | ADC_PLUS_MUX;
  DIDR0 = _BV(ADC_PLUS_PIN) | _BV(ADC_MINUS_PIN);
  ADCSRB = _BV(REFS2);
  ADCSRA = _BV(ADEN) | _BV(ADSC) | _BV(ADPS2) | _BV(ADPS1);
}

static inline void initIO(void)
{
  // low: inputs, high: outputs
  DIGIT_DDR = _BV(D0) | _BV(D1) | _BV(D2) | _BV(D3);
  ADC_DDR |= _BV(ADC_LED_PIN);
  SEG_DDR = 0xff;
  ADC_PORT = _BV(ADC_SELECT_PIN); // enable pull-up resistor on select pin
}

ISR(TIMER0_COMPA_vect)
{
  i = (i + 1) & 0x3; // increment i and reset to 0 if i is greater than 3

  // output digit
  DIGIT_PORT &= ~(_BV(D0) | _BV(D1) | _BV(D2) | _BV(D3));
  SEG_PORT = ~(segments[i]);
  switch(i) {
    case 0: DIGIT_PORT |= _BV(D0); break;
    case 1: DIGIT_PORT |= _BV(D1); break;
    case 2: DIGIT_PORT |= _BV(D2); break;
    case 3: DIGIT_PORT |= _BV(D3); break;
  }
}

int main(void)
{
  uint8_t acc_cnt = 0;
  uint16_t acc = 0, old_acc = 0; // accumulator for averaging and oversampling

  uint8_t msg_timer = BOOT_MSG_TIME; // counter for message display time
  uint8_t dp = 0x00; // decimal point position
  uint8_t adc_pin = 1; // newly selected adc pin (1 is ADC_PLUS_PIN)
  uint8_t adc_pin_state = 1; // currently selected adc pin (1 is ADC_PLUS_PIN)
  uint8_t adc_btn_state = _BV(ADC_SELECT_PIN); // state of adc select button
  uint8_t dbnc_timer = 0;

  cli();
  initADC();
  initIO();
  initTimer();
  sei();

  // main loop
  for (;;) {

    // reading of the adc button differs from button state
    if ((ADC_PIN & _BV(ADC_SELECT_PIN)) ^ adc_btn_state) {

      // reading has been consistent so we have a state change
      if (--dbnc_timer == 0) {
        adc_btn_state ^= _BV(ADC_SELECT_PIN);

        // button is pressed down
        if (adc_btn_state == 0) {
          adc_pin ^= 1;
        }

        dbnc_timer = DEBOUNCE_TIME;
      }
    } else {
      dbnc_timer = DEBOUNCE_TIME;
    }

    // if we have a new adc reading
    if (!( ADCSRA & _BV(ADSC) )) {
      acc_cnt += 1;
      acc += ADC; // add the reading to our accumulator

      // if we have 16 adc readings
      if (acc_cnt == 16) {
        acc_cnt = 0;
        acc >>= 2; // divide by 4 for oversampling

        // do an exponentially weighted moving average with a factor of 8
        old_acc = acc + old_acc - (old_acc - 8/2) / 8;
        acc = old_acc / 8;

        // multiply by 12/32 to scale 2^12 to 1534 without overflowing a uint16_t
        acc *= 12;
        acc >>= 5;

        // invert reading if it comes from the negative pin
        if (!adc_pin_state)
          acc = 1534 - acc;

        // if we are not displaying a message
        if (msg_timer == 0) {
          bin_to_bcd(acc, digits);
          dp = _BV(1);
        } else {
          msg_timer--;
        }

        // if button has been pressed
        if (adc_pin != adc_pin_state) {
          adc_pin_state = adc_pin;
          msg_timer = CHANGE_RAIL_MSG_TIME; // display message
          dp = 0x00;
          digits[0] = 10; // \0
          ADMUX &= ~(MUX_MASK);

          if (adc_pin) {
            ADMUX |= ADC_PLUS_MUX;
            digits[1] = 11; // 'p'
            digits[2] = 12; // 'o'
            digits[3] = 13; // 's'
            ADC_PORT &= ~_BV(ADC_LED_PIN); // sink current on LED pin
          } else {
            ADMUX |= ADC_MINUS_MUX;
            digits[1] = 14; // 'n'
            digits[2] = 15; // 'e'
            digits[3] = 16; // 'g'
            ADC_PORT |= _BV(ADC_LED_PIN); // source current on LED pin
          }
        }

        bcd_to_seg(digits, dp, segments);
        acc = 0;
      }

      ADCSRA |= _BV(ADSC); // begin next reading
    }

  }

  return 0;

}
