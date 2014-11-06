#include <stdio.h>
#include "../bcd.h"
#include "../seven_seg.h"

int main(void) {
  uint8_t i = 0;
  uint8_t acc_cnt = 0;
  uint16_t acc = 0;

  Digit digits[4];
  Segment segments[4];

  for (i = 0; i < 65; i++) {
    acc_cnt += 1;
    acc += 1023;

    printf("acc: %d\n", acc);

    if (acc_cnt == 16) {
      acc_cnt = 0;
      acc >>= 2; // divide by 4 for oversampling

      acc *= 11; // multiply by 11/32 to scale 2^12 to 1500 without overflowing a uint16_t
      acc >>= 5;

      bin_to_bcd(acc, digits);
      bcd_to_seg(digits, (1 << 1), segments);

      printf("acc: %d\n", acc);
      printf("digits: %d %d %d %d\n", digits[0], digits[1], digits[2], digits[3]);
      printf("segments: %x %x %x %x\n", segments[0], segments[1], segments[2], segments[3]);
      printf("\n");

      acc = 0;
    }
  }

  return 0;
}
