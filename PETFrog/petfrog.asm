 processor 6502
	org $400
	; Starting new memory block at $400
StartBlock400
	.byte    $0, $0E, $08, $0A, $00, $9E, $20, $28
	.byte   $31,$30,$34,$30
	.byte    $29, $00, $00, $00
	; Ending memory block
EndBlock400
	org $410
	; Starting new memory block at $410
StartBlock410
ScreenTest
	; LineNumber: 449
	jmp block1
	; LineNumber: 4
i	dc.w	$00
	; LineNumber: 8
rom4	
	dc.b	$34, $2e, $30, $20, $12, $0f, $0d, 0
	; LineNumber: 9
rom2	
	dc.b	$32, $2e, $30, $20, $12, $0f, $0d, 0
	; LineNumber: 15
KEYPRESS	dc.b	$ff
	; LineNumber: 17
blk	
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	$20, 0
	; LineNumber: 18
by	
	dc.b	$20, $02, $19, $20, $03, $08, $12, $09, $13
	dc.b	$20, $07, $01, $12, $12, $05, $14, $14, $20
	dc.b	$30, $31, $2f, $32, $30, $32, $31, $20, $20
	dc.b	$20, 0
	; LineNumber: 19
url	
	dc.b	$20, $00, $0d, $01, $0b, $05, $12, $08, $01
	dc.b	$03, $0b, $13, $20, $0d, $01, $0b, $05, $12
	dc.b	$08, $01, $03, $0b, $13, $2e, $03, $0f, $0d
	dc.b	$20, 0
	; LineNumber: 20
over	
	dc.b	$20, $07, $01, $0d, $05, $20, $0f, $16, $05
	dc.b	$12, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	$20, 0
	; LineNumber: 21
score	
	dc.b	$20, $19, $0f, $15, $20, $13, $03, $0f, $12
	dc.b	$05, $04, $3a, $20, $20, $20, $20, $20, $20
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	$20, 0
	; LineNumber: 22
space	
	dc.b	$20, $10, $12, $05, $13, $13, $20, $13, $10
	dc.b	$01, $03, $05, $20, $14, $0f, $20, $03, $0f
	dc.b	$0e, $14, $09, $0e, $15, $05, $20, $20, $20
	dc.b	$20, 0
	; LineNumber: 24
ALIVE	dc.b	$01
	; LineNumber: 25
WON_GAME	dc.b	$00
	; LineNumber: 31
frogcharA	dc.b	$d6
	; LineNumber: 32
frogcharB	dc.b	$56
	; LineNumber: 33
frog_x	dc.b	$14
	; LineNumber: 33
frog_old_x	dc.b	$14
	; LineNumber: 34
frog_y	dc.b	$19
	; LineNumber: 34
frog_old_y	dc.b	$19
	; LineNumber: 35
previous_tile	dc.b	$20
	; LineNumber: 38
arr_crockr	dc.b $0c0, $0a2, $0dc, $0dc, $0dc, $0dc, $0dc, $062
	dc.b $079
	; LineNumber: 39
str_crockr	
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	0 
	; LineNumber: 40
arr_crockl	dc.b $079, $062, $0dc, $0dc, $0dc, $0dc, $0dc, $0a2
	dc.b $0c0
	; LineNumber: 41
str_crockl	
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	0 
	; LineNumber: 42
arr_logl	dc.b $0a8, $0a8, $0a8, $0a8, $0d1
	; LineNumber: 43
str_logl	
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	0 
	; LineNumber: 44
arr_logr	dc.b $0d1, $0a9, $0a9, $0a9, $0a9
	; LineNumber: 45
str_logr	
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	0 
	; LineNumber: 46
arr_carl	dc.b $0f0, $0cf, $0d0, $0e0
	; LineNumber: 47
str_carl	
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	0 
	; LineNumber: 48
arr_carr	dc.b $0ed, $0d7, $0d7, $0a0
	; LineNumber: 49
str_carr	
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	0 
	; LineNumber: 50
arr_truckb	dc.b $0a0, $0d7, $062, $0d7, $0f1, $0d7, $0fd, $0a0
	; LineNumber: 51
str_truckb	
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	0 
	; LineNumber: 52
arr_truckt	dc.b $0e0, $060, $060, $060, $0fe, $0eb, $0ee, $0e0
	; LineNumber: 53
str_truckt	
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	0 
	; LineNumber: 56
crock_a_x	dc.b	$28
	; LineNumber: 59
logo	dc.b $072, $049, $070, $06e, $070, $072, $06e, $055
	dc.b $049, $020, $020, $020, $020, $06b, $04b, $06b
	dc.b $020, $020, $042, $020, $06b, $055, $055, $049
	dc.b $055, $049, $071, $020, $06d, $07d, $020, $071
	dc.b $020, $04b, $071, $04a, $04b, $04a, $042, $078
	dc.b $078, $078, $078, $078, $078, $078, $078, $078
	dc.b $078, $078, $04a, $04b
	; LineNumber: 67
title_screen_frog_pointer	= $02
	; LineNumber: 68
