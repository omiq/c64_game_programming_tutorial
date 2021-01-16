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
	; LineNumber: 403
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
by	
	dc.b	$02, $19, $20, $03, $08, $12, $09, $13, $20
	dc.b	$07, $01, $12, $12, $05, $14, $14, $20, $30
	dc.b	$31, $2f, $32, $30, $32, $31, $20, $20, 0
	; LineNumber: 18
url	
	dc.b	$00, $0d, $01, $0b, $05, $12, $08, $01, $03
	dc.b	$0b, $13, $20, $0d, $01, $0b, $05, $12, $08
	dc.b	$01, $03, $0b, $13, $2e, $03, $0f, $0d, 0
	; LineNumber: 19
over	
	dc.b	$07, $01, $0d, $05, $20, $0f, $16, $05, $12
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, 0
	; LineNumber: 20
score	
	dc.b	$19, $0f, $15, $20, $13, $03, $0f, $12, $05
	dc.b	$04, $3a, $20, $20, $20, $20, $20, $20, $20
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, 0
	; LineNumber: 21
space	
	dc.b	$10, $12, $05, $13, $13, $20, $13, $10, $01
	dc.b	$03, $05, $20, $14, $0f, $20, $03, $0f, $0e
	dc.b	$14, $09, $0e, $15, $05, $20, $20, $20, 0
	; LineNumber: 23
ALIVE	dc.b	$01
	; LineNumber: 24
WON_GAME	dc.b	$00
	; LineNumber: 30
frogcharA	dc.b	$d6
	; LineNumber: 31
frogcharB	dc.b	$56
	; LineNumber: 32
frog_x	dc.b	$14
	; LineNumber: 32
frog_old_x	dc.b	$14
	; LineNumber: 33
frog_y	dc.b	$19
	; LineNumber: 33
frog_old_y	dc.b	$19
	; LineNumber: 34
previous_tile	dc.b	$20
	; LineNumber: 37
arr_crockr	dc.b $0c0, $0a2, $0dc, $0dc, $0dc, $0dc, $0dc, $062
	dc.b $079
	; LineNumber: 38
str_crockr	
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	0 
	; LineNumber: 39
arr_crockl	dc.b $079, $062, $0dc, $0dc, $0dc, $0dc, $0dc, $0a2
	dc.b $0c0
	; LineNumber: 40
str_crockl	
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	0 
	; LineNumber: 41
arr_logl	dc.b $0a8, $0a8, $0a8, $0a8, $0d1
	; LineNumber: 42
str_logl	
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	0 
	; LineNumber: 43
arr_logr	dc.b $0d1, $0a9, $0a9, $0a9, $0a9
	; LineNumber: 44
str_logr	
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	0 
	; LineNumber: 45
arr_carl	dc.b $0f0, $0cf, $0d0, $0e0
	; LineNumber: 46
str_carl	
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	0 
	; LineNumber: 47
arr_carr	dc.b $0ed, $0d7, $0d7, $0a0
	; LineNumber: 48
str_carr	
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	0 
	; LineNumber: 49
arr_truckb	dc.b $0a0, $0d7, $062, $0d7, $0f1, $0d7, $0fd, $0a0
	; LineNumber: 50
str_truckb	
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	0 
	; LineNumber: 51
arr_truckt	dc.b $0e0, $060, $060, $060, $0fe, $0eb, $0ee, $0e0
	; LineNumber: 52
str_truckt	
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	0 
	; LineNumber: 55
crock_a_x	dc.b	$28
	; LineNumber: 58
logo	dc.b $072, $049, $070, $06e, $070, $072, $06e, $055
	dc.b $049, $020, $020, $020, $020, $06b, $04b, $06b
	dc.b $020, $020, $042, $020, $06b, $055, $055, $049
	dc.b $055, $049, $071, $020, $06d, $07d, $020, $071
	dc.b $020, $04b, $071, $04a, $04b, $04a, $042, $078
	dc.b $078, $078, $078, $078, $078, $078, $078, $078
	dc.b $078, $078, $04a, $04b
	; LineNumber: 70
