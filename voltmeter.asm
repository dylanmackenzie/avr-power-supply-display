
voltmeter.elf:     file format elf32-avr


Disassembly of section .text:

00000000 <__vectors>:
   0:	12 c0       	rjmp	.+36     	; 0x26 <__ctors_end>
   2:	2a c0       	rjmp	.+84     	; 0x58 <__bad_interrupt>
   4:	29 c0       	rjmp	.+82     	; 0x58 <__bad_interrupt>
   6:	28 c0       	rjmp	.+80     	; 0x58 <__bad_interrupt>
   8:	27 c0       	rjmp	.+78     	; 0x58 <__bad_interrupt>
   a:	26 c0       	rjmp	.+76     	; 0x58 <__bad_interrupt>
   c:	25 c0       	rjmp	.+74     	; 0x58 <__bad_interrupt>
   e:	24 c0       	rjmp	.+72     	; 0x58 <__bad_interrupt>
  10:	23 c0       	rjmp	.+70     	; 0x58 <__bad_interrupt>
  12:	22 c0       	rjmp	.+68     	; 0x58 <__bad_interrupt>
  14:	21 c0       	rjmp	.+66     	; 0x58 <__bad_interrupt>
  16:	20 c0       	rjmp	.+64     	; 0x58 <__bad_interrupt>
  18:	1f c0       	rjmp	.+62     	; 0x58 <__bad_interrupt>
  1a:	1e c0       	rjmp	.+60     	; 0x58 <__bad_interrupt>
  1c:	65 c0       	rjmp	.+202    	; 0xe8 <__vector_14>
  1e:	1c c0       	rjmp	.+56     	; 0x58 <__bad_interrupt>
  20:	1b c0       	rjmp	.+54     	; 0x58 <__bad_interrupt>
  22:	1a c0       	rjmp	.+52     	; 0x58 <__bad_interrupt>
  24:	19 c0       	rjmp	.+50     	; 0x58 <__bad_interrupt>

00000026 <__ctors_end>:
  26:	11 24       	eor	r1, r1
  28:	1f be       	out	0x3f, r1	; 63
  2a:	cf ed       	ldi	r28, 0xDF	; 223
  2c:	cd bf       	out	0x3d, r28	; 61

0000002e <__do_copy_data>:
  2e:	10 e0       	ldi	r17, 0x00	; 0
  30:	a0 e6       	ldi	r26, 0x60	; 96
  32:	b0 e0       	ldi	r27, 0x00	; 0
  34:	ec ee       	ldi	r30, 0xEC	; 236
  36:	f2 e0       	ldi	r31, 0x02	; 2
  38:	02 c0       	rjmp	.+4      	; 0x3e <__SP_L__+0x1>
  3a:	05 90       	lpm	r0, Z+
  3c:	0d 92       	st	X+, r0
  3e:	ac 37       	cpi	r26, 0x7C	; 124
  40:	b1 07       	cpc	r27, r17
  42:	d9 f7       	brne	.-10     	; 0x3a <__do_copy_data+0xc>

00000044 <__do_clear_bss>:
  44:	10 e0       	ldi	r17, 0x00	; 0
  46:	ac e7       	ldi	r26, 0x7C	; 124
  48:	b0 e0       	ldi	r27, 0x00	; 0
  4a:	01 c0       	rjmp	.+2      	; 0x4e <.do_clear_bss_start>

0000004c <.do_clear_bss_loop>:
  4c:	1d 92       	st	X+, r1

0000004e <.do_clear_bss_start>:
  4e:	ad 37       	cpi	r26, 0x7D	; 125
  50:	b1 07       	cpc	r27, r17
  52:	e1 f7       	brne	.-8      	; 0x4c <.do_clear_bss_loop>
  54:	7a d0       	rcall	.+244    	; 0x14a <main>
  56:	48 c1       	rjmp	.+656    	; 0x2e8 <_exit>

00000058 <__bad_interrupt>:
  58:	d3 cf       	rjmp	.-90     	; 0x0 <__vectors>

