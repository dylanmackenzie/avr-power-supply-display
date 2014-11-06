#ifndef SEVEN_SEG_H
#define SEVEN_SEG_H

#include <stdint.h>
#include "bcd.h"

typedef uint8_t Segment;

int bcd_to_seg(Digit *digits, uint8_t dp, Segment *segments);

#endif /* SEVEN_SEG_H */