blank_river	
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	0 
	; LineNumber: 71
blank_road	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, 0, 0, 0
	; LineNumber: 76
petscii1	dc.b $0cf, $0f7, $0f7, $0f7, $0f7, $0f7, $0f7, $0f7
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
	; LineNumber: 85
petscii2	dc.b $020, $020, $020, $020, $020, $020, $020, $020
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
	; LineNumber: 94
petscii3	dc.b $020, $020, $020, $020, $020, $020, $020, $020
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
	; LineNumber: 103
petscii4	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
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
	; LineNumber: 113
petscii5	dc.b $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6, $0e6
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
	; LineNumber: 124
cls
	; LineNumber: 125
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
	; LineNumber: 126
	; MoveTo optimization
	lda #$00
	sta screenmemory
	lda #>$8000
	clc
	adc #$00
	sta screenmemory+1
	; LineNumber: 127
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : getkey
	;    Procedure type : User-defined procedure
	; LineNumber: 132
getkey
	; LineNumber: 135
	; LineNumber: 136
	; Peek
	lda $97 + $0
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : waitkey
	;    Procedure type : User-defined procedure
	; LineNumber: 142
	; LineNumber: 141
this_key	dc.b	$ff
waitkey_block7
waitkey
	; LineNumber: 144
waitkey_while8
	; Binary clause Simplified: NOTEQUALS
	lda this_key
	; Compare with pure num / var optimization
	cmp #$20;keep
	beq waitkey_elsedoneblock11
waitkey_ConditionalTrueBlock9: ;Main true block ;keep 
	; LineNumber: 145
	; LineNumber: 146
	; Assigning single variable : this_key
	jsr getkey
	; Calling storevariable
	sta this_key
	; LineNumber: 147
	jmp waitkey_while8
waitkey_elsedoneblock11
	; LineNumber: 148
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : getat
	;    Procedure type : User-defined procedure
	; LineNumber: 154
	; LineNumber: 152
szp	= $02
	; LineNumber: 150
sx	dc.b	0
	; LineNumber: 150
sy	dc.b	0
getat_block14
getat
	; LineNumber: 155
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
	; LineNumber: 156
	; LineNumber: 157
	; Load pointer array
	ldy #$0
	lda (szp),y
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : textat
	;    Procedure type : User-defined procedure
	; LineNumber: 163
	; LineNumber: 161
zp	= $02
	; LineNumber: 159
x	dc.b	0
	; LineNumber: 159
y	dc.b	0
	; LineNumber: 159
this_str	= $04
	; LineNumber: 159
str_len	dc.b	0
textat_block21
textat
	; LineNumber: 164
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
	; LineNumber: 164
	; memcpyfast
	ldy str_len
	dey
textat_memcpy28
	lda (this_str),y
	sta (zp),y
	dey
	bpl textat_memcpy28
	; LineNumber: 166
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : title_screen
	;    Procedure type : User-defined procedure
	; LineNumber: 169
title_screen
	; LineNumber: 170
	jsr cls
	; LineNumber: 171
title_screen_while30
	; Binary clause Simplified: NOTEQUALS
	jsr getkey
	; Compare with pure num / var optimization
	cmp #$20;keep
	beq title_screen_localfailed39
	jmp title_screen_ConditionalTrueBlock31
title_screen_localfailed39
	jmp title_screen_elsedoneblock33
title_screen_ConditionalTrueBlock31: ;Main true block ;keep 
	; LineNumber: 172
	; LineNumber: 173
	; memcpyfast
	ldx #12
title_screen_memcpy41
	lda logo+ $00,x
	sta $8000,x
	dex
	bpl title_screen_memcpy41
	; LineNumber: 174
	; memcpyfast
	ldx #12
title_screen_memcpy42
	lda logo+ $0d,x
	sta $8028,x
	dex
	bpl title_screen_memcpy42
	; LineNumber: 175
	; memcpyfast
	ldx #12