title_screen_frog	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $06c, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $07b, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $06c, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $07b, $020, $020, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $0f5, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $020, $020, $0a0, $0a0, $0a0, $0a0
	dc.b $07e, $020, $020, $07c, $0a0, $0a0, $0a0, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $0a0, $07e, $0e2, $0e2, $0e2
	dc.b $07c, $0a0, $061, $020, $0a0, $0a0, $0a0, $07e
	dc.b $020, $020, $020, $020, $0e1, $0a0, $0a0, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $076, $0a0, $020, $020, $020, $020
	dc.b $020, $0a0, $061, $020, $0a0, $0a0, $0a0, $020
	dc.b $020, $020, $020, $020, $020, $0a0, $0a0, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $076, $0a0, $020, $020, $020, $020
	dc.b $020, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $020
	dc.b $020, $020, $020, $020, $020, $0a0, $0a0, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $0a0, $07b, $020, $020, $020
	dc.b $06c, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $020
	dc.b $062, $0a0, $0a0, $062, $020, $0a0, $0a0, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $068
	dc.b $066, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $062, $0a0, $0a0, $0a0, $062, $062, $062
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0ec, $062, $062, $0fb, $0a0, $0a0, $0a0, $020
	dc.b $020, $068, $020, $020, $020, $020, $020, $066
	dc.b $066, $05c, $020, $020, $020, $020, $020, $020
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $07e, $020
	dc.b $020, $066, $05c, $020, $020, $020, $020, $066
	dc.b $066, $05c, $020, $020, $020, $020, $020, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $07b, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $066, $020, $020, $020, $020, $020, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $0a0, $0ec
	dc.b $0fb, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $07b
	dc.b $066, $020, $020, $066, $020, $020, $020, $020
	dc.b $068, $066, $020, $020, $020, $0e1, $0a0, $06c
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $066, $068, $020, $066, $066, $020, $020, $066
	dc.b $066, $066, $05c, $020, $020, $0a0, $0a0, $0a0
	dc.b $020, $0fb, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0ec, $020, $0a0
	dc.b $066, $066, $020, $020, $066, $020, $020, $066
	dc.b $066, $066, $066, $05c, $020, $0a0, $0a0, $0a0
	dc.b $07b, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $06c, $0a0
	dc.b $066, $066, $066, $020, $066, $066, $020, $066
	dc.b $066, $020, $066, $05c, $020, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $062, $062, $062
	dc.b $062, $062, $062, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $0fe, $0a0, $0a0
	dc.b $066, $066, $066, $066, $020, $066, $066, $020
	dc.b $066, $066, $066, $05c, $020, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0e2, $0e2
	dc.b $0e2, $0e2, $0e2, $0e2, $0a0, $0a0, $0a0, $0a0
	dc.b $066, $066, $066, $066, $066, $066, $066, $066
	dc.b $066, $066, $066, $066, $020, $020, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0ec
	dc.b $0e2, $0e2, $0ec, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $066, $066, $066, $066, $066, $066, $066, $066
	dc.b $066, $066, $066, $066, $066, $020, $0e1, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0ec
	dc.b $066, $066, $066, $066, $066, $066, $066, $066
	dc.b $066, $066, $066, $066, $066, $066, $020, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $020
	dc.b $066, $066, $05c, $020, $066, $066, $066, $066
	dc.b $020, $020, $066, $066, $066, $066, $020, $020
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $061, $068
	dc.b $066, $066, $020, $020, $020, $066, $066, $05c
	dc.b $020, $020, $066, $066, $066, $066, $066, $020
	dc.b $020, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0ec, $020, $066
	dc.b $066, $05c, $020, $020, $020, $066, $066, $020
	dc.b $020, $020, $020, $066, $066, $066, $066, $066
	dc.b $020, $020, $0e2, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0ec, $020, $066, $066
	dc.b $066, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $066, $066
	dc.b $066, $020, $020, $020, $0e2, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0ec, $020, $020, $066, $066, $066
	dc.b $066, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $066
	dc.b $066, $066, $066, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $066, $066, $066, $066, $066
	; LineNumber: 98
blank_river	
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	0 
	; LineNumber: 99
blank_road	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, 0, 0, 0
	; LineNumber: 100
petscii_pointer	= $04
	; LineNumber: 105
