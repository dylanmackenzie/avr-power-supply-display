PROGRAM = bcd_test

CFLAGS += -Wall
LDFLAGS +=
OBJS = ../bcd.o ../seven_seg.o bcd_test.o

.PHONY: all test clean
all: $(PROGRAM)

$(PROGRAM): $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) $^ -o $@

test: $(PROGRAM)
	./$(PROGRAM)

clean:
	-rm -f $(OBJS) $(PROGRAM)