title_screen_memcpy43
	lda logo+ $1a,x
	sta $8050,x
	dex
	bpl title_screen_memcpy43
	; LineNumber: 176
	; memcpyfast
	ldx #12
title_screen_memcpy44
	lda logo+ $27,x
	sta $8078,x
	dex
	bpl title_screen_memcpy44
	; LineNumber: 179
	; Assigning single variable : x
	lda #$0
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$6
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<by
	ldx #>by
	sta this_str
	stx this_str+1
	; Assigning single variable : str_len
	lda #$1a
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 180
	; Assigning single variable : x
	lda #$0
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$7
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<url
	ldx #>url
	sta this_str
	stx this_str+1
	; Assigning single variable : str_len
	lda #$1a
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 181
	; Assigning single variable : x
	lda #$0
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
	lda #$1a
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 182
	jmp title_screen_while30
title_screen_elsedoneblock33
	; LineNumber: 184
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : score_screen
	;    Procedure type : User-defined procedure
	; LineNumber: 187
score_screen
	; LineNumber: 188
	jsr cls
	; LineNumber: 189
score_screen_while46
	; Binary clause Simplified: NOTEQUALS
	jsr getkey
	; Compare with pure num / var optimization
	cmp #$20;keep
	beq score_screen_localfailed55
	jmp score_screen_ConditionalTrueBlock47
score_screen_localfailed55
	jmp score_screen_elsedoneblock49
score_screen_ConditionalTrueBlock47: ;Main true block ;keep 
	; LineNumber: 190
	; LineNumber: 191
	; memcpyfast
	ldx #12
score_screen_memcpy57
	lda logo+ $00,x
	sta $8000,x
	dex
	bpl score_screen_memcpy57
	; LineNumber: 192
	; memcpyfast
	ldx #12
score_screen_memcpy58
	lda logo+ $0d,x
	sta $8028,x
	dex
	bpl score_screen_memcpy58
	; LineNumber: 193
	; memcpyfast
	ldx #12
score_screen_memcpy59
	lda logo+ $1a,x
	sta $8050,x
	dex
	bpl score_screen_memcpy59
	; LineNumber: 194
	; memcpyfast
	ldx #12
score_screen_memcpy60
	lda logo+ $27,x
	sta $8078,x
	dex
	bpl score_screen_memcpy60
	; LineNumber: 197
	; Assigning single variable : x
	lda #$0
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
	lda #$1a
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 198
	; Assigning single variable : x
	lda #$0
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
	lda #$1a
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 199
	; Assigning single variable : x
	lda #$0
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
	lda #$1a
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 200
	jmp score_screen_while46
score_screen_elsedoneblock49
	; LineNumber: 202
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : init_vars
	;    Procedure type : User-defined procedure
	; LineNumber: 240
init_vars
	; LineNumber: 241
	jsr cls
	; LineNumber: 243
	
; // Init the playfield
	; Assigning single variable : screenmemory
	lda #$00
	ldx #$80
	sta screenmemory
	stx screenmemory+1
	; LineNumber: 243
	; memcpy
	ldy #0
init_vars_memcpy62
	lda petscii1+ $00,y
	sta (screenmemory),y
	iny
	cpy #$f0
	bne init_vars_memcpy62
	; LineNumber: 245
	; Assigning single variable : screenmemory
	lda #$f0
	ldx #$80
	sta screenmemory
	stx screenmemory+1
	; LineNumber: 245
	; memcpy
	ldy #0
init_vars_memcpy63
	lda petscii2+ $00,y
	sta (screenmemory),y
	iny
	cpy #$f0
	bne init_vars_memcpy63
	; LineNumber: 247
	; Assigning single variable : screenmemory
	lda #$e0
	ldx #$81
	sta screenmemory
	stx screenmemory+1
	; LineNumber: 247
	; memcpy
	ldy #0
init_vars_memcpy64
	lda petscii3+ $00,y
	sta (screenmemory),y
	iny
	cpy #$f0
	bne init_vars_memcpy64
	; LineNumber: 249
	; Assigning single variable : screenmemory
	lda #$d0
	ldx #$82
	sta screenmemory
	stx screenmemory+1
	; LineNumber: 249
	; memcpy
	ldy #0