0000005a <bcd_to_seg>:
  5a:	1f 93       	push	r17
  5c:	cf 93       	push	r28
  5e:	df 93       	push	r29
  60:	ec 01       	movw	r28, r24
  62:	fa 01       	movw	r30, r20
  64:	20 e0       	ldi	r18, 0x00	; 0
  66:	30 e0       	ldi	r19, 0x00	; 0
  68:	70 e0       	ldi	r23, 0x00	; 0
  6a:	a9 91       	ld	r26, Y+
  6c:	a3 31       	cpi	r26, 0x13	; 19
  6e:	28 f4       	brcc	.+10     	; 0x7a <bcd_to_seg+0x20>
  70:	b0 e0       	ldi	r27, 0x00	; 0
  72:	a8 59       	subi	r26, 0x98	; 152
  74:	bf 4f       	sbci	r27, 0xFF	; 255
  76:	1c 91       	ld	r17, X
  78:	01 c0       	rjmp	.+2      	; 0x7c <bcd_to_seg+0x22>
  7a:	10 e0       	ldi	r17, 0x00	; 0
  7c:	21 11       	cpse	r18, r1
  7e:	05 c0       	rjmp	.+10     	; 0x8a <bcd_to_seg+0x30>
  80:	dc 01       	movw	r26, r24
  82:	4c 91       	ld	r20, X
  84:	41 11       	cpse	r20, r1
  86:	01 c0       	rjmp	.+2      	; 0x8a <bcd_to_seg+0x30>
  88:	10 e0       	ldi	r17, 0x00	; 0
  8a:	ab 01       	movw	r20, r22
  8c:	02 2e       	mov	r0, r18
  8e:	02 c0       	rjmp	.+4      	; 0x94 <bcd_to_seg+0x3a>
  90:	55 95       	asr	r21
  92:	47 95       	ror	r20
  94:	0a 94       	dec	r0
  96:	e2 f7       	brpl	.-8      	; 0x90 <bcd_to_seg+0x36>
  98:	40 ff       	sbrs	r20, 0
  9a:	02 c0       	rjmp	.+4      	; 0xa0 <bcd_to_seg+0x46>
  9c:	40 e8       	ldi	r20, 0x80	; 128
  9e:	01 c0       	rjmp	.+2      	; 0xa2 <bcd_to_seg+0x48>
  a0:	40 e0       	ldi	r20, 0x00	; 0
  a2:	a1 2f       	mov	r26, r17
  a4:	a4 2b       	or	r26, r20
  a6:	a1 93       	st	Z+, r26
  a8:	2f 5f       	subi	r18, 0xFF	; 255
  aa:	3f 4f       	sbci	r19, 0xFF	; 255
  ac:	24 30       	cpi	r18, 0x04	; 4
  ae:	31 05       	cpc	r19, r1
  b0:	e1 f6       	brne	.-72     	; 0x6a <bcd_to_seg+0x10>
  b2:	80 e0       	ldi	r24, 0x00	; 0
  b4:	90 e0       	ldi	r25, 0x00	; 0
  b6:	df 91       	pop	r29
  b8:	cf 91       	pop	r28
  ba:	1f 91       	pop	r17
  bc:	08 95       	ret

000000be <bin_to_bcd>:
  be:	cf 93       	push	r28
  c0:	df 93       	push	r29
  c2:	9b 01       	movw	r18, r22
  c4:	44 e0       	ldi	r20, 0x04	; 4
  c6:	ea e0       	ldi	r30, 0x0A	; 10
  c8:	f0 e0       	ldi	r31, 0x00	; 0
  ca:	41 50       	subi	r20, 0x01	; 1
  cc:	40 f0       	brcs	.+16     	; 0xde <bin_to_bcd+0x20>
  ce:	e9 01       	movw	r28, r18
  d0:	c4 0f       	add	r28, r20
  d2:	d1 1d       	adc	r29, r1
  d4:	bf 01       	movw	r22, r30
  d6:	f4 d0       	rcall	.+488    	; 0x2c0 <__udivmodhi4>
  d8:	88 83       	st	Y, r24
  da:	cb 01       	movw	r24, r22
  dc:	f6 cf       	rjmp	.-20     	; 0xca <bin_to_bcd+0xc>
  de:	80 e0       	ldi	r24, 0x00	; 0
  e0:	90 e0       	ldi	r25, 0x00	; 0
  e2:	df 91       	pop	r29
  e4:	cf 91       	pop	r28
  e6:	08 95       	ret

