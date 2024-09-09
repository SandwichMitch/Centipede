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
	.file	"game.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"init shrooms!\000"
	.text
	.align	2
	.global	initShrooms
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initShrooms, %function
initShrooms:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L6
	push	{r4, lr}
	ldr	r0, .L6+4
	mov	lr, pc
	bx	r3
	mov	r1, #5
	mov	r2, #0
	mov	r0, #8
	ldr	r3, .L6+8
	add	ip, r3, #1776
.L2:
	str	r1, [r3, #20]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r0, [r3, #12]
	str	r0, [r3, #16]
	str	r2, [r3, #8]
	add	r3, r3, #24
	cmp	r3, ip
	add	r1, r1, #1
	bne	.L2
	pop	{r4, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	mgba_printf
	.word	.LC0
	.word	mushroomField
	.size	initShrooms, .-initShrooms
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"activated shrooms!\000"
	.align	2
.LC2:
	.ascii	"shroom activated at %d, %d, is active %d\000"
	.text
	.align	2
	.global	activateShrooms
	.syntax unified
	.arm
	.fpu softvfp
	.type	activateShrooms, %function
activateShrooms:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	fp, r0
	ldr	r7, .L13
	ldr	r0, .L13+4
	mov	lr, pc
	bx	r7
	cmp	fp, #0
	ble	.L9
	ldr	r4, .L13+8
	add	r6, fp, fp, lsl #1
	ldr	r5, .L13+12
	ldr	r10, .L13+16
	ldr	r9, .L13+20
	ldr	r8, .L13+24
	add	r6, r4, r6, lsl #3
.L10:
	mov	lr, pc
	bx	r5
	smull	r3, r2, r10, r0
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #4
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #1
	str	r0, [r4]
	mov	lr, pc
	bx	r5
	mov	r3, #1
	smull	r2, r1, r9, r0
	asr	r2, r0, #31
	rsb	r2, r2, r1, asr #3
	add	r2, r2, r2, lsl #4
	sub	r0, r0, r2
	add	r2, r0, #2
	stmib	r4, {r2, r3}
	ldr	r1, [r4], #24
	mov	r0, r8
	mov	lr, pc
	bx	r7
	cmp	r4, r6
	bne	.L10
.L9:
	ldr	r3, .L13+28
	str	fp, [r3]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	mgba_printf
	.word	.LC1
	.word	mushroomField
	.word	rand
	.word	-2004318071
	.word	2021161081
	.word	.LC2
	.word	activeShrooms
	.size	activateShrooms, .-activateShrooms
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	initShrooms
	ldr	r3, .L19
	ldr	r3, [r3]
	cmp	r3, #1
	moveq	r0, #32
	movne	r0, #64
	bl	activateShrooms
	ldr	r3, .L19+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L19+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L19+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	currentLevel
	.word	initPlayer
	.word	initBullets
	.word	initCentipede
	.size	initGame, .-initGame
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"score: %d\000"
	.text
	.align	2
	.global	updateShrooms
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateShrooms, %function
updateShrooms:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r5, .L45
	ldr	r8, .L45+4
	ldr	r6, .L45+8
	ldr	fp, .L45+12
	sub	sp, sp, #20
	b	.L23
.L43:
	ldr	r3, .L45+16
	add	r5, r5, #24
	cmp	r5, r3
	beq	.L42
.L23:
	ldr	r3, [r5, #8]
	cmp	r3, #0
	beq	.L43
	ldr	r2, [r5, #4]
	ldr	r3, [r5]
	add	ip, r5, #12
	ldm	ip, {ip, lr}
	lsl	r2, r2, #3
	lsl	r3, r3, #3
	ldm	r8, {r0, r1}
	str	r2, [sp, #4]
	str	r3, [sp]
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	add	r2, r8, #8
	ldm	r2, {r2, r3}
	add	r1, r1, #2
	add	r0, r0, #2
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L25
	ldr	r3, [r8, #20]
	cmp	r3, #0
	bne	.L44
.L25:
	mov	r9, #1
	ldr	r4, .L45+20
	ldr	r10, .L45+24
	add	r7, r4, #520
.L26:
	ldr	r2, [r5, #4]
	ldr	r3, [r5]
	lsl	r2, r2, #3
	ldr	r1, [r5, #16]
	str	r2, [sp, #4]
	ldr	r2, [r5, #12]
	lsl	r3, r3, #3
	str	r1, [sp, #12]
	str	r2, [sp, #8]
	ldr	ip, [r4]
	ldr	r0, [r4, #20]
	str	r3, [sp]
	add	r2, r4, #28
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #4]
	add	r0, ip, r0
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L29
	ldr	r3, [r4, #48]
	cmp	r3, #0
	beq	.L29
	add	r2, r4, #8
	ldm	r2, {r2, r3}
	add	r1, r3, #7
	cmp	r3, #0
	movlt	r3, r1
	cmp	r2, #0
	add	r0, r2, #7
	movge	r0, r2
	mov	r2, #3
	asr	r3, r3, r2
	lsl	r3, r3, #5
	add	r3, r3, r0, asr r2
	lsl	r3, r3, #1
	add	r0, r4, #20
	ldm	r0, {r0, ip}
	ldr	r1, [r4, #4]
	ldr	lr, [r4, #40]
	strh	r9, [r10, r3]	@ movhi
	ldr	r3, [fp]
	cmp	lr, r3
	ldr	r3, [r4]
	add	ip, ip, r1
	rsb	r0, r0, #0
	str	r1, [r4, #12]
	str	ip, [r4, #4]
	str	r0, [r4, #20]
	str	r2, [r4, #44]
	str	r3, [r4, #8]
	bne	.L29
	add	r2, r1, #7
	cmp	r1, #0
	movlt	r1, r2
	cmp	r3, #0
	add	r2, r3, #7
	movge	r2, r3
	asr	r3, r1, #3
	lsl	r3, r3, #5
	add	r3, r3, r2, asr #3
	lsl	r3, r3, #1
	strh	r9, [r10, r3]	@ movhi
.L29:
	add	r4, r4, #52
	cmp	r4, r7
	bne	.L26
	ldr	r3, .L45+16
	add	r5, r5, #24
	cmp	r5, r3
	bne	.L23
.L42:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L44:
	mov	r3, #0
	ldr	ip, .L45+28
	ldr	r1, [ip]
	ldr	r2, .L45+32
	add	r1, r1, #10
	str	r3, [r5, #8]
	str	r3, [r8, #20]
	ldr	r0, .L45+36
	str	r1, [ip]
	mov	lr, pc
	bx	r2
	b	.L25
.L46:
	.align	2
.L45:
	.word	mushroomField
	.word	bullets
	.word	collision
	.word	lastPos
	.word	mushroomField+1776
	.word	centipede
	.word	100679680
	.word	score
	.word	mgba_printf
	.word	.LC3
	.size	updateShrooms, .-updateShrooms
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L49
	mov	lr, pc
	bx	r3
	ldr	r3, .L49+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L49+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	updateShrooms
.L50:
	.align	2
.L49:
	.word	updatePlayer
	.word	updateBullets
	.word	updateCentipede
	.size	updateGame, .-updateGame
	.section	.rodata.str1.4
	.align	2
.LC4:
	.ascii	"new shroom called\000"
	.text
	.align	2
	.global	newShroom
	.syntax unified
	.arm
	.fpu softvfp
	.type	newShroom, %function
newShroom:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	lr, #1
	ldr	r2, .L53
	ldr	r3, [r2]
	ldr	ip, .L53+4
	add	r3, r3, lr
	str	r3, [r2]
	add	r3, r3, r3, lsl lr
	add	r2, ip, r3, lsl #3
	str	r0, [ip, r3, lsl #3]
	stmib	r2, {r1, lr}
	ldr	r0, .L53+8
	ldr	r3, .L53+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L54:
	.align	2
.L53:
	.word	activeShrooms
	.word	mushroomField
	.word	.LC4
	.word	mgba_printf
	.size	newShroom, .-newShroom
	.align	2
	.global	drawShrooms
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawShrooms, %function
drawShrooms:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L66
	ldr	ip, [r3]
	cmp	ip, #0
	bxle	lr
	push	{r4, r5, lr}
	mov	r5, #1
	ldr	r3, .L66+4
	add	ip, ip, ip, lsl r5
	ldr	lr, .L66+8
	ldr	r4, .L66+12
	add	ip, r3, ip, lsl #3
.L59:
	ldr	r1, [r3, #4]
	ldr	r0, [r3, #8]
	ldr	r2, [r3]
	cmp	r0, #0
	add	r2, r2, r1, lsl #5
	lsl	r1, r2, #1
	add	r3, r3, #24
	lsleq	r2, r2, #1
	strhne	r4, [lr, r1]	@ movhi
	strheq	r5, [lr, r2]	@ movhi
	cmp	ip, r3
	bne	.L59
	pop	{r4, r5, lr}
	bx	lr
.L67:
	.align	2
.L66:
	.word	activeShrooms
	.word	mushroomField
	.word	100679680
	.word	12546
	.size	drawShrooms, .-drawShrooms
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L70
	mov	lr, pc
	bx	r3
	ldr	r3, .L70+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L70+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	drawShrooms
.L71:
	.align	2
.L70:
	.word	drawPlayer
	.word	drawBullets
	.word	drawCentipede
	.size	drawGame, .-drawGame
	.align	2
	.global	clearAll
	.syntax unified
	.arm
	.fpu softvfp
	.type	clearAll, %function
clearAll:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #0
	ldr	r3, .L78
	add	r2, r3, #1776
.L73:
	str	r1, [r3, #8]
	add	r3, r3, #24
	cmp	r3, r2
	bne	.L73
	mov	r2, #0
	mov	r1, #1
.L74:
	lsl	r3, r2, #1
	add	r3, r3, #100663296
	add	r2, r2, #1
	add	r0, r3, #16384
	cmp	r2, #600
	add	r3, r3, #43008
	strh	r1, [r0]	@ movhi
	strh	r1, [r3]	@ movhi
	bne	.L74
	bx	lr
.L79:
	.align	2
.L78:
	.word	mushroomField
	.size	clearAll, .-clearAll
	.align	2
	.global	clearBG
	.syntax unified
	.arm
	.fpu softvfp
	.type	clearBG, %function
clearBG:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	mov	r1, #1
.L81:
	lsl	r3, r2, #1
	add	r3, r3, #100663296
	add	r2, r2, #1
	add	r0, r3, #16384
	cmp	r2, #600
	add	r3, r3, #43008
	strh	r1, [r0]	@ movhi
	strh	r1, [r3]	@ movhi
	bne	.L81
	bx	lr
	.size	clearBG, .-clearBG
	.comm	lastContact,4,4
	.comm	activeShrooms,4,4
	.comm	centipede,520,4
	.comm	direction,1,1
	.comm	bullets,28,4
	.comm	mushroomField,1776,4
	.comm	tileIDs,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