init_vars_memcpy65
	lda petscii4+ $00,y
	sta (screenmemory),y
	iny
	cpy #$f0
	bne init_vars_memcpy65
	; LineNumber: 251
	; Assigning single variable : screenmemory
	lda #$c0
	ldx #$83
	sta screenmemory
	stx screenmemory+1
	; LineNumber: 251
	; memcpy
	ldy #0
init_vars_memcpy66
	lda petscii5+ $00,y
	sta (screenmemory),y
	iny
	cpy #$28
	bne init_vars_memcpy66
	; LineNumber: 253
	; Assigning single variable : screenmemory
	lda #$00
	ldx #$80
	sta screenmemory
	stx screenmemory+1
	; LineNumber: 258
	
; // Init the "sprites"
	; memcpy
	ldx #0
init_vars_memcpy67
	lda arr_crockr+ $00,x
	sta str_crockr,x
	inx
	cpx #$9
	bne init_vars_memcpy67
	; LineNumber: 259
	; memcpy
	ldx #0
init_vars_memcpy68
	lda arr_crockl+ $00,x
	sta str_crockl,x
	inx
	cpx #$9
	bne init_vars_memcpy68
	; LineNumber: 260
	; memcpy
	ldx #0
init_vars_memcpy69
	lda arr_logl+ $00,x
	sta str_logl,x
	inx
	cpx #$5
	bne init_vars_memcpy69
	; LineNumber: 261
	; memcpy
	ldx #0
init_vars_memcpy70
	lda arr_logr+ $00,x
	sta str_logr,x
	inx
	cpx #$5
	bne init_vars_memcpy70
	; LineNumber: 262
	; memcpy
	ldx #0
init_vars_memcpy71
	lda arr_truckt+ $00,x
	sta str_truckt,x
	inx
	cpx #$8
	bne init_vars_memcpy71
	; LineNumber: 263
	; memcpy
	ldx #0
init_vars_memcpy72
	lda arr_truckb+ $00,x
	sta str_truckb,x
	inx
	cpx #$8
	bne init_vars_memcpy72
	; LineNumber: 264
	; memcpy
	ldx #0
init_vars_memcpy73
	lda arr_carl+ $00,x
	sta str_carl,x
	inx
	cpx #$4
	bne init_vars_memcpy73
	; LineNumber: 265
	; memcpy
	ldx #0
init_vars_memcpy74
	lda arr_carr+ $00,x
	sta str_carr,x
	inx
	cpx #$4
	bne init_vars_memcpy74
	; LineNumber: 268
	; Assigning single variable : crock_a_x
	lda #$0
	; Calling storevariable
	sta crock_a_x
	; LineNumber: 269
	; Assigning single variable : frog_x
	lda #$14
	; Calling storevariable
	sta frog_x
	; LineNumber: 270
	; Assigning single variable : frog_y
	lda #$a
	; Calling storevariable
	sta frog_y
	; LineNumber: 272
	; Assigning single variable : KEYPRESS
	lda #$0
	; Calling storevariable
	sta KEYPRESS
	; LineNumber: 273
	; Assigning single variable : ALIVE
	lda #$1
	; Calling storevariable
	sta ALIVE
	; LineNumber: 274
	; Assigning single variable : WON_GAME
	lda #$0
	; Calling storevariable
	sta WON_GAME
	; LineNumber: 275
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : game_loop
	;    Procedure type : User-defined procedure
	; LineNumber: 278
game_loop
	; LineNumber: 281
game_loop_while76
	; Binary clause Simplified: EQUALS
	lda ALIVE
	; Compare with pure num / var optimization
	cmp #$1;keep
	bne game_loop_localfailed195
game_loop_localsuccess196: ;keep
	; ; logical AND, second requirement
	; Binary clause Simplified: EQUALS
	lda WON_GAME
	; Compare with pure num / var optimization
	cmp #$0;keep
	bne game_loop_localfailed195
	jmp game_loop_ConditionalTrueBlock77
