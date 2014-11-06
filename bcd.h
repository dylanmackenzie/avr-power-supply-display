#ifndef BCD_H
#define BCD_H

#include <stdint.h>

typedef uint8_t Digit;

int bin_to_bcd(uint16_t bin, Digit *digits);

#endif /* BCD_H */
