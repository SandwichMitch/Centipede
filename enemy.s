	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"enemy.c"
	.text
	.align	2
	.global	initCentipede
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCentipede, %function
initCentipede:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	push	{r4, lr}
	ldr	r4, .L8
	mov	lr, r1
	mov	r3, r4
	mov	r0, #80
	mov	r2, #8
	mov	ip, #1
	b	.L5
.L2:
	cmp	r1, #9
	str	lr, [r3, #36]
	str	r0, [r3]
	str	r0, [r3, #8]
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	str	ip, [r3, #48]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	ip, [r3, #44]
	str	ip, [r3, #16]
	str	r1, [r3, #40]
	beq	.L4
.L3:
	add	r1, r1, #1
	sub	r0, r0, #8
	add	r3, r3, #52
.L5:
	cmp	r1, #0
	bne	.L2
	str	ip, [r4, #36]
	str	r0, [r3]
	str	r0, [r3, #8]
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	str	ip, [r3, #48]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	ip, [r3, #44]
	str	ip, [r3, #16]
	str	r1, [r3, #40]
	b	.L3
.L4:
	mov	r0, #10
	ldr	r2, .L8+4
	ldr	r3, .L8+8
	str	r0, [r2]
	str	r1, [r3]
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	centipede
	.word	timeUntilMove
	.word	lastPos
	.size	initCentipede, .-initCentipede
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"hit wall, going down!\000"
	.text
	.align	2
	.global	updateCentipede
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCentipede, %function
updateCentipede:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r7, .L23
	ldr	r1, [r7]
	ldr	r5, .L23+4
	ldr	r4, .L23+8
	sub	r1, r1, #1
	str	r1, [r7]
	str	r3, [r5]
	ldr	r10, .L23+12
	ldr	r9, .L23+16
	ldr	r8, .L23+20
	add	r6, r4, #520
	b	.L16
.L22:
	ldr	r2, [r4, #4]
	cmp	r2, #151
	str	r2, [r4, #12]
	movgt	r2, #1
	ldr	r0, [r4, #44]
	ldr	r3, [r4]
	strgt	r2, [r8]
	cmp	r1, #0
	str	r0, [r4, #16]
	str	r3, [r4, #8]
	bne	.L13
	ldr	r2, [r4, #20]
	add	r3, r3, r2
	cmp	r3, #239
	bhi	.L20
	cmp	r2, #0
	str	r3, [r4]
	movge	r3, #1
	strlt	r1, [r4, #44]
	strge	r3, [r4, #44]
.L13:
	add	r4, r4, #52
	cmp	r4, r6
	beq	.L21
.L16:
	ldr	r3, [r4, #48]
	cmp	r3, #0
	bne	.L22
	ldr	r3, [r5]
	add	r4, r4, #52
	add	r3, r3, #1
	cmp	r4, r6
	str	r3, [r5]
	bne	.L16
.L21:
	cmp	r1, #0
	moveq	r3, #15
	streq	r3, [r7]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L20:
	mov	r0, r10
	mov	lr, pc
	bx	r9
	mov	r1, #3
	ldr	r2, [r4, #4]
	ldr	r3, [r4, #24]
	add	r2, r2, r3
	ldr	r3, [r4, #20]
	rsb	r3, r3, #0
	str	r1, [r4, #44]
	str	r2, [r4, #4]
	str	r3, [r4, #20]
	ldr	r1, [r7]
	b	.L13
.L24:
	.align	2
.L23:
	.word	timeUntilMove
	.word	segmentsDestroyed
	.word	centipede
	.word	.LC0
	.word	mgba_printf
	.word	lost
	.size	updateCentipede, .-updateCentipede
	.align	2
	.global	moveCentipedeHelper
	.syntax unified
	.arm
	.fpu softvfp
	.type	moveCentipedeHelper, %function
moveCentipedeHelper:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	moveCentipedeHelper, .-moveCentipedeHelper
	.align	2
	.global	drawCentipede
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCentipede, %function
drawCentipede:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L40
	ldr	r3, .L40+4
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	ip, .L40+8
	mov	r4, #1
	ldr	r5, [r2]
	ldr	r10, .L40+12
	ldr	r9, .L40+16
	ldr	r8, .L40+20
	ldr	r7, .L40+24
	ldr	r6, .L40+28
	add	r0, r3, #520
	b	.L35
.L39:
	ldm	r3, {r2, lr}
	cmp	lr, #0
	add	fp, lr, #7
	add	r1, r2, #7
	movlt	lr, fp
	cmp	r2, #0
	movlt	r2, r1
	asr	lr, lr, #3
	ldr	r1, [r3, #44]
	asr	r2, r2, #3
	add	r2, r2, lr, lsl #5
	cmp	r1, #1
	lsl	r2, r2, #1
	strheq	r6, [ip, r2]	@ movhi
	beq	.L28
	cmp	r1, #0
	strheq	r7, [ip, r2]	@ movhi
	strhne	r8, [ip, r2]	@ movhi
.L28:
	add	r3, r3, #52
	cmp	r0, r3
	beq	.L38
.L35:
	ldr	r2, [r3, #48]
	cmp	r2, #0
	beq	.L28
	ldr	r2, [r3, #12]
	ldr	lr, [r3, #8]
	add	r1, r2, #7
	cmp	r2, #0
	movlt	r2, r1
	add	r1, lr, #7
	cmp	lr, #0
	movlt	lr, r1
	asr	r2, r2, #3
	ldr	r1, [r3, #36]
	lsl	r2, r2, #5
	add	r2, r2, lr, asr #3
	lsl	r2, r2, #1
	cmp	r1, #0
	strh	r4, [ip, r2]	@ movhi
	bne	.L39
	ldr	r2, [r3, #40]
	cmp	r2, r5
	beq	.L28
	ldm	r3, {r2, lr}
	cmp	lr, #0
	add	fp, lr, #7
	add	r1, r2, #7
	movlt	lr, fp
	cmp	r2, #0
	movlt	r2, r1
	asr	lr, lr, #3
	ldr	r1, [r3, #44]
	asr	r2, r2, #3
	add	r2, r2, lr, lsl #5
	cmp	r1, #1
	lsl	r2, r2, #1
	strheq	r9, [ip, r2]	@ movhi
	beq	.L28
	cmp	r1, #0
	ldreq	r1, .L40+32
	add	r3, r3, #52
	strheq	r1, [ip, r2]	@ movhi
	strhne	r10, [ip, r2]	@ movhi
	cmp	r0, r3
	bne	.L35
.L38:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	lastPos
	.word	centipede
	.word	100679680
	.word	8292
	.word	8228
	.word	8290
	.word	9250
	.word	8226
	.word	9252
	.size	drawCentipede, .-drawCentipede
	.comm	lastPos,4,4
	.comm	segmentsDestroyed,4,4
	.comm	timeUntilMove,4,4
	.comm	mushroomField,1776,4
	.comm	tileIDs,2,2
	.comm	bullets,28,4
	.comm	centipede,520,4
	.comm	direction,1,1
	.ident	"GCC: (devkitARM release 53) 9.1.0"
