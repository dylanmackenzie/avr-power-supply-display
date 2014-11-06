#include "bcd.h"

int bin_to_bcd(uint16_t bin, Digit *digits)
{
  uint8_t i;

  for (i = 4; i--; ) {
    digits[i] = bin % 10;
    bin /= 10;
  }

  return 0;
}