game_loop_localfailed195
	jmp game_loop_elsedoneblock79
game_loop_ConditionalTrueBlock77: ;Main true block ;keep 
	; LineNumber: 282
	; LineNumber: 283
	; Assigning single variable : frog_old_x
	lda frog_x
	; Calling storevariable
	sta frog_old_x
	; LineNumber: 284
	; Assigning single variable : frog_old_y
	lda frog_y
	; Calling storevariable
	sta frog_old_y
	; LineNumber: 285
	; Assigning single variable : KEYPRESS
	jsr getkey
	; Calling storevariable
	sta KEYPRESS
	; LineNumber: 288
	; Binary clause Simplified: EQUALS
	; Compare with pure num / var optimization
	cmp #$b8;keep
	bne game_loop_elsedoneblock201
game_loop_ConditionalTrueBlock199: ;Main true block ;keep 
	; LineNumber: 289
	; LineNumber: 290
	; Binary clause Simplified: GREATEREQUAL
	lda frog_y
	; Compare with pure num / var optimization
	cmp #$5;keep
	bcc game_loop_elsedoneblock215
game_loop_ConditionalTrueBlock213: ;Main true block ;keep 
	; LineNumber: 291
	; LineNumber: 292
	
; //textat(30,20, #KEYPRESS,1);
	dec frog_y
	; LineNumber: 293
game_loop_elsedoneblock215
	; LineNumber: 294
game_loop_elsedoneblock201
	; LineNumber: 296
	; Binary clause Simplified: EQUALS
	lda KEYPRESS
	; Compare with pure num / var optimization
	cmp #$b6;keep
	bne game_loop_elsedoneblock223
game_loop_ConditionalTrueBlock221: ;Main true block ;keep 
	; LineNumber: 297
	; LineNumber: 298
	; Binary clause Simplified: LESS
	lda frog_x
	; Compare with pure num / var optimization
	cmp #$27;keep
	bcs game_loop_elsedoneblock237
game_loop_ConditionalTrueBlock235: ;Main true block ;keep 
	; LineNumber: 299
	; LineNumber: 300
	inc frog_x
	; LineNumber: 301
game_loop_elsedoneblock237
	; LineNumber: 302
game_loop_elsedoneblock223
	; LineNumber: 304
	; Binary clause Simplified: EQUALS
	lda KEYPRESS
	; Compare with pure num / var optimization
	cmp #$b2;keep
	bne game_loop_localfailed255
	jmp game_loop_ConditionalTrueBlock243
game_loop_localfailed255: ;keep
	; ; logical OR, second chance
	; Binary clause Simplified: EQUALS
	lda KEYPRESS
	; Compare with pure num / var optimization
	cmp #$b5;keep
	bne game_loop_elsedoneblock245
game_loop_ConditionalTrueBlock243: ;Main true block ;keep 
	; LineNumber: 305
	; LineNumber: 306
	; Binary clause Simplified: LESS
	lda frog_y
	; Compare with pure num / var optimization
	cmp #$18;keep
	bcs game_loop_elsedoneblock260
game_loop_ConditionalTrueBlock258: ;Main true block ;keep 
	; LineNumber: 307
	; LineNumber: 308
	inc frog_y
	; LineNumber: 309
game_loop_elsedoneblock260
	; LineNumber: 310
game_loop_elsedoneblock245
	; LineNumber: 312
	; Binary clause Simplified: EQUALS
	lda KEYPRESS
	; Compare with pure num / var optimization
	cmp #$b4;keep
	bne game_loop_elsedoneblock268
game_loop_ConditionalTrueBlock266: ;Main true block ;keep 
	; LineNumber: 313
	; LineNumber: 314
	; Binary clause Simplified: GREATEREQUAL
	lda frog_x
	; Compare with pure num / var optimization
	cmp #$1;keep
	bcc game_loop_elsedoneblock282