petscii	dc.b $0cf, $0f7, $0f7, $0f7, $0f7, $0f7, $0f7, $0f7
	dc.b $0f7, $0f7, $0f7, $0f7, $0f7, $0f7, $0f7, $0f7
	dc.b $0f7, $0f7, $0f7, $0f7, $0f7, $0f7, $0f7, $0f7
	dc.b $0f7, $0f7, $0f7, $0f7, $0f7, $0f7, $0f7, $0f7
	dc.b $0f7, $0f7, $0f7, $0f7, $0f7, $0f7, $0f7, $0d0
	dc.b $0f4, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $090, $085, $094, $086, $092, $08f, $087
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0ea
	dc.b $0f4, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0ea
	dc.b $0cc, $0ef, $0ef, $0ef, $0ef, $0ef, $0ef, $0ef
	dc.b $0ef, $0ef, $0ef, $0ef, $0ef, $0ef, $0ef, $0ef
	dc.b $0ef, $0ef, $0ef, $0ef, $0ef, $0ef, $0ef, $0ef
	dc.b $0ef, $0ef, $0ef, $0ef, $0ef, $0ef, $0ef, $0ef
	dc.b $0ef, $0ef, $0ef, $0ef, $0ef, $0ef, $0ef, $0fa
	dc.b $0e6, $0e6, $0e6, $020, $0e6, $0e6, $0e6, $0e6
	dc.b $0e6, $0e6, $020, $0e6, $0e6, $0e6, $0e6, $0e6
	dc.b $0e6, $0e6, $020, $0e6, $0e6, $0e6, $0e6, $0e6
	dc.b $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $020
	dc.b $0e6, $0e6, $0e6, $0e6, $0e6, $020, $0e6, $0e6
	dc.b $0e6, $0e6, $020, $020, $020, $020, $0e6, $0e6
	dc.b $0e6, $020, $020, $020, $020, $0e6, $0e6, $0e6
	dc.b $020, $020, $020, $020, $0e6, $0e6, $0e6, $020
	dc.b $020, $020, $020, $0e6, $0e6, $020, $020, $020
	dc.b $020, $0e6, $0e6, $020, $020, $020, $020, $0e6
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $0c0, $0a2
	dc.b $0dc, $0dc, $0dc, $0dc, $0dc, $062, $079, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $0a8, $0a8, $0a8
	dc.b $0a8, $0a8, $0a8, $0d1, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $079
	dc.b $062, $0dc, $0dc, $0dc, $0dc, $0dc, $0a2, $0c0
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $0d1
	dc.b $0a9, $0a9, $0a9, $0a9, $020, $020, $020, $056
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $0d1, $0a9, $0a9, $0a9, $0a9, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $068, $068, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $068, $068, $068
	dc.b $068, $068, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $068
	dc.b $068, $068, $020, $020, $020, $020, $020, $020
	dc.b $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6
	dc.b $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6
	dc.b $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6
	dc.b $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6
	dc.b $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $068
	dc.b $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6
	dc.b $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6
	dc.b $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6
	dc.b $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6
	dc.b $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6
	dc.b $0e3, $0e3, $0e3, $0e3, $0e3, $0e3, $0e3, $0e3
	dc.b $0e3, $0e3, $0e3, $0e3, $0e3, $0e3, $0e3, $0e3
	dc.b $0e3, $0e3, $0e3, $0e3, $0e3, $0e3, $0e3, $0e3
	dc.b $0e3, $0e3, $0e3, $0e3, $0e3, $0e3, $0e3, $0e3
	dc.b $0e3, $0e3, $0e3, $0e3, $0e3, $0e3, $0e3, $0e3
	dc.b $0e0, $0e0, $0e0, $0e0, $0e0, $0e0, $0e0, $0e0
	dc.b $0e0, $0e0, $0e0, $0f0, $0cf, $0d0, $0e0, $0e0
	dc.b $0e0, $0e0, $0e0, $0e0, $0e0, $0e0, $0f0, $0cf
	dc.b $0d0, $0e0, $0e0, $0e0, $0e0, $0f0, $0cf, $0d0
	dc.b $0e0, $0e0, $0e0, $0e0, $0e0, $0e0, $0e0, $0e0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0ed, $0d7, $0d7, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0ed, $0d7
	dc.b $0d7, $0a0, $0a0, $0a0, $0a0, $0ed, $0d7, $0d7
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0ad, $0ad, $0ad, $0ad, $0ad, $0ad, $0ad, $0ad
	dc.b $0ad, $0ad, $0ad, $0ad, $0ad, $0ad, $0ad, $0ad
	dc.b $0ad, $0ad, $0ad, $0ad, $0ad, $0ad, $0ad, $0ad
	dc.b $0ad, $0ad, $0ad, $0ad, $0ad, $0ad, $0ad, $0ad
	dc.b $0ad, $0ad, $0ad, $0ad, $0ad, $0ad, $0ad, $0ad
	dc.b $0e0, $0e0, $0e0, $0e0, $0e0, $0e0, $0e0, $0e0
	dc.b $0e0, $0e0, $060, $060, $060, $0fe, $0eb, $0ee
	dc.b $0e0, $0e0, $0e0, $0e0, $0e0, $0e0, $0e0, $0e0
	dc.b $0e0, $0e0, $0e0, $0e0, $0e0, $0e0, $0e0, $0e0
	dc.b $0e0, $0e0, $0e0, $0e0, $0e0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0d7, $062, $0d7, $0f1, $0d7, $0fd
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0e2, $0e2, $0e2, $0e2, $0e2, $0e2, $0e2, $0e2
	dc.b $0e2, $0e2, $0e2, $0e2, $0e2, $0e2, $0e2, $0e2
	dc.b $0e2, $0e2, $0e2, $0e2, $0e2, $0e2, $0e2, $0e2
	dc.b $0e2, $0e2, $0e2, $0e2, $0e2, $0e2, $0e2, $0e2
	dc.b $0e2, $0e2, $0e2, $0e2, $0e2, $0e2, $0e2, $0e2
	dc.b $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6
	dc.b $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6
	dc.b $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6
	dc.b $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6
	dc.b $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6
	dc.b $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6
	dc.b $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6
	dc.b $0e6, $0e6, $0e6, $0e6, $0e6, $0d6, $0e6, $0e6
	dc.b $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6
	dc.b $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6
	; NodeProcedureDecl -1
	; ***********  Defining procedure : init16x8mul
	;    Procedure type : Built-in function
	;    Requires initialization : no
mul16x8_num1Hi = $4c
mul16x8_num1 = $4e
mul16x8_num2 = $50
mul16x8_procedure
	lda #$00
	ldy #$00
	beq mul16x8_enterLoop
mul16x8_doAdd
	clc
	adc mul16x8_num1
	tax
	tya
	adc mul16x8_num1Hi
	tay
	txa
mul16x8_loop
	asl mul16x8_num1
	rol mul16x8_num1Hi
mul16x8_enterLoop  ; accumulating multiply entry point (enter with .A=lo, .Y=hi)
	lsr mul16x8_num2
	bcs mul16x8_doAdd
	bne mul16x8_loop
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : initeightbitmul
	;    Procedure type : Built-in function
	;    Requires initialization : no
multiplier = $4c
multiplier_a = $4e
multiply_eightbit
	cpx #$00
	beq mul_end
	dex
	stx $4e
	lsr
	sta multiplier
	lda #$00
	ldx #$08
mul_loop
	bcc mul_skip
mul_mod
	adc multiplier_a
mul_skip
	ror
	ror multiplier
	dex
	bne mul_loop
	ldx multiplier
	rts
mul_end
	txa
	rts
initeightbitmul_multiply_eightbit2
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : initmoveto
	;    Procedure type : Built-in function
	;    Requires initialization : no
	jmp initmoveto_moveto3
screenmemory =  $fe
colormemory =  $fc
screen_x = $4c
screen_y = $4e
SetScreenPosition
	sta screenmemory+1
	lda #0
	sta screenmemory
	ldy screen_y
	beq sydone
syloop
	clc
	adc #80
	bcc sskip
	inc screenmemory+1
