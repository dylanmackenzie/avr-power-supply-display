PROGRAM = voltmeter

MCU = attiny261
PRGMR = usbasp
DEV = t261

CC = avr-gcc
OBJCOPY = avr-objcopy
AVRINC = /usr/avr/include
CFLAGS = -Wall -Os -g -I$(AVRINC) -mmcu=$(MCU)
CFLAGS += -DF_CPU=1000000
LDFLAGS += -mmcu=$(MCU) -Os
SRCS = seven_seg.c bcd.c main.c
OBJS = $(SRCS:.c=.o)

.PHONY: all
all: $(PROGRAM).hex

$(PROGRAM).elf: $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $^

$(PROGRAM).hex: $(PROGRAM).elf
	$(OBJCOPY) -j .text -j .data -O ihex $< $@

%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<

.PHONY: flash
flash: $(PROGRAM).hex
	avrdude -c $(PRGMR) -p $(DEV) -U flash:w:$(PROGRAM).hex

.PHONY: asm
asm: $(PROGRAM).elf
	avr-objdump -d $< >$(PROGRAM).asm

.PHONY: clean
clean:
	-rm -f $(OBJS)
	-rm -f $(PROGRAM).elf $(PROGRAM).hex $(PROGRAM).asm