000000e8 <__vector_14>:
  e8:	1f 92       	push	r1
  ea:	0f 92       	push	r0
  ec:	0f b6       	in	r0, 0x3f	; 63
  ee:	0f 92       	push	r0
  f0:	11 24       	eor	r1, r1
  f2:	8f 93       	push	r24
  f4:	ef 93       	push	r30
  f6:	ff 93       	push	r31
  f8:	80 91 7c 00 	lds	r24, 0x007C
  fc:	8f 5f       	subi	r24, 0xFF	; 255
  fe:	83 70       	andi	r24, 0x03	; 3
 100:	80 93 7c 00 	sts	0x007C, r24
 104:	8b b3       	in	r24, 0x1b	; 27
 106:	8f 70       	andi	r24, 0x0F	; 15
 108:	8b bb       	out	0x1b, r24	; 27
 10a:	e0 91 7c 00 	lds	r30, 0x007C
 10e:	f0 e0       	ldi	r31, 0x00	; 0
 110:	ec 59       	subi	r30, 0x9C	; 156
 112:	ff 4f       	sbci	r31, 0xFF	; 255
 114:	80 81       	ld	r24, Z
 116:	80 95       	com	r24
 118:	88 bb       	out	0x18, r24	; 24
 11a:	80 91 7c 00 	lds	r24, 0x007C
 11e:	81 30       	cpi	r24, 0x01	; 1
 120:	49 f0       	breq	.+18     	; 0x134 <__vector_14+0x4c>
 122:	30 f0       	brcs	.+12     	; 0x130 <__vector_14+0x48>
 124:	82 30       	cpi	r24, 0x02	; 2
 126:	41 f0       	breq	.+16     	; 0x138 <__vector_14+0x50>
 128:	83 30       	cpi	r24, 0x03	; 3
 12a:	39 f4       	brne	.+14     	; 0x13a <__vector_14+0x52>
 12c:	dc 9a       	sbi	0x1b, 4	; 27
 12e:	05 c0       	rjmp	.+10     	; 0x13a <__vector_14+0x52>
 130:	df 9a       	sbi	0x1b, 7	; 27
 132:	03 c0       	rjmp	.+6      	; 0x13a <__vector_14+0x52>
 134:	de 9a       	sbi	0x1b, 6	; 27
 136:	01 c0       	rjmp	.+2      	; 0x13a <__vector_14+0x52>
 138:	dd 9a       	sbi	0x1b, 5	; 27
 13a:	ff 91       	pop	r31
 13c:	ef 91       	pop	r30
 13e:	8f 91       	pop	r24
 140:	0f 90       	pop	r0
 142:	0f be       	out	0x3f, r0	; 63
 144:	0f 90       	pop	r0
 146:	1f 90       	pop	r1
 148:	18 95       	reti