sskip
	dey
	bne syloop
sydone
	ldx screen_x
	beq sxdone
	clc
	adc screen_x
	bcc sxdone
	inc screenmemory+1
sxdone
	sta screenmemory
	rts
initmoveto_moveto3
	rts
	
; //  1    2   3  4   5   6   7   8   9  10  11  12  13
; //1   2   3   4   5   6   7   8   9   0   1   2   3   4   5   6   7   8   9   20  1   2   3   4   5   6   7   8   9   30  1   2   3   4   5   6   7   8   9   40   
; // =============================================================================================== 
	; NodeProcedureDecl -1
	; ***********  Defining procedure : cls
	;    Procedure type : User-defined procedure
	; LineNumber: 144
cls
	; LineNumber: 145
	; Clear screen with offset
	lda #$20
	ldx #$fa
cls_clearloop5
	dex
	sta $0000+$8000,x
	sta $00fa+$8000,x
	sta $01f4+$8000,x
	sta $02ee+$8000,x
	sta $03e8+$8000,x
	sta $04e2+$8000,x
	sta $05dc+$8000,x
	sta $06d6+$8000,x
	bne cls_clearloop5
	; LineNumber: 146
	; MoveTo optimization
	lda #$00
	sta screenmemory
	lda #>$8000
	clc
	adc #$00
	sta screenmemory+1
	; LineNumber: 147
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : getkey
	;    Procedure type : User-defined procedure
	; LineNumber: 152
getkey
	; LineNumber: 155
	; LineNumber: 156
	; Peek
	lda $97 + $0
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : waitkey
	;    Procedure type : User-defined procedure
	; LineNumber: 162
	; LineNumber: 161
this_key	dc.b	$ff
waitkey_block7
waitkey
	; LineNumber: 164
waitkey_while8
	; Binary clause Simplified: NOTEQUALS
	lda this_key
	; Compare with pure num / var optimization
	cmp #$20;keep
	beq waitkey_elsedoneblock11
waitkey_ConditionalTrueBlock9: ;Main true block ;keep 
	; LineNumber: 165
	; LineNumber: 166
	; Assigning single variable : this_key
	jsr getkey
	; Calling storevariable
	sta this_key
	; LineNumber: 167
	jmp waitkey_while8
waitkey_elsedoneblock11
	; LineNumber: 168
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : getat
	;    Procedure type : User-defined procedure
	; LineNumber: 174
	; LineNumber: 172
szp	= $08
	; LineNumber: 170
sx	dc.b	0
	; LineNumber: 170
sy	dc.b	0
getat_block14
getat
	; LineNumber: 175
	; Assigning single variable : szp
	; Generic 16 bit op
	ldy #0
	lda sx
getat_rightvarInteger_var17 = $54
	sta getat_rightvarInteger_var17
	sty getat_rightvarInteger_var17+1
	; Generic 16 bit op
	; Integer constant assigning
	ldy #$80
	lda #$00
getat_rightvarInteger_var20 = $56
	sta getat_rightvarInteger_var20
	sty getat_rightvarInteger_var20+1
	; Right is PURE NUMERIC : Is word =1
	; 16 bit mul or div
	; Mul 16x8 setup
	ldy #0
	lda sy
	sta mul16x8_num1
	sty mul16x8_num1Hi
	lda #$28
	sta mul16x8_num2
	jsr mul16x8_procedure
	; Low bit binop:
	clc
	adc getat_rightvarInteger_var20
getat_wordAdd18
	sta getat_rightvarInteger_var20
	; High-bit binop
	tya
	adc getat_rightvarInteger_var20+1
	tay
	lda getat_rightvarInteger_var20
	; Low bit binop:
	clc
	adc getat_rightvarInteger_var17
getat_wordAdd15
	sta getat_rightvarInteger_var17
	; High-bit binop
	tya
	adc getat_rightvarInteger_var17+1
	tay
	lda getat_rightvarInteger_var17
	sta szp
	sty szp+1
	; LineNumber: 176
	; LineNumber: 177
	; Load pointer array
	ldy #$0
	lda (szp),y
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : textat
	;    Procedure type : User-defined procedure
	; LineNumber: 183
	; LineNumber: 181
zp	= $08
	; LineNumber: 179
x	dc.b	0
	; LineNumber: 179
y	dc.b	0
	; LineNumber: 179
this_str	= $16
	; LineNumber: 179
str_len	dc.b	0
textat_block21
textat
	; LineNumber: 184
	; Assigning single variable : zp
	; Generic 16 bit op
	ldy #0
	lda x
textat_rightvarInteger_var24 = $54
	sta textat_rightvarInteger_var24
	sty textat_rightvarInteger_var24+1
	; Generic 16 bit op
	; Integer constant assigning
	ldy #$80
	lda #$00
textat_rightvarInteger_var27 = $56
	sta textat_rightvarInteger_var27
	sty textat_rightvarInteger_var27+1
	; Right is PURE NUMERIC : Is word =1
	; 16 bit mul or div
	; Mul 16x8 setup
	ldy #0
	lda y
	sta mul16x8_num1
	sty mul16x8_num1Hi
	lda #$28
	sta mul16x8_num2
	jsr mul16x8_procedure
	; Low bit binop:
	clc
	adc textat_rightvarInteger_var27
textat_wordAdd25
	sta textat_rightvarInteger_var27
	; High-bit binop
	tya
	adc textat_rightvarInteger_var27+1
	tay
	lda textat_rightvarInteger_var27
	; Low bit binop:
	clc
	adc textat_rightvarInteger_var24
textat_wordAdd22
	sta textat_rightvarInteger_var24
	; High-bit binop
	tya
	adc textat_rightvarInteger_var24+1
	tay
	lda textat_rightvarInteger_var24
	sta zp
	sty zp+1
	; LineNumber: 184
	; memcpyfast
	ldy str_len
	dey
