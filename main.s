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
	.file	"main.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"000000\000"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r2, .L4+4
	ldm	r2, {r0, r1}
	ldr	r2, .L4+8
	str	r0, [r2]
	ldr	r0, .L4+12
	strh	r1, [r2, #4]	@ movhi
	lsr	r1, r1, #16
	ldr	lr, .L4+16
	ldr	ip, .L4+20
	strb	r1, [r2, #6]
	strb	r3, [r0]
	str	r3, [lr]
	str	r3, [ip]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	clearBG
	.word	.LC0
	.word	.LANCHOR0
	.word	state
	.word	rSeed
	.word	score
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L8
	mov	lr, pc
	bx	r3
	mov	lr, #0
	mov	r0, #67108864
	mov	r2, #4864
	ldr	r3, .L8+4
	ldr	ip, .L8+8
	ldrh	r4, [r3, #48]
	ldr	r1, .L8+12
	strh	r4, [ip]	@ movhi
	ldr	r3, .L8+16
	ldr	ip, .L8+20
	ldr	r5, .L8+24
	strh	lr, [r3]	@ movhi
	ldr	r4, .L8+28
	strh	r2, [r0]	@ movhi
	mov	r3, #256
	strh	r1, [r0, #8]	@ movhi
	mov	r2, #83886080
	strh	ip, [r0, #10]	@ movhi
	ldr	r1, .L8+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, r5
	mov	r3, #16384
	mov	r2, #100663296
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, r5
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L8+36
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	mgba_open
	.word	67109120
	.word	buttons
	.word	2049
	.word	oldButtons
	.word	5388
	.word	hw5tilesTiles
	.word	DMANow
	.word	hw5tilesPal
	.word	100712448
	.size	initialize, .-initialize
	.align	2
	.global	goToLevel1
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLevel1, %function
goToLevel1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, #1
	ldr	r6, .L12
	ldr	r3, .L12+4
	mov	lr, pc
	bx	r3
	ldr	r7, .L12+8
	ldr	ip, .L12+12
	ldr	r4, .L12+16
	mov	r1, r6
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	str	r5, [ip]
	mov	lr, pc
	bx	r4
	mov	r1, r7
	mov	r3, #16384
	mov	r2, #100663296
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, r7
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L12+20
	mov	lr, pc
	bx	r4
	mov	r1, r6
	mov	r0, #3
	ldr	r2, .L12+24
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+28
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L12+32
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+36
	strb	r5, [r3]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	hw5tilesPal
	.word	clearBG
	.word	hw5tilesTiles
	.word	currentLevel
	.word	DMANow
	.word	100728832
	.word	83886592
	.word	waitForVBlank
	.word	shadowOAM
	.word	state
	.size	goToLevel1, .-goToLevel1
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"CENTIPEDE\000"
	.align	2
.LC2:
	.ascii	"PRESS START TO PLAY\000"
	.text
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, #0
	mov	r3, #67
	ldr	r1, .L29
	ldr	r0, [r1]
	ldr	lr, .L29+4
	ldr	r2, .L29+8
	add	r0, r0, #1
	str	r4, [lr]
	rsb	ip, r2, #296
	str	r0, [r1]
	ldr	r5, .L29+12
	ldr	r4, .L29+16
	ldr	lr, .L29+20
	add	ip, ip, #2
.L16:
	sub	r3, r3, #48
	and	r3, r3, #255
	cmp	r3, #42
	movhi	r1, r5
	lsl	r3, r3, #1
	ldrhls	r1, [r4, r3]
	add	r3, r2, ip
	lsl	r3, r3, #1
	strh	r1, [lr, r3]	@ movhi
	ldrb	r3, [r2, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L16
	mov	r3, #80
	ldr	r2, .L29+24
	ldr	r5, .L29+12
	rsb	ip, r2, #324
	ldr	r4, .L29+16
	ldr	lr, .L29+20
	add	ip, ip, #1
.L18:
	sub	r3, r3, #48
	and	r3, r3, #255
	cmp	r3, #42
	movhi	r1, r5
	lsl	r3, r3, #1
	ldrhls	r1, [r4, r3]
	add	r3, r2, ip
	lsl	r3, r3, #1
	strh	r1, [lr, r3]	@ movhi
	ldrb	r3, [r2, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L18
	ldr	r3, .L29+28
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L14
	ldr	r3, .L29+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L28
.L14:
	pop	{r4, r5, r6, lr}
	bx	lr
.L28:
	ldr	r3, .L29+36
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L29+40
	ldr	r3, .L29+44
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	b	goToLevel1
.L30:
	.align	2
.L29:
	.word	rSeed
	.word	lost
	.word	.LC1
	.word	65535
	.word	.LANCHOR1
	.word	100679680
	.word	.LC2
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	currentLevel
	.word	initGame
	.size	start, .-start
	.align	2
	.global	goToLevel2
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLevel2, %function
goToLevel2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L33
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L33+4
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	clearBG
	.word	state
	.size	goToLevel2, .-goToLevel2
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"YOU HAVE PAUSED\000"
	.align	2
.LC4:
	.ascii	"PRESS SELECT TO RESUME\000"
	.align	2
.LC5:
	.ascii	"PRESS START TO PLAY AGAIN\000"
	.text
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #89
	ldr	r2, .L68
	push	{r4, r5, r6, lr}
	ldr	ip, .L68+4
	ldr	r4, .L68+8
	ldr	lr, .L68+12
	rsb	r0, r2, #296
.L37:
	sub	r3, r3, #48
	and	r3, r3, #255
	cmp	r3, #42
	movhi	r1, r4
	lsl	r3, r3, #1
	ldrhls	r1, [lr, r3]
	add	r3, r2, r0
	lsl	r3, r3, #1
	strh	r1, [ip, r3]	@ movhi
	ldrb	r3, [r2, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L37
	mov	r3, #80
	ldr	r2, .L68+16
	ldr	r4, .L68+8
	ldr	lr, .L68+12
	ldr	ip, .L68+4
	rsb	r0, r2, #324
.L39:
	sub	r3, r3, #48
	and	r3, r3, #255
	cmp	r3, #42
	movhi	r1, r4
	lsl	r3, r3, #1
	ldrhls	r1, [lr, r3]
	add	r3, r2, r0
	lsl	r3, r3, #1
	strh	r1, [ip, r3]	@ movhi
	ldrb	r3, [r2, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L39
	mov	r3, #80
	ldr	r2, .L68+20
	ldr	r4, .L68+8
	rsb	r0, r2, #352
	ldr	lr, .L68+12
	ldr	ip, .L68+24
	add	r0, r0, #3
.L41:
	sub	r3, r3, #48
	and	r3, r3, #255
	cmp	r3, #42
	movhi	r1, r4
	lsl	r3, r3, #1
	ldrhls	r1, [lr, r3]
	add	r3, r2, r0
	lsl	r3, r3, #1
	strh	r1, [ip, r3]	@ movhi
	ldrb	r3, [r2, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L41
	ldr	r4, .L68+28
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L42
	ldr	r5, .L68+32
	ldrh	r3, [r5]
	tst	r3, #4
	bne	.L43
	ldr	r6, .L68+36
	ldr	r3, [r6]
	cmp	r3, #1
	beq	.L65
.L44:
	ldr	r5, [r6]
	cmp	r5, #2
	beq	.L66
.L43:
	ldrh	r3, [r4]
.L42:
	tst	r3, #8
	beq	.L35
	ldr	r3, .L68+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L67
.L35:
	pop	{r4, r5, r6, lr}
	bx	lr
.L67:
	ldr	r3, .L68+40
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	b	goToStart
.L66:
	ldr	r3, .L68+44
	mov	lr, pc
	bx	r3
	ldr	r2, .L68+48
	ldrh	r3, [r4]
	strb	r5, [r2]
	b	.L42
.L65:
	bl	goToLevel1
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L42
	ldrh	r3, [r5]
	tst	r3, #4
	beq	.L44
	b	.L43
.L69:
	.align	2
.L68:
	.word	.LC3
	.word	100706304
	.word	65535
	.word	.LANCHOR1
	.word	.LC4
	.word	.LC5
	.word	100679680
	.word	oldButtons
	.word	buttons
	.word	currentLevel
	.word	clearAll
	.word	clearBG
	.word	state
	.size	pause, .-pause
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L72
	mov	lr, pc
	bx	r3
	ldr	r3, .L72+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L72+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L72+12
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L72+16
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L73:
	.align	2
.L72:
	.word	clearBG
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	state
	.size	goToPause, .-goToPause
	.section	.rodata.str1.4
	.align	2
.LC6:
	.ascii	"YOU LOST\000"
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #89
	ldr	r2, .L89
	push	{r4, lr}
	ldr	ip, .L89+4
	ldr	r4, .L89+8
	ldr	lr, .L89+12
	rsb	r0, r2, #300
.L76:
	sub	r3, r3, #48
	and	r3, r3, #255
	cmp	r3, #42
	movhi	r1, r4
	lsl	r3, r3, #1
	ldrhls	r1, [lr, r3]
	add	r3, r2, r0
	lsl	r3, r3, #1
	strh	r1, [ip, r3]	@ movhi
	ldrb	r3, [r2, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L76
	mov	r3, #80
	ldr	r2, .L89+16
	ldr	r4, .L89+8
	rsb	r0, r2, #320
	ldr	lr, .L89+12
	ldr	ip, .L89+4
	add	r0, r0, #3
.L78:
	sub	r3, r3, #48
	and	r3, r3, #255
	cmp	r3, #42
	movhi	r1, r4
	lsl	r3, r3, #1
	ldrhls	r1, [lr, r3]
	add	r3, r2, r0
	lsl	r3, r3, #1
	strh	r1, [ip, r3]	@ movhi
	ldrb	r3, [r2, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L78
	ldr	r3, .L89+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L74
	ldr	r3, .L89+24
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L88
.L74:
	pop	{r4, lr}
	bx	lr
.L88:
	pop	{r4, lr}
	b	goToStart
.L90:
	.align	2
.L89:
	.word	.LC6
	.word	100679680
	.word	65535
	.word	.LANCHOR1
	.word	.LC5
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L93
	mov	lr, pc
	bx	r3
	ldr	r3, .L93+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L93+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L93+12
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L93+16
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L94:
	.align	2
.L93:
	.word	clearAll
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	state
	.size	goToLose, .-goToLose
	.section	.rodata.str1.4
	.align	2
.LC7:
	.ascii	"SCORE\000"
	.align	2
.LC8:
	.ascii	"LEVEL 1\000"
	.align	2
.LC9:
	.ascii	"%06d\000"
	.text
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L120
	mov	lr, pc
	bx	r3
	ldr	r3, .L120+4
	ldr	r1, .L120+8
	ldr	r2, [r3]
	ldr	r0, .L120+12
	ldr	r3, .L120+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L120+20
	mov	lr, pc
	bx	r3
	mov	r2, #0
	mov	r3, #83
	ldr	r1, .L120+24
	ldr	r4, .L120+28
	ldr	lr, .L120+32
	ldr	ip, .L120+36
.L97:
	sub	r3, r3, #48
	and	r3, r3, #255
	cmp	r3, #42
	movhi	r0, r4
	lsl	r3, r3, #1
	ldrhls	r0, [lr, r3]
	lsl	r3, r2, #1
	strh	r0, [ip, r3]	@ movhi
	ldrb	r3, [r1, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	add	r2, r2, #1
	bne	.L97
	ldr	r1, .L120+12
	ldrb	r3, [r1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L101
	ldr	r5, .L120+28
	ldr	r4, .L120+32
	ldr	lr, .L120+36
	rsb	ip, r1, #7
.L98:
	sub	r3, r3, #48
	and	r3, r3, #255
	cmp	r3, #42
	movhi	r0, r5
	lsl	r3, r3, #1
	ldrhls	r0, [r4, r3]
	add	r2, r1, ip
	lsl	r3, r2, #1
	strh	r0, [lr, r3]	@ movhi
	ldrb	r3, [r1, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L98
.L101:
	mov	r3, #76
	ldr	r1, .L120+40
	ldr	r5, .L120+28
	ldr	r4, .L120+32
	ldr	ip, .L120+36
	rsb	lr, r1, #23
.L99:
	sub	r3, r3, #48
	and	r3, r3, #255
	cmp	r3, #42
	movhi	r0, r5
	lsl	r3, r3, #1
	ldrhls	r0, [r4, r3]
	add	r2, r1, lr
	lsl	r3, r2, #1
	strh	r0, [ip, r3]	@ movhi
	ldrb	r3, [r1, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L99
	ldr	r3, .L120+44
	mov	lr, pc
	bx	r3
	ldr	r4, .L120+48
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L120+52
	mov	lr, pc
	bx	r4
	ldr	r3, .L120+56
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L103
	ldr	r3, .L120+60
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L117
.L103:
	ldr	r3, .L120+64
	ldr	r3, [r3]
	cmp	r3, #9
	bgt	.L118
.L104:
	ldr	r3, .L120+68
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L119
	pop	{r4, r5, r6, lr}
	bx	lr
.L119:
	pop	{r4, r5, r6, lr}
	b	goToLose
.L118:
	mov	r4, #2
	ldr	r3, .L120+72
	mov	lr, pc
	bx	r3
	ldr	r2, .L120+76
	ldr	r3, .L120+80
	str	r4, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L120+84
	mov	lr, pc
	bx	r3
	ldr	r3, .L120+88
	strb	r4, [r3]
	b	.L104
.L117:
	bl	goToPause
	b	.L103
.L121:
	.align	2
.L120:
	.word	updateGame
	.word	score
	.word	.LC9
	.word	.LANCHOR0
	.word	sprintf
	.word	drawGame
	.word	.LC7
	.word	65535
	.word	.LANCHOR1
	.word	100706304
	.word	.LC8
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.word	segmentsDestroyed
	.word	lost
	.word	clearAll
	.word	currentLevel
	.word	initGame
	.word	clearBG
	.word	state
	.size	game, .-game
	.section	.rodata.str1.4
	.align	2
.LC10:
	.ascii	"YOU WON\000"
	.text
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #89
	ldr	r2, .L137
	push	{r4, lr}
	ldr	ip, .L137+4
	ldr	r4, .L137+8
	ldr	lr, .L137+12
	rsb	r0, r2, #300
.L124:
	sub	r3, r3, #48
	and	r3, r3, #255
	cmp	r3, #42
	movhi	r1, r4
	lsl	r3, r3, #1
	ldrhls	r1, [lr, r3]
	add	r3, r2, r0
	lsl	r3, r3, #1
	strh	r1, [ip, r3]	@ movhi
	ldrb	r3, [r2, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L124
	mov	r3, #80
	ldr	r2, .L137+16
	ldr	r4, .L137+8
	rsb	r0, r2, #320
	ldr	lr, .L137+12
	ldr	ip, .L137+4
	add	r0, r0, #3
.L126:
	sub	r3, r3, #48
	and	r3, r3, #255
	cmp	r3, #42
	movhi	r1, r4
	lsl	r3, r3, #1
	ldrhls	r1, [lr, r3]
	add	r3, r2, r0
	lsl	r3, r3, #1
	strh	r1, [ip, r3]	@ movhi
	ldrb	r3, [r2, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L126
	ldr	r3, .L137+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L122
	ldr	r3, .L137+24
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L136
.L122:
	pop	{r4, lr}
	bx	lr
.L136:
	pop	{r4, lr}
	b	goToStart
.L138:
	.align	2
.L137:
	.word	.LC10
	.word	100679680
	.word	65535
	.word	.LANCHOR1
	.word	.LC5
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L141
	mov	lr, pc
	bx	r3
	ldr	r3, .L141+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L141+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L141+12
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L141+16
	strb	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L142:
	.align	2
.L141:
	.word	clearAll
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	state
	.size	goToWin, .-goToWin
	.section	.rodata.str1.4
	.align	2
.LC11:
	.ascii	"LEVEL 2\000"
	.text
	.align	2
	.global	level2
	.syntax unified
	.arm
	.fpu softvfp
	.type	level2, %function
level2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L168
	mov	lr, pc
	bx	r3
	ldr	r3, .L168+4
	ldr	r1, .L168+8
	ldr	r2, [r3]
	ldr	r0, .L168+12
	ldr	r3, .L168+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L168+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L168+24
	mov	lr, pc
	bx	r3
	mov	r2, #0
	mov	r3, #83
	ldr	r1, .L168+28
	ldr	r4, .L168+32
	ldr	lr, .L168+36
	ldr	ip, .L168+40
.L145:
	sub	r3, r3, #48
	and	r3, r3, #255
	cmp	r3, #42
	movhi	r0, r4
	lsl	r3, r3, #1
	ldrhls	r0, [lr, r3]
	lsl	r3, r2, #1
	strh	r0, [ip, r3]	@ movhi
	ldrb	r3, [r1, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	add	r2, r2, #1
	bne	.L145
	ldr	r1, .L168+12
	ldrb	r3, [r1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L149
	ldr	r5, .L168+32
	ldr	r4, .L168+36
	ldr	lr, .L168+40
	rsb	ip, r1, #7
.L146:
	sub	r3, r3, #48
	and	r3, r3, #255
	cmp	r3, #42
	movhi	r0, r5
	lsl	r3, r3, #1
	ldrhls	r0, [r4, r3]
	add	r2, r1, ip
	lsl	r3, r2, #1
	strh	r0, [lr, r3]	@ movhi
	ldrb	r3, [r1, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L146
.L149:
	mov	r3, #76
	ldr	r1, .L168+44
	ldr	r5, .L168+32
	ldr	r4, .L168+36
	ldr	ip, .L168+40
	rsb	lr, r1, #23
.L147:
	sub	r3, r3, #48
	and	r3, r3, #255
	cmp	r3, #42
	movhi	r0, r5
	lsl	r3, r3, #1
	ldrhls	r0, [r4, r3]
	add	r2, r1, lr
	lsl	r3, r2, #1
	strh	r0, [ip, r3]	@ movhi
	ldrb	r3, [r1, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L147
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L168+48
	ldr	r4, .L168+52
	mov	lr, pc
	bx	r4
	ldr	r3, .L168+56
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L151
	ldr	r3, .L168+60
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L165
.L151:
	ldr	r3, .L168+64
	ldr	r3, [r3]
	cmp	r3, #9
	bgt	.L166
.L152:
	ldr	r3, .L168+68
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L167
	pop	{r4, r5, r6, lr}
	bx	lr
.L167:
	pop	{r4, r5, r6, lr}
	b	goToLose
.L166:
	bl	goToWin
	b	.L152
.L165:
	bl	goToPause
	b	.L151
.L169:
	.align	2
.L168:
	.word	updateGame
	.word	score
	.word	.LC9
	.word	.LANCHOR0
	.word	sprintf
	.word	drawGame
	.word	waitForVBlank
	.word	.LC7
	.word	65535
	.word	.LANCHOR1
	.word	100706304
	.word	.LC11
	.word	shadowOAM
	.word	DMANow
	.word	oldButtons
	.word	buttons
	.word	segmentsDestroyed
	.word	lost
	.size	level2, .-level2
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L183
	mov	lr, pc
	bx	r3
	ldr	r6, .L183+4
	ldr	r7, .L183+8
	ldr	r5, .L183+12
	ldr	fp, .L183+16
	ldr	r10, .L183+20
	ldr	r9, .L183+24
	ldr	r8, .L183+28
	ldr	r4, .L183+32
.L171:
	ldrb	r1, [r6]	@ zero_extendqisi2
	ldrh	r3, [r7]
.L172:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r1, #5
	ldrls	pc, [pc, r1, asl #2]
	b	.L172
.L174:
	.word	.L179
	.word	.L178
	.word	.L177
	.word	.L176
	.word	.L175
	.word	.L173
.L173:
	ldr	r3, .L183+36
	mov	lr, pc
	bx	r3
	b	.L171
.L175:
	ldr	r3, .L183+40
	mov	lr, pc
	bx	r3
	b	.L171
.L176:
	mov	lr, pc
	bx	r8
	b	.L171
.L177:
	mov	lr, pc
	bx	r9
	b	.L171
.L178:
	mov	lr, pc
	bx	r10
	b	.L171
.L179:
	mov	lr, pc
	bx	fp
	b	.L171
.L184:
	.align	2
.L183:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	level2
	.word	pause
	.word	67109120
	.word	lose
	.word	win
	.size	main, .-main
	.text
	.align	2
	.global	tilePrinter
	.syntax unified
	.arm
	.fpu softvfp
	.type	tilePrinter, %function
tilePrinter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldrb	ip, [r0]	@ zero_extendqisi2
	cmp	ip, #0
	bxeq	lr
	add	r1, r1, r2, lsl #5
	lsl	r3, r3, #11
	add	r3, r3, r1, lsl #1
	str	lr, [sp, #-4]!
	ldr	r1, .L196
	ldr	lr, .L196+4
	add	r3, r3, #100663296
.L188:
	sub	ip, ip, #48
	and	ip, ip, #255
	cmp	ip, #42
	movhi	r2, lr
	lsl	ip, ip, #1
	ldrhls	r2, [r1, ip]
	strh	r2, [r3], #2	@ movhi
	ldrb	ip, [r0, #1]!	@ zero_extendqisi2
	cmp	ip, #0
	bne	.L188
	ldr	lr, [sp], #4
	bx	lr
.L197:
	.align	2
.L196:
	.word	.LANCHOR1
	.word	65535
	.size	tilePrinter, .-tilePrinter
	.comm	state,1,1
	.comm	lost,4,4
	.comm	currentLevel,4,4
	.comm	rSeed,4,4
	.comm	score,4,4
	.global	scoreBuffer
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	mushroomField,1776,4
	.comm	tileIDs,2,2
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	CSWTCH.37, %object
	.size	CSWTCH.37, 86
CSWTCH.37:
	.short	42
	.short	44
	.short	46
	.short	48
	.short	50
	.short	52
	.short	54
	.short	56
	.short	58
	.short	60
	.short	-1
	.short	-1
	.short	-1
	.short	-1
	.short	-1
	.short	-1
	.short	-1
	.short	106
	.short	108
	.short	110
	.short	112
	.short	114
	.short	116
	.short	118
	.short	120
	.short	122
	.short	124
	.short	170
	.short	172
	.short	174
	.short	176
	.short	178
	.short	180
	.short	182
	.short	184
	.short	186
	.short	188
	.short	234
	.short	236
	.short	238
	.short	240
	.short	242
	.short	244
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	scoreBuffer, %object
	.size	scoreBuffer, 7
scoreBuffer:
	.ascii	"000000\000"
	.ident	"GCC: (devkitARM release 53) 9.1.0"