0000014a <main>:
 14a:	f8 94       	cli
 14c:	80 e8       	ldi	r24, 0x80	; 128
 14e:	87 b9       	out	0x07, r24	; 7
 150:	93 e0       	ldi	r25, 0x03	; 3
 152:	91 b9       	out	0x01, r25	; 1
 154:	80 e1       	ldi	r24, 0x10	; 16
 156:	83 b9       	out	0x03, r24	; 3
 158:	26 ec       	ldi	r18, 0xC6	; 198
 15a:	26 b9       	out	0x06, r18	; 6
 15c:	20 ef       	ldi	r18, 0xF0	; 240
 15e:	2a bb       	out	0x1a, r18	; 26
 160:	d3 9a       	sbi	0x1a, 3	; 26
 162:	2f ef       	ldi	r18, 0xFF	; 255
 164:	27 bb       	out	0x17, r18	; 23
 166:	24 e0       	ldi	r18, 0x04	; 4
 168:	2b bb       	out	0x1b, r18	; 27
 16a:	21 e0       	ldi	r18, 0x01	; 1
 16c:	25 bb       	out	0x15, r18	; 21
 16e:	93 bf       	out	0x33, r25	; 51
 170:	89 bf       	out	0x39, r24	; 57
 172:	83 e2       	ldi	r24, 0x23	; 35
 174:	83 bb       	out	0x13, r24	; 19
 176:	78 94       	sei
 178:	f1 2c       	mov	r15, r1
 17a:	74 e0       	ldi	r23, 0x04	; 4
 17c:	a7 2e       	mov	r10, r23
 17e:	bb 24       	eor	r11, r11
 180:	b3 94       	inc	r11
 182:	dd 24       	eor	r13, r13
 184:	d3 94       	inc	r13
 186:	c1 2c       	mov	r12, r1
 188:	e4 e6       	ldi	r30, 0x64	; 100
 18a:	ee 2e       	mov	r14, r30
 18c:	c0 e0       	ldi	r28, 0x00	; 0
 18e:	d0 e0       	ldi	r29, 0x00	; 0
 190:	80 e0       	ldi	r24, 0x00	; 0
 192:	90 e0       	ldi	r25, 0x00	; 0
 194:	30 e0       	ldi	r19, 0x00	; 0
 196:	99 24       	eor	r9, r9
 198:	93 94       	inc	r9
 19a:	fa e0       	ldi	r31, 0x0A	; 10
 19c:	8f 2e       	mov	r8, r31
 19e:	ae e0       	ldi	r26, 0x0E	; 14
 1a0:	7a 2e       	mov	r7, r26
 1a2:	bf e0       	ldi	r27, 0x0F	; 15
 1a4:	6b 2e       	mov	r6, r27
 1a6:	10 e1       	ldi	r17, 0x10	; 16
 1a8:	51 2e       	mov	r5, r17
 1aa:	0b e0       	ldi	r16, 0x0B	; 11
 1ac:	40 2e       	mov	r4, r16
 1ae:	2c e0       	ldi	r18, 0x0C	; 12
 1b0:	32 2e       	mov	r3, r18
 1b2:	4d e0       	ldi	r20, 0x0D	; 13
 1b4:	24 2e       	mov	r2, r20
 1b6:	0e ef       	ldi	r16, 0xFE	; 254
 1b8:	15 e0       	ldi	r17, 0x05	; 5
 1ba:	69 b3       	in	r22, 0x19	; 25
 1bc:	64 70       	andi	r22, 0x04	; 4
 1be:	70 e0       	ldi	r23, 0x00	; 0
 1c0:	4a 2d       	mov	r20, r10
 1c2:	50 e0       	ldi	r21, 0x00	; 0
 1c4:	64 17       	cp	r22, r20
 1c6:	75 07       	cpc	r23, r21
 1c8:	31 f0       	breq	.+12     	; 0x1d6 <main+0x8c>
 1ca:	fa 94       	dec	r15
 1cc:	31 f4       	brne	.+12     	; 0x1da <main+0x90>
 1ce:	24 e0       	ldi	r18, 0x04	; 4
 1d0:	a2 26       	eor	r10, r18
 1d2:	09 f4       	brne	.+2      	; 0x1d6 <main+0x8c>
 1d4:	d9 24       	eor	r13, r9
 1d6:	64 e6       	ldi	r22, 0x64	; 100
 1d8:	f6 2e       	mov	r15, r22
 1da:	36 99       	sbic	0x06, 6	; 6
 1dc:	ee cf       	rjmp	.-36     	; 0x1ba <main+0x70>
 1de:	3f 5f       	subi	r19, 0xFF	; 255
 1e0:	44 b1       	in	r20, 0x04	; 4
 1e2:	55 b1       	in	r21, 0x05	; 5
 1e4:	84 0f       	add	r24, r20
 1e6:	95 1f       	adc	r25, r21
 1e8:	30 31       	cpi	r19, 0x10	; 16
 1ea:	09 f0       	breq	.+2      	; 0x1ee <main+0xa4>
 1ec:	56 c0       	rjmp	.+172    	; 0x29a <main+0x150>
 1ee:	96 95       	lsr	r25
 1f0:	87 95       	ror	r24
 1f2:	96 95       	lsr	r25
 1f4:	87 95       	ror	r24
 1f6:	8c 0f       	add	r24, r28
 1f8:	9d 1f       	adc	r25, r29
 1fa:	24 97       	sbiw	r28, 0x04	; 4
 1fc:	33 e0       	ldi	r19, 0x03	; 3
 1fe:	d6 95       	lsr	r29
 200:	c7 95       	ror	r28
 202:	3a 95       	dec	r19
 204:	e1 f7       	brne	.-8      	; 0x1fe <main+0xb4>
 206:	9c 01       	movw	r18, r24
 208:	2c 1b       	sub	r18, r28
 20a:	3d 0b       	sbc	r19, r29
 20c:	e9 01       	movw	r28, r18
 20e:	c9 01       	movw	r24, r18
 210:	43 e0       	ldi	r20, 0x03	; 3
 212:	96 95       	lsr	r25
 214:	87 95       	ror	r24
 216:	4a 95       	dec	r20
 218:	e1 f7       	brne	.-8      	; 0x212 <main+0xc8>
 21a:	6c e0       	ldi	r22, 0x0C	; 12
 21c:	70 e0       	ldi	r23, 0x00	; 0
 21e:	3f d0       	rcall	.+126    	; 0x29e <__mulhi3>
 220:	55 e0       	ldi	r21, 0x05	; 5
 222:	96 95       	lsr	r25
 224:	87 95       	ror	r24
 226:	5a 95       	dec	r21
 228:	e1 f7       	brne	.-8      	; 0x222 <main+0xd8>
 22a:	b1 10       	cpse	r11, r1
 22c:	04 c0       	rjmp	.+8      	; 0x236 <main+0xec>
 22e:	98 01       	movw	r18, r16
 230:	28 1b       	sub	r18, r24
 232:	39 0b       	sbc	r19, r25
 234:	c9 01       	movw	r24, r18
 236:	e1 10       	cpse	r14, r1
 238:	06 c0       	rjmp	.+12     	; 0x246 <main+0xfc>
 23a:	60 e6       	ldi	r22, 0x60	; 96
 23c:	70 e0       	ldi	r23, 0x00	; 0
 23e:	3f df       	rcall	.-386    	; 0xbe <bin_to_bcd>
 240:	92 e0       	ldi	r25, 0x02	; 2
 242:	c9 2e       	mov	r12, r25
 244:	01 c0       	rjmp	.+2      	; 0x248 <main+0xfe>
 246:	ea 94       	dec	r14
 248:	db 14       	cp	r13, r11
 24a:	f1 f0       	breq	.+60     	; 0x288 <main+0x13e>
 24c:	80 92 60 00 	sts	0x0060, r8
 250:	87 b1       	in	r24, 0x07	; 7
 252:	80 7e       	andi	r24, 0xE0	; 224
 254:	87 b9       	out	0x07, r24	; 7
 256:	dd 20       	and	r13, r13
 258:	59 f0       	breq	.+22     	; 0x270 <main+0x126>
 25a:	87 b1       	in	r24, 0x07	; 7
 25c:	87 b9       	out	0x07, r24	; 7
 25e:	40 92 61 00 	sts	0x0061, r4
 262:	30 92 62 00 	sts	0x0062, r3
 266:	20 92 63 00 	sts	0x0063, r2
 26a:	db 98       	cbi	0x1b, 3	; 27
 26c:	bd 2c       	mov	r11, r13
 26e:	09 c0       	rjmp	.+18     	; 0x282 <main+0x138>
 270:	38 9a       	sbi	0x07, 0	; 7
 272:	70 92 61 00 	sts	0x0061, r7
 276:	60 92 62 00 	sts	0x0062, r6
 27a:	50 92 63 00 	sts	0x0063, r5
 27e:	db 9a       	sbi	0x1b, 3	; 27
 280:	b1 2c       	mov	r11, r1
 282:	c1 2c       	mov	r12, r1
 284:	8c e3       	ldi	r24, 0x3C	; 60
 286:	e8 2e       	mov	r14, r24
 288:	44 e6       	ldi	r20, 0x64	; 100
 28a:	50 e0       	ldi	r21, 0x00	; 0
 28c:	6c 2d       	mov	r22, r12
 28e:	80 e6       	ldi	r24, 0x60	; 96
 290:	90 e0       	ldi	r25, 0x00	; 0
 292:	e3 de       	rcall	.-570    	; 0x5a <bcd_to_seg>
 294:	80 e0       	ldi	r24, 0x00	; 0
 296:	90 e0       	ldi	r25, 0x00	; 0
 298:	30 e0       	ldi	r19, 0x00	; 0
 29a:	36 9a       	sbi	0x06, 6	; 6
 29c:	8e cf       	rjmp	.-228    	; 0x1ba <main+0x70>

