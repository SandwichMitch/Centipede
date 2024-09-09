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
	.file	"player.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBullet.part.0, %function
fireBullet.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #1
	ldr	r3, .L3
	ldr	r1, .L3+4
	ldr	ip, [r3, #12]
	ldm	r1, {r1, r2}
	sub	r2, r2, ip
	stm	r3, {r1, r2}
	str	r0, [r3, #20]
	bx	lr
.L4:
	.align	2
.L3:
	.word	bullets
	.word	player
	.size	fireBullet.part.0, .-fireBullet.part.0
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #8
	mov	r2, #0
	mov	ip, #152
	mov	r0, #2
	ldr	r3, .L6
	str	r1, [r3, #20]
	str	r1, [r3, #16]
	str	ip, [r3, #4]
	str	r0, [r3, #8]
	str	r2, [r3]
	strb	r2, [r3, #44]
	bx	lr
.L7:
	.align	2
.L6:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #1
	str	lr, [sp, #-4]!
	mov	r2, #0
	mov	lr, #6
	mov	ip, #154
	mov	r0, #4
	ldr	r3, .L10
	strb	r1, [r3, #24]
	str	lr, [r3, #12]
	str	ip, [r3, #4]
	str	r0, [r3, #16]
	str	r1, [r3, #8]
	str	r2, [r3]
	str	r2, [r3, #20]
	ldr	lr, [sp], #4
	bx	lr
.L11:
	.align	2
.L10:
	.word	bullets
	.size	initBullets, .-initBullets
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L15
	ldrh	r3, [r3]
	tst	r3, #32
	bne	.L13
	ldr	r1, .L15+4
	ldr	r2, [r1]
	cmp	r2, #0
	ldrgt	r0, [r1, #8]
	subgt	r2, r2, r0
	strgt	r2, [r1]
.L13:
	tst	r3, #16
	bxne	lr
	ldr	r3, .L15+4
	ldr	r1, [r3]
	ldr	r2, [r3, #16]
	add	r2, r1, r2
	cmp	r2, #239
	ldrle	r2, [r3, #8]
	addle	r1, r2, r1
	strle	r1, [r3]
	bx	lr
.L16:
	.align	2
.L15:
	.word	buttons
	.word	player
	.size	updatePlayer, .-updatePlayer
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"hit segment %d! at %d, %d\000"
	.align	2
.LC1:
	.ascii	"score: %d\000"
	.align	2
.LC2:
	.ascii	"new shroom at %d, %d, from segment %d\000"
	.text
	.align	2
	.global	updateBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullets, %function
updateBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L38
	ldrh	r3, [r3]
	ldr	r7, .L38+4
	tst	r3, #1
	sub	sp, sp, #20
	ldr	r3, [r7, #20]
	beq	.L18
	ldr	r2, .L38+8
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L36
.L18:
	cmp	r3, #0
	beq	.L17
.L19:
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #16]
	sub	r3, r3, r2
	ldr	r5, .L38+12
	str	r3, [r7, #4]
	ldr	fp, .L38+16
	ldr	r9, .L38+20
	ldr	r8, .L38+24
	b	.L25
.L21:
	ldr	r3, .L38+28
	add	r5, r5, #52
	cmp	r5, r3
	ldr	r3, [r7, #4]
	beq	.L37
.L25:
	ldr	r0, [r7, #12]
	ldr	r1, [r7, #8]
	ldr	r2, [r7]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp]
	str	r3, [sp, #4]
	add	r2, r5, #28
	ldm	r2, {r2, r3}
	ldm	r5, {r0, r1}
	ldr	ip, .L38+32
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L21
	ldm	r5, {r2, r3}
	ldr	r1, [r5, #40]
	ldr	r0, .L38+36
	mov	lr, pc
	bx	fp
	ldr	r6, [r5, #40]
	ldr	r3, [r9]
	cmp	r3, r6
	blt	.L22
	ldr	r3, .L38+12
	add	r4, r6, r6, lsl #1
	add	r4, r6, r4, lsl #2
	ldr	r10, .L38+40
	add	r4, r3, r4, lsl #2
.L23:
	ldr	r1, [r8]
	ldr	r0, .L38+44
	add	r1, r1, #100
	str	r1, [r8]
	mov	lr, pc
	bx	fp
	mov	ip, #0
	ldm	r4, {r1, r2}
	ldr	r3, [r4, #40]
	str	ip, [r4, #48]
	mov	r0, r10
	mov	lr, pc
	bx	fp
	ldr	r1, [r4, #4]
	ldr	r0, [r4], #52
	add	r2, r1, #7
	cmp	r1, #0
	movlt	r1, r2
	add	r3, r0, #7
	cmp	r0, #0
	movlt	r0, r3
	asr	r1, r1, #3
	ldr	r3, .L38+48
	asr	r0, r0, #3
	mov	lr, pc
	bx	r3
	ldr	r3, [r9]
	add	r6, r6, #1
	cmp	r3, r6
	bge	.L23
	ldr	r6, [r5, #40]
.L22:
	cmp	r6, #0
	subne	r6, r6, #1
	str	r6, [r9]
	b	.L21
.L37:
	cmn	r3, #1
	movlt	r2, #0
	ldrlt	r3, [r7, #12]
	rsblt	r3, r3, #160
	stmlt	r7, {r2, r3}
	strlt	r2, [r7, #20]
.L17:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L36:
	cmp	r3, #0
	bne	.L19
	bl	fireBullet.part.0
	ldr	r3, [r7, #20]
	b	.L18
.L39:
	.align	2
.L38:
	.word	oldButtons
	.word	bullets
	.word	buttons
	.word	centipede
	.word	mgba_printf
	.word	lastPos
	.word	score
	.word	centipede+520
	.word	collision
	.word	.LC0
	.word	.LC2
	.word	.LC1
	.word	newShroom
	.size	updateBullets, .-updateBullets
	.align	2
	.global	fireBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L42
	ldr	r3, [r3, #20]
	cmp	r3, #0
	bxne	lr
	b	fireBullet.part.0
.L43:
	.align	2
.L42:
	.word	bullets
	.size	fireBullet, .-fireBullet
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	r1, .L46
	ldr	r3, [r1]
	ldrb	r2, [r1, #44]	@ zero_extendqisi2
	ldr	r0, .L46+4
	ldrb	lr, [r1, #4]	@ zero_extendqisi2
	ldr	ip, .L46+8
	lsl	r3, r3, #23
	add	r1, r0, r2, lsl #3
	lsr	r3, r3, #23
	lsl	r2, r2, #3
	strh	lr, [r0, r2]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	strh	ip, [r1, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L47:
	.align	2
.L46:
	.word	player
	.word	shadowOAM
	.word	12610
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullets, %function
drawBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L55
	ldr	r3, [r2, #20]
	cmp	r3, #0
	ldrb	r3, [r2, #24]	@ zero_extendqisi2
	beq	.L49
	ldr	r1, [r2]
	ldr	r0, .L55+4
	str	lr, [sp, #-4]!
	ldr	ip, .L55+8
	ldrb	lr, [r2, #4]	@ zero_extendqisi2
	lsl	r1, r1, #23
	add	r2, r0, r3, lsl #3
	lsr	r1, r1, #23
	lsl	r3, r3, #3
	strh	lr, [r0, r3]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	strh	ip, [r2, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L49:
	mov	r1, #512
	ldr	r2, .L55+4
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L56:
	.align	2
.L55:
	.word	bullets
	.word	shadowOAM
	.word	4419
	.size	drawBullets, .-drawBullets
	.comm	player,48,4
	.comm	centipede,520,4
	.comm	direction,1,1
	.comm	mushroomField,1776,4
	.comm	tileIDs,2,2
	.comm	bullets,28,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