game_loop_ConditionalTrueBlock280: ;Main true block ;keep 
	; LineNumber: 315
	; LineNumber: 316
	dec frog_x
	; LineNumber: 317
game_loop_elsedoneblock282
	; LineNumber: 318
game_loop_elsedoneblock268
	; LineNumber: 321
	; Binary clause Simplified: NOTEQUALS
	lda frog_x
	; Compare with pure num / var optimization
	cmp frog_old_x;keep
	beq game_loop_localfailed292
	jmp game_loop_ConditionalTrueBlock288
game_loop_localfailed292: ;keep
	; ; logical OR, second chance
	; Binary clause Simplified: NOTEQUALS
	lda frog_y
	; Compare with pure num / var optimization
	cmp frog_old_y;keep
	beq game_loop_elsedoneblock290
game_loop_ConditionalTrueBlock288: ;Main true block ;keep 
	; LineNumber: 322
	; LineNumber: 323
	
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
	; LineNumber: 324
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
	; LineNumber: 325
game_loop_elsedoneblock290
	; LineNumber: 328
	; Binary clause Simplified: GREATEREQUAL
	lda frog_y
	; Compare with pure num / var optimization
	cmp #$11;keep
	bcc game_loop_elseblock296
game_loop_ConditionalTrueBlock295: ;Main true block ;keep 
	; LineNumber: 329
	; LineNumber: 330
	
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
	; LineNumber: 332
	jmp game_loop_elsedoneblock297
game_loop_elseblock296
	; LineNumber: 333
	; LineNumber: 334
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
	; LineNumber: 335
game_loop_elsedoneblock297
	; LineNumber: 340
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
	; LineNumber: 341
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
	; LineNumber: 342
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
	; LineNumber: 343
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
	; LineNumber: 344
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
	; LineNumber: 345
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
	; LineNumber: 346
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
	; LineNumber: 347
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
	; LineNumber: 349
	; Binary clause Simplified: LESS
	lda crock_a_x
	; Compare with pure num / var optimization
	cmp #$28;keep
	bcs game_loop_elseblock304
game_loop_ConditionalTrueBlock303: ;Main true block ;keep 
	; LineNumber: 350
	; LineNumber: 350
	inc crock_a_x
	; LineNumber: 353
	jmp game_loop_elsedoneblock305
game_loop_elseblock304
	; LineNumber: 354
	; LineNumber: 355
	; Assigning single variable : crock_a_x
	lda #$0
	; Calling storevariable
	sta crock_a_x
	; LineNumber: 356
game_loop_elsedoneblock305
	; LineNumber: 360
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
	; LineNumber: 361
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
	; LineNumber: 364
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
	; LineNumber: 365
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
	; LineNumber: 368
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
	; LineNumber: 369
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
	; LineNumber: 371
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
	; LineNumber: 372
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
	; LineNumber: 374
	; Wait
	lda #$ff
	ldy #$ff
	tax
	dex
	bne *-1
	; LineNumber: 375
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 376
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 377
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 378
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 379
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 380
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 381
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 381
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 383
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 384
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 385
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 386
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 387
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 388
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 389
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 389
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 391
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 392
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 393
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 394
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 395
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 396
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 397
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 398
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 399
	jmp game_loop_while76
game_loop_elsedoneblock79
	; LineNumber: 401
	rts
block1
	; LineNumber: 403
	; LineNumber: 406
MainProgram_while312
	; Binary clause Simplified: NOTEQUALS
	lda #$1
	; Compare with pure num / var optimization
	cmp #$0;keep
	beq MainProgram_elsedoneblock315
MainProgram_ConditionalTrueBlock313: ;Main true block ;keep 
	; LineNumber: 407
	; LineNumber: 408
	jsr title_screen
	; LineNumber: 409
	jsr init_vars
	; LineNumber: 410
	jsr game_loop
	; LineNumber: 411
	jsr score_screen
	; LineNumber: 412
	jmp MainProgram_while312
MainProgram_elsedoneblock315
	; LineNumber: 416
	; End of program
	; Ending memory block
EndBlock410
