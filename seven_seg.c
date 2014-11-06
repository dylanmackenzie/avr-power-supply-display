#include "seven_seg.h"

/*
     a
  ┌─────┐  ┌─────┐   ┌─────┐╺ ┌─────┐
  │f    │b │     │   │     │  │     │
  │  g  │  │     │ ╺ │     │  │     │
  ├─────┤  ├─────┤   ├─────┤  ├─────┤
  │e    │c │     │ ╺ │     │  │     │
  │     │  │     │   │     │  │     │
  └─────┘╺ └─────┘╺  └─────┘╺ └─────┘╺
     d  dp1      dp2      dp3      dp4

     0        1         2        3

  digits: array of 4 integers describing the symbol to display display[0]-->0
  dp: last 4 bits turn on decimal points (eg. 0b00001010 turns on dp 1 and 3)

  display: 4 8-bit values in form of dp.g.f.e.d.c.b.a from MSB to LSB
*/

int bcd_to_seg(Digit *digits, uint8_t dp, Segment *segments)
{
  uint8_t i;
  Segment tmp;

  for(i = 0; i < 4; i++) {
    switch(digits[i]) {
      case  0: tmp = 0x3f; break;
      case  1: tmp = 0x06; break;
      case  2: tmp = 0x5b; break;
      case  3: tmp = 0x4f; break;
      case  4: tmp = 0x66; break;
      case  5: tmp = 0x6d; break;
      case  6: tmp = 0x7d; break;
      case  7: tmp = 0x07; break;
      case  8: tmp = 0x7f; break;
      case  9: tmp = 0x6f; break;
      case 10: tmp = 0x00; break; // blank
      case 11: tmp = 0x73; break; // p
      case 12: tmp = 0x5c; break; // o
      case 13: tmp = 0x6d; break; // s
      case 14: tmp = 0x54; break; // n
      case 15: tmp = 0x79; break; // e
      case 16: tmp = 0x6f; break; // g
      case 17: tmp = 0x7c; break; // b
      case 18: tmp = 0x78; break; // t
      default: tmp = 0x00; break; // blank
    }

    // if top digit is 0, don't display it
    if (i == 0 && digits[0] == 0) {
      tmp = 0x00;
    }

    tmp |= dp & (1 << i) ? (1 << 7) : 0x0;

    segments[i] = tmp;
  }

  return 0;
}