textat_memcpy28
	lda (this_str),y
	sta (zp),y
	dey
	bpl textat_memcpy28
	; LineNumber: 186
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : title_screen
	;    Procedure type : User-defined procedure
	; LineNumber: 189
title_screen
	; LineNumber: 192
	
; // Set up pointer to array:
	; Assigning single variable : title_screen_frog_pointer
	lda #<title_screen_frog
	ldx #>title_screen_frog
	sta title_screen_frog_pointer
	stx title_screen_frog_pointer+1
	; LineNumber: 194
	jsr cls
	; LineNumber: 197
	
; // Draw the frog
	; Copy full screen
	lda title_screen_frog_pointer
	sta $4c
	lda title_screen_frog_pointer+1
	sta $4c+1
	lda screenmemory
	sta $4e
	lda screenmemory+1
	sta $4e+1
	; CopyFullscreen with pointers
	ldx #3
title_screen_outer30
	ldy #0
title_screen_inner31
	lda ($4c),y
	sta ($4e),y
	dey
	bne title_screen_inner31
	inc $4c+1
	inc $4e+1
	dex
	bne title_screen_outer30
	ldy #0
title_screen_final32
	lda ($4c),y
	sta ($4e),y
	iny
	cpy #232
	bne title_screen_final32
	; LineNumber: 198
	; memcpyfast
	ldx #12
title_screen_memcpy33
	lda logo+ $00,x
	sta $8000,x
	dex
	bpl title_screen_memcpy33
	; LineNumber: 199
	; memcpyfast
	ldx #12
title_screen_memcpy34
	lda logo+ $0d,x
	sta $8028,x
	dex
	bpl title_screen_memcpy34
	; LineNumber: 200
	; memcpyfast
	ldx #12
title_screen_memcpy35
	lda logo+ $1a,x
	sta $8050,x
	dex
	bpl title_screen_memcpy35
	; LineNumber: 201
	; memcpyfast
	ldx #12
title_screen_memcpy36
	lda logo+ $27,x
	sta $8078,x
	dex
	bpl title_screen_memcpy36
	; LineNumber: 205
title_screen_while37
	; Binary clause Simplified: NOTEQUALS
	jsr getkey
	; Compare with pure num / var optimization
	cmp #$20;keep
	beq title_screen_elsedoneblock40
title_screen_ConditionalTrueBlock38: ;Main true block ;keep 
	; LineNumber: 206
	; LineNumber: 207
	; Assigning single variable : x
	lda #$2
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$15
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<blk
	ldx #>blk
	sta this_str
	stx this_str+1
	; Assigning single variable : str_len
	lda #$1c
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 208
	; Assigning single variable : x
	lda #$2
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$16
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<by
	ldx #>by
	sta this_str
	stx this_str+1
	; Assigning single variable : str_len
	lda #$1c
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 209
	; Assigning single variable : x
	lda #$2
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$17
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<url
	ldx #>url
	sta this_str
	stx this_str+1
	; Assigning single variable : str_len
	lda #$1c
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 210
	; Assigning single variable : x
	lda #$2
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$18
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<space
	ldx #>space
	sta this_str
	stx this_str+1
	; Assigning single variable : str_len
	lda #$1c
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 211
	jmp title_screen_while37
title_screen_elsedoneblock40
	; LineNumber: 213
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : score_screen
	;    Procedure type : User-defined procedure
	; LineNumber: 216
score_screen
	; LineNumber: 217
	jsr cls
	; LineNumber: 218
score_screen_while44
	; Binary clause Simplified: NOTEQUALS
	jsr getkey
	; Compare with pure num / var optimization
	cmp #$20;keep
	beq score_screen_localfailed53
	jmp score_screen_ConditionalTrueBlock45
score_screen_localfailed53
	jmp score_screen_elsedoneblock47
score_screen_ConditionalTrueBlock45: ;Main true block ;keep 
	; LineNumber: 219
	; LineNumber: 220
	; memcpyfast
	ldx #12
score_screen_memcpy55
	lda logo+ $00,x
	sta $8000,x
	dex
	bpl score_screen_memcpy55
	; LineNumber: 221
	; memcpyfast
	ldx #12
score_screen_memcpy56
	lda logo+ $0d,x
	sta $8028,x
	dex
	bpl score_screen_memcpy56
	; LineNumber: 222
	; memcpyfast
	ldx #12
score_screen_memcpy57
	lda logo+ $1a,x
	sta $8050,x
	dex
	bpl score_screen_memcpy57
	; LineNumber: 223
	; memcpyfast
	ldx #12
score_screen_memcpy58
	lda logo+ $27,x
	sta $8078,x
	dex
	bpl score_screen_memcpy58
	; LineNumber: 226
	; Assigning single variable : x
	lda #$2
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$6
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<over
	ldx #>over
	sta this_str
	stx this_str+1
	; Assigning single variable : str_len
	lda #$1c
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 227
	; Assigning single variable : x
	lda #$2
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$7
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<score
	ldx #>score
	sta this_str
	stx this_str+1
	; Assigning single variable : str_len
	lda #$1c
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 228
	; Assigning single variable : x
	lda #$2
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$a
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<space
	ldx #>space
	sta this_str
	stx this_str+1
	; Assigning single variable : str_len
	lda #$1c
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 229
	jmp score_screen_while44
score_screen_elsedoneblock47
	; LineNumber: 231
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : init_vars
	;    Procedure type : User-defined procedure
	; LineNumber: 269
init_vars
	; LineNumber: 270
	jsr cls
	; LineNumber: 273
	
; // Init the playfield
	; Assigning single variable : screenmemory
	lda #$00
	ldx #$80
	sta screenmemory
	stx screenmemory+1
	; LineNumber: 288
	