0000029e <__mulhi3>:
 29e:	00 24       	eor	r0, r0
 2a0:	55 27       	eor	r21, r21
 2a2:	04 c0       	rjmp	.+8      	; 0x2ac <__mulhi3+0xe>
 2a4:	08 0e       	add	r0, r24
 2a6:	59 1f       	adc	r21, r25
 2a8:	88 0f       	add	r24, r24
 2aa:	99 1f       	adc	r25, r25
 2ac:	00 97       	sbiw	r24, 0x00	; 0
 2ae:	29 f0       	breq	.+10     	; 0x2ba <__mulhi3+0x1c>
 2b0:	76 95       	lsr	r23
 2b2:	67 95       	ror	r22
 2b4:	b8 f3       	brcs	.-18     	; 0x2a4 <__mulhi3+0x6>
 2b6:	71 05       	cpc	r23, r1
 2b8:	b9 f7       	brne	.-18     	; 0x2a8 <__mulhi3+0xa>
 2ba:	80 2d       	mov	r24, r0
 2bc:	95 2f       	mov	r25, r21
 2be:	08 95       	ret

000002c0 <__udivmodhi4>:
 2c0:	aa 1b       	sub	r26, r26
 2c2:	bb 1b       	sub	r27, r27
 2c4:	51 e1       	ldi	r21, 0x11	; 17
 2c6:	07 c0       	rjmp	.+14     	; 0x2d6 <__udivmodhi4_ep>

000002c8 <__udivmodhi4_loop>:
 2c8:	aa 1f       	adc	r26, r26
 2ca:	bb 1f       	adc	r27, r27
 2cc:	a6 17       	cp	r26, r22
 2ce:	b7 07       	cpc	r27, r23
 2d0:	10 f0       	brcs	.+4      	; 0x2d6 <__udivmodhi4_ep>
 2d2:	a6 1b       	sub	r26, r22
 2d4:	b7 0b       	sbc	r27, r23

000002d6 <__udivmodhi4_ep>:
 2d6:	88 1f       	adc	r24, r24
 2d8:	99 1f       	adc	r25, r25
 2da:	5a 95       	dec	r21
 2dc:	a9 f7       	brne	.-22     	; 0x2c8 <__udivmodhi4_loop>
 2de:	80 95       	com	r24
 2e0:	90 95       	com	r25
 2e2:	bc 01       	movw	r22, r24
 2e4:	cd 01       	movw	r24, r26
 2e6:	08 95       	ret

000002e8 <_exit>:
 2e8:	f8 94       	cli

000002ea <__stop_program>:
 2ea:	ff cf       	rjmp	.-2      	; 0x2ea <__stop_program>