; //	MemCpy(#petscii1, 0, screenmemory, 240 ); 
; //	screenmemory:=$8000+240;
; //	MemCpy(#petscii2, 0, screenmemory, 240 ); 
; //	screenmemory:=$8000+480;
; //	MemCpy(#petscii3, 0, screenmemory, 240 ); 
; //	screenmemory:=$8000+720;
; //	MemCpy(#petscii4, 0, screenmemory, 240 ); 
; //	screenmemory:=$8000+960;
; //	MemCpy(#petscii5, 0, screenmemory, 40 ); 
; //	screenmemory := $8000;
; //
	; Assigning single variable : petscii_pointer
	lda #<petscii
	ldx #>petscii
	sta petscii_pointer
	stx petscii_pointer+1
	; LineNumber: 289
	; Copy full screen
	sta $4c
	lda petscii_pointer+1
	sta $4c+1
	lda screenmemory
	sta $4e
	lda screenmemory+1
	sta $4e+1
	; CopyFullscreen with pointers
	ldx #3
init_vars_outer60
	ldy #0
init_vars_inner61
	lda ($4c),y
	sta ($4e),y
	dey
	bne init_vars_inner61
	inc $4c+1
	inc $4e+1
	dex
	bne init_vars_outer60
	ldy #0
init_vars_final62
	lda ($4c),y
	sta ($4e),y
	iny
	cpy #232
	bne init_vars_final62
	; LineNumber: 294
	
; // Init the "sprites"
	; memcpy
	ldx #0
init_vars_memcpy63
	lda arr_crockr+ $00,x
	sta str_crockr,x
	inx
	cpx #$9
	bne init_vars_memcpy63
	; LineNumber: 295
	; memcpy
	ldx #0
init_vars_memcpy64
	lda arr_crockl+ $00,x
	sta str_crockl,x
	inx
	cpx #$9
	bne init_vars_memcpy64
	; LineNumber: 296
	; memcpy
	ldx #0
init_vars_memcpy65
	lda arr_logl+ $00,x
	sta str_logl,x
	inx
	cpx #$5
	bne init_vars_memcpy65
	; LineNumber: 297
	; memcpy
	ldx #0
init_vars_memcpy66
	lda arr_logr+ $00,x
	sta str_logr,x
	inx
	cpx #$5
	bne init_vars_memcpy66
	; LineNumber: 298
	; memcpy
	ldx #0
init_vars_memcpy67
	lda arr_truckt+ $00,x
	sta str_truckt,x
	inx
	cpx #$8
	bne init_vars_memcpy67
	; LineNumber: 299
	; memcpy
	ldx #0
init_vars_memcpy68
	lda arr_truckb+ $00,x
	sta str_truckb,x
	inx
	cpx #$8
	bne init_vars_memcpy68
	; LineNumber: 300
	; memcpy
	ldx #0
init_vars_memcpy69
	lda arr_carl+ $00,x
	sta str_carl,x
	inx
	cpx #$4
	bne init_vars_memcpy69
	; LineNumber: 301
	; memcpy
	ldx #0
init_vars_memcpy70
	lda arr_carr+ $00,x
	sta str_carr,x
	inx
	cpx #$4
	bne init_vars_memcpy70
	; LineNumber: 304
	; Assigning single variable : crock_a_x
	lda #$0
	; Calling storevariable
	sta crock_a_x
	; LineNumber: 305
	; Assigning single variable : frog_x
	lda #$14
	; Calling storevariable
	sta frog_x
	; LineNumber: 306
	; Assigning single variable : frog_y
	lda #$a
	; Calling storevariable
	sta frog_y
	; LineNumber: 308
	; Assigning single variable : KEYPRESS
	lda #$0
	; Calling storevariable
	sta KEYPRESS
	; LineNumber: 309
	; Assigning single variable : ALIVE
	lda #$1
	; Calling storevariable
	sta ALIVE
	; LineNumber: 310
	; Assigning single variable : WON_GAME
	lda #$0
	; Calling storevariable
	sta WON_GAME
	; LineNumber: 311
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : shit_delay
	;    Procedure type : User-defined procedure
	; LineNumber: 314
shit_delay
	; LineNumber: 315
	; Wait
	lda #$ff
	ldy #$ff
	tax
	dex
	bne *-1
	; LineNumber: 316
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 317
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 318
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 319
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 320
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 321
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 322
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 322
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 324
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 325
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 326
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 327
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 328
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 329
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 330
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 330
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 332
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 333
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 334
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 335
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 336
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 337
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 338
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 339
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 340
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : game_loop
	;    Procedure type : User-defined procedure
	; LineNumber: 343
game_loop
	; LineNumber: 346
game_loop_while73
	; Binary clause Simplified: EQUALS
	lda ALIVE
	; Compare with pure num / var optimization
	cmp #$1;keep
	bne game_loop_localfailed184
game_loop_localsuccess185: ;keep
	; ; logical AND, second requirement
	; Binary clause Simplified: EQUALS
	lda WON_GAME
	; Compare with pure num / var optimization
	cmp #$0;keep
	bne game_loop_localfailed184
	jmp game_loop_ConditionalTrueBlock74
game_loop_localfailed184
	jmp game_loop_elsedoneblock76
game_loop_ConditionalTrueBlock74: ;Main true block ;keep 
	; LineNumber: 347
	; LineNumber: 348
	; Assigning single variable : frog_old_x
	lda frog_x
	; Calling storevariable
	sta frog_old_x
	; LineNumber: 349
	; Assigning single variable : frog_old_y
	lda frog_y
	; Calling storevariable
	sta frog_old_y
	; LineNumber: 350
	; Assigning single variable : KEYPRESS
	jsr getkey
	; Calling storevariable
	sta KEYPRESS
	; LineNumber: 353
	; Binary clause Simplified: EQUALS
	; Compare with pure num / var optimization
	cmp #$b8;keep
	bne game_loop_elsedoneblock190
game_loop_ConditionalTrueBlock188: ;Main true block ;keep 
	; LineNumber: 354
	; LineNumber: 355
	; Binary clause Simplified: GREATEREQUAL
	lda frog_y
	; Compare with pure num / var optimization
	cmp #$5;keep
	bcc game_loop_elsedoneblock204
game_loop_ConditionalTrueBlock202: ;Main true block ;keep 
	; LineNumber: 356
	; LineNumber: 357
	
; //textat(30,20, #KEYPRESS,1);
	dec frog_y
	; LineNumber: 358
game_loop_elsedoneblock204
	; LineNumber: 359
game_loop_elsedoneblock190
	; LineNumber: 361
	; Binary clause Simplified: EQUALS
	lda KEYPRESS
	; Compare with pure num / var optimization
	cmp #$b6;keep
	bne game_loop_elsedoneblock212
game_loop_ConditionalTrueBlock210: ;Main true block ;keep 
	; LineNumber: 362
	; LineNumber: 363
	; Binary clause Simplified: LESS
	lda frog_x
	; Compare with pure num / var optimization
	cmp #$27;keep
	bcs game_loop_elsedoneblock226
game_loop_ConditionalTrueBlock224: ;Main true block ;keep 
	; LineNumber: 364
	; LineNumber: 365
	inc frog_x
	; LineNumber: 366
game_loop_elsedoneblock226
	; LineNumber: 367
game_loop_elsedoneblock212
	; LineNumber: 369
	; Binary clause Simplified: EQUALS
	lda KEYPRESS
	; Compare with pure num / var optimization
	cmp #$b2;keep
	bne game_loop_localfailed244
	jmp game_loop_ConditionalTrueBlock232
game_loop_localfailed244: ;keep
	; ; logical OR, second chance
	; Binary clause Simplified: EQUALS
	lda KEYPRESS
	; Compare with pure num / var optimization
	cmp #$b5;keep
	bne game_loop_elsedoneblock234
game_loop_ConditionalTrueBlock232: ;Main true block ;keep 
	; LineNumber: 370
	; LineNumber: 371
	; Binary clause Simplified: LESS
	lda frog_y
	; Compare with pure num / var optimization
	cmp #$18;keep
	bcs game_loop_elsedoneblock249
game_loop_ConditionalTrueBlock247: ;Main true block ;keep 
	; LineNumber: 372
	; LineNumber: 373
	inc frog_y
	; LineNumber: 374
game_loop_elsedoneblock249
	; LineNumber: 375
game_loop_elsedoneblock234
	; LineNumber: 377
	; Binary clause Simplified: EQUALS
	lda KEYPRESS
	; Compare with pure num / var optimization
	cmp #$b4;keep
	bne game_loop_elsedoneblock257
game_loop_ConditionalTrueBlock255: ;Main true block ;keep 
	; LineNumber: 378
	; LineNumber: 379
	; Binary clause Simplified: GREATEREQUAL
	lda frog_x
	; Compare with pure num / var optimization
	cmp #$1;keep
	bcc game_loop_elsedoneblock271
game_loop_ConditionalTrueBlock269: ;Main true block ;keep 
	; LineNumber: 380
	; LineNumber: 381
	dec frog_x
	; LineNumber: 382
game_loop_elsedoneblock271
	; LineNumber: 383
game_loop_elsedoneblock257
	; LineNumber: 386
	; Binary clause Simplified: NOTEQUALS
	lda frog_x
	; Compare with pure num / var optimization
	cmp frog_old_x;keep
	beq game_loop_localfailed281
	jmp game_loop_ConditionalTrueBlock277
game_loop_localfailed281: ;keep
	; ; logical OR, second chance
	; Binary clause Simplified: NOTEQUALS
	lda frog_y
	; Compare with pure num / var optimization
	cmp frog_old_y;keep
	beq game_loop_elsedoneblock279
game_loop_ConditionalTrueBlock277: ;Main true block ;keep 
	; LineNumber: 387
	; LineNumber: 388
	
; // only undraw if different
	; Assigning single variable : x
	lda frog_old_x
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda frog_old_y
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<previous_tile
	ldx #>previous_tile
	sta this_str
	stx this_str+1
	; Assigning single variable : str_len
	lda #$1
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 389
	; Assigning single variable : previous_tile
	; Assigning single variable : sx
	lda frog_x
	; Calling storevariable
	sta sx
	; Assigning single variable : sy
	lda frog_y
	; Calling storevariable
	sta sy
	jsr getat
	; Calling storevariable
	sta previous_tile
	; LineNumber: 390
game_loop_elsedoneblock279
	; LineNumber: 393
	; Binary clause Simplified: GREATEREQUAL
	lda frog_y
	; Compare with pure num / var optimization
	cmp #$11;keep
	bcc game_loop_elseblock285
game_loop_ConditionalTrueBlock284: ;Main true block ;keep 
	; LineNumber: 394
	; LineNumber: 395
	
; // draw the frog because things might have changed onscreen
	; Assigning single variable : x
	lda frog_x
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda frog_y
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<frogcharA
	ldx #>frogcharA
	sta this_str
	stx this_str+1
	; Assigning single variable : str_len
	lda #$1
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 397
	jmp game_loop_elsedoneblock286
game_loop_elseblock285
	; LineNumber: 398
	; LineNumber: 399
	; Assigning single variable : x
	lda frog_x
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda frog_y
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<frogcharB
	ldx #>frogcharB
	sta this_str
	stx this_str+1
	; Assigning single variable : str_len
	lda #$1
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 400
game_loop_elsedoneblock286
	; LineNumber: 405
	
; // Undraw "sprites"
	; Assigning single variable : x
	; 8 bit binop
	; Add/sub where right value is constant number
	lda #$28
	sec
	sbc crock_a_x
	 ; end add / sub var with constant
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$7
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<blank_river
	ldx #>blank_river
	sta this_str
	stx this_str+1
	; Assigning single variable : str_len
	lda #$9
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 406
	; Assigning single variable : x
	lda crock_a_x
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$8
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<blank_river
	ldx #>blank_river
	sta this_str
	stx this_str+1
	; Assigning single variable : str_len
	lda #$9
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 407
	; Assigning single variable : x
	; 8 bit binop
	; Add/sub where right value is constant number
	lda #$28
	sec
	sbc crock_a_x
	 ; end add / sub var with constant
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$9
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<blank_river
	ldx #>blank_river
	sta this_str
	stx this_str+1
	; Assigning single variable : str_len
	lda #$5
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 408
	; Assigning single variable : x
	lda crock_a_x
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$b
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<blank_river
	ldx #>blank_river
	sta this_str
	stx this_str+1
	; Assigning single variable : str_len
	lda #$5
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 409
	; Assigning single variable : x
	; 8 bit binop
	; Add/sub where right value is constant number
	lda #$28
	sec
	sbc crock_a_x
	 ; end add / sub var with constant
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$11
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<blank_road
	ldx #>blank_road
	sta this_str
	stx this_str+1
	; Assigning single variable : str_len
	lda #$4
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 410
	; Assigning single variable : x
	; 8 bit binop
	; Add/sub where right value is constant number
	lda #$28
	sec
	sbc crock_a_x
	 ; end add / sub var with constant
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$12
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<blank_road
	ldx #>blank_road
	sta this_str
	stx this_str+1
	; Assigning single variable : str_len
	lda #$4
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 411
	; Assigning single variable : x
	lda crock_a_x
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$14
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<blank_road
	ldx #>blank_road
	sta this_str
	stx this_str+1
	; Assigning single variable : str_len
	lda #$8
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 412
	; Assigning single variable : x
	lda crock_a_x
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$15
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<blank_road
	ldx #>blank_road
	sta this_str
	stx this_str+1
	; Assigning single variable : str_len
	lda #$8
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 426
	
; //		if(crock_a_x < 40) then 
; //		begin
; //			inc(crock_a_x); 
; //		end
; //		else
; //		begin
; //			crock_a_x := 0; 
; //		end;
; //
; // TRSE way
	inc crock_a_x
	lda crock_a_x
	cmp #$28 ; keep
	bne game_loop_incmax292
	lda #$0
	sta crock_a_x
game_loop_incmax292
	; LineNumber: 429
	
; // Draw "sprites"
	; Assigning single variable : x
	; 8 bit binop
	; Add/sub where right value is constant number
	lda #$28
	sec
	sbc crock_a_x
	 ; end add / sub var with constant
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$7
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<str_crockr
	ldx #>str_crockr
	sta this_str
	stx this_str+1
	; Assigning single variable : str_len
	lda #$9
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 430
	; Assigning single variable : x
	lda crock_a_x
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$8
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<str_crockl
	ldx #>str_crockl
	sta this_str
	stx this_str+1
	; Assigning single variable : str_len
	lda #$9
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 433
	; Assigning single variable : x
	; 8 bit binop
	; Add/sub where right value is constant number
	lda #$28
	sec
	sbc crock_a_x
	 ; end add / sub var with constant
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$9
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<str_logr
	ldx #>str_logr
	sta this_str
	stx this_str+1
	; Assigning single variable : str_len
	lda #$5
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 434
	; Assigning single variable : x
	lda crock_a_x
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$b
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<str_logl
	ldx #>str_logl
	sta this_str
	stx this_str+1
	; Assigning single variable : str_len
	lda #$5
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 437
	; Assigning single variable : x
	; 8 bit binop
	; Add/sub where right value is constant number
	lda #$28
	sec
	sbc crock_a_x
	 ; end add / sub var with constant
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$11
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<arr_carl
	ldx #>arr_carl
	sta this_str
	stx this_str+1
	; Assigning single variable : str_len
	lda #$4
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 438
	; Assigning single variable : x
	; 8 bit binop
	; Add/sub where right value is constant number
	lda #$28
	sec
	sbc crock_a_x
	 ; end add / sub var with constant
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$12
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<arr_carr
	ldx #>arr_carr
	sta this_str
	stx this_str+1
	; Assigning single variable : str_len
	lda #$4
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 440
	; Assigning single variable : x
	lda crock_a_x
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$14
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<arr_truckt
	ldx #>arr_truckt
	sta this_str
	stx this_str+1
	; Assigning single variable : str_len
	lda #$8
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 441
	; Assigning single variable : x
	lda crock_a_x
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$15
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<arr_truckb
	ldx #>arr_truckb
	sta this_str
	stx this_str+1
	; Assigning single variable : str_len
	lda #$8
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 444
	
; // Crappy delay
	jsr shit_delay
	; LineNumber: 445
	jmp game_loop_while73
game_loop_elsedoneblock76
	; LineNumber: 447
	rts
block1
	; LineNumber: 449
	; LineNumber: 452
MainProgram_while293
	; Binary clause Simplified: NOTEQUALS
	lda #$1
	; Compare with pure num / var optimization
	cmp #$0;keep
	beq MainProgram_elsedoneblock296
MainProgram_ConditionalTrueBlock294: ;Main true block ;keep 
	; LineNumber: 453
	; LineNumber: 454
	jsr title_screen
	; LineNumber: 455
	jsr init_vars
	; LineNumber: 456
	jsr game_loop
	; LineNumber: 457
	jsr score_screen
	; LineNumber: 458
	jmp MainProgram_while293
MainProgram_elsedoneblock296
	; LineNumber: 462
	; End of program
	; Ending memory block
EndBlock410
