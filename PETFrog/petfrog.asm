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
	; LineNumber: 148
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
	; LineNumber: 21
frogcharA	dc.b	$d6
	; LineNumber: 22
frogcharB	dc.b	$56
	; LineNumber: 23
frog_x	dc.b	$14
	; LineNumber: 23
frog_old_x	dc.b	$14
	; LineNumber: 24
frog_y	dc.b	$19
	; LineNumber: 24
frog_old_y	dc.b	$19
	; LineNumber: 25
previous_tile	dc.b	$20
	; LineNumber: 28
arr_crockr	dc.b $0c0, $0a2, $0dc, $0dc, $0dc, $0dc, $0dc, $062
	dc.b $079
	; LineNumber: 29
str_crockr	
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	0 
	; LineNumber: 30
arr_crockl	dc.b $079, $062, $0dc, $0dc, $0dc, $0dc, $0dc, $0a2
	dc.b $0c0
	; LineNumber: 31
str_crockl	
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	0 
	; LineNumber: 32
arr_logl	dc.b $0a8, $0a8, $0a8, $0a8, $0d1
	; LineNumber: 33
str_logl	
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	0 
	; LineNumber: 34
arr_logr	dc.b $0d1, $0a9, $0a9, $0a9, $0a9
	; LineNumber: 35
str_logr	
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	0 
	; LineNumber: 36
arr_carl	dc.b $0f0, $0cf, $0d0, $0e0
	; LineNumber: 37
str_carl	
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	0 
	; LineNumber: 38
arr_carr	dc.b $0ed, $0d7, $0d7, $0a0
	; LineNumber: 39
str_carr	
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	0 
	; LineNumber: 40
arr_truckb	dc.b $0a0, $0d7, $062, $0d7, $0f1, $0d7, $0fd, $0a0
	; LineNumber: 41
str_truckb	
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	0 
	; LineNumber: 42
arr_truckt	dc.b $0e0, $060, $060, $060, $0fe, $0eb, $0ee, $0e0
	; LineNumber: 43
str_truckt	
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	0 
	; LineNumber: 46
crock_a_x	dc.b	$28
	; LineNumber: 49
blank_river	
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	0 
	; LineNumber: 50
blank_road	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, 0, 0, 0
	; LineNumber: 55
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
	; LineNumber: 64
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
	; LineNumber: 73
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
	; LineNumber: 82
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
	; LineNumber: 92
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
	
; //1   2   3   4   5   6   7   8   9   0   1   2   3   4   5   6   7   8   9   20  1   2   3   4   5   6   7   8   9   30  1   2   3   4   5   6   7   8   9   40   
; // =============================================================================================== 
	; NodeProcedureDecl -1
	; ***********  Defining procedure : cls
	;    Procedure type : User-defined procedure
	; LineNumber: 103
cls
	; LineNumber: 104
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
	; LineNumber: 105
	; MoveTo optimization
	lda #$00
	sta screenmemory
	lda #>$8000
	clc
	adc #$00
	sta screenmemory+1
	; LineNumber: 106
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : getkey
	;    Procedure type : User-defined procedure
	; LineNumber: 111
getkey
	; LineNumber: 114
	; LineNumber: 115
	; Peek
	lda $97 + $0
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : waitkey
	;    Procedure type : User-defined procedure
	; LineNumber: 121
	; LineNumber: 120
this_key	dc.b	$ff
waitkey_block7
waitkey
	; LineNumber: 123
waitkey_while8
	; Binary clause Simplified: NOTEQUALS
	lda this_key
	; Compare with pure num / var optimization
	cmp #$20;keep
	beq waitkey_elsedoneblock11
waitkey_ConditionalTrueBlock9: ;Main true block ;keep 
	; LineNumber: 124
	; LineNumber: 125
	; Assigning single variable : this_key
	jsr getkey
	; Calling storevariable
	sta this_key
	; LineNumber: 126
	jmp waitkey_while8
waitkey_elsedoneblock11
	; LineNumber: 127
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : getat
	;    Procedure type : User-defined procedure
	; LineNumber: 133
	; LineNumber: 131
szp	= $02
	; LineNumber: 129
sx	dc.b	0
	; LineNumber: 129
sy	dc.b	0
getat_block14
getat
	; LineNumber: 134
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
	; LineNumber: 135
	; LineNumber: 136
	; Load pointer array
	ldy #$0
	lda (szp),y
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : textat
	;    Procedure type : User-defined procedure
	; LineNumber: 142
	; LineNumber: 140
zp	= $02
	; LineNumber: 138
x	dc.b	0
	; LineNumber: 138
y	dc.b	0
	; LineNumber: 138
this_str	= $04
	; LineNumber: 138
str_len	dc.b	0
textat_block21
textat
	; LineNumber: 143
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
	; LineNumber: 143
	; memcpyfast
	ldy str_len
	dey
textat_memcpy28
	lda (this_str),y
	sta (zp),y
	dey
	bpl textat_memcpy28
	; LineNumber: 145
	rts
block1
	; LineNumber: 148
	; LineNumber: 150
	jsr cls
	; LineNumber: 154
	
; // Init the playfield
	; Assigning single variable : screenmemory
	lda #$00
	ldx #$80
	sta screenmemory
	stx screenmemory+1
	; LineNumber: 154
	; memcpy
	ldy #0
MainProgram_memcpy29
	lda petscii1+ $00,y
	sta (screenmemory),y
	iny
	cpy #$f0
	bne MainProgram_memcpy29
	; LineNumber: 156
	; Assigning single variable : screenmemory
	lda #$f0
	ldx #$80
	sta screenmemory
	stx screenmemory+1
	; LineNumber: 156
	; memcpy
	ldy #0
MainProgram_memcpy30
	lda petscii2+ $00,y
	sta (screenmemory),y
	iny
	cpy #$f0
	bne MainProgram_memcpy30
	; LineNumber: 158
	; Assigning single variable : screenmemory
	lda #$e0
	ldx #$81
	sta screenmemory
	stx screenmemory+1
	; LineNumber: 158
	; memcpy
	ldy #0
MainProgram_memcpy31
	lda petscii3+ $00,y
	sta (screenmemory),y
	iny
	cpy #$f0
	bne MainProgram_memcpy31
	; LineNumber: 160
	; Assigning single variable : screenmemory
	lda #$d0
	ldx #$82
	sta screenmemory
	stx screenmemory+1
	; LineNumber: 160
	; memcpy
	ldy #0
MainProgram_memcpy32
	lda petscii4+ $00,y
	sta (screenmemory),y
	iny
	cpy #$f0
	bne MainProgram_memcpy32
	; LineNumber: 162
	; Assigning single variable : screenmemory
	lda #$c0
	ldx #$83
	sta screenmemory
	stx screenmemory+1
	; LineNumber: 162
	; memcpy
	ldy #0
MainProgram_memcpy33
	lda petscii5+ $00,y
	sta (screenmemory),y
	iny
	cpy #$28
	bne MainProgram_memcpy33
	; LineNumber: 164
	; Assigning single variable : screenmemory
	lda #$00
	ldx #$80
	sta screenmemory
	stx screenmemory+1
	; LineNumber: 169
	
; // Init the "sprites"
	; memcpy
	ldx #0
MainProgram_memcpy34
	lda arr_crockr+ $00,x
	sta str_crockr,x
	inx
	cpx #$9
	bne MainProgram_memcpy34
	; LineNumber: 170
	; memcpy
	ldx #0
MainProgram_memcpy35
	lda arr_crockl+ $00,x
	sta str_crockl,x
	inx
	cpx #$9
	bne MainProgram_memcpy35
	; LineNumber: 171
	; memcpy
	ldx #0
MainProgram_memcpy36
	lda arr_logl+ $00,x
	sta str_logl,x
	inx
	cpx #$5
	bne MainProgram_memcpy36
	; LineNumber: 172
	; memcpy
	ldx #0
MainProgram_memcpy37
	lda arr_logr+ $00,x
	sta str_logr,x
	inx
	cpx #$5
	bne MainProgram_memcpy37
	; LineNumber: 173
	; memcpy
	ldx #0
MainProgram_memcpy38
	lda arr_truckt+ $00,x
	sta str_truckt,x
	inx
	cpx #$8
	bne MainProgram_memcpy38
	; LineNumber: 174
	; memcpy
	ldx #0
MainProgram_memcpy39
	lda arr_truckb+ $00,x
	sta str_truckb,x
	inx
	cpx #$8
	bne MainProgram_memcpy39
	; LineNumber: 175
	; memcpy
	ldx #0
MainProgram_memcpy40
	lda arr_carl+ $00,x
	sta str_carl,x
	inx
	cpx #$4
	bne MainProgram_memcpy40
	; LineNumber: 176
	; memcpy
	ldx #0
MainProgram_memcpy41
	lda arr_carr+ $00,x
	sta str_carr,x
	inx
	cpx #$4
	bne MainProgram_memcpy41
	; LineNumber: 179
	; Assigning single variable : crock_a_x
	lda #$0
	; Calling storevariable
	sta crock_a_x
	; LineNumber: 180
	; Assigning single variable : frog_x
	lda #$14
	; Calling storevariable
	sta frog_x
	; LineNumber: 181
	; Assigning single variable : frog_y
	lda #$a
	; Calling storevariable
	sta frog_y
	; LineNumber: 183
MainProgram_while42
	; Binary clause Simplified: NOTEQUALS
	lda KEYPRESS
	; Compare with pure num / var optimization
	cmp #$20;keep
	beq MainProgram_localfailed161
	jmp MainProgram_ConditionalTrueBlock43
MainProgram_localfailed161
	jmp MainProgram_elsedoneblock45
MainProgram_ConditionalTrueBlock43: ;Main true block ;keep 
	; LineNumber: 184
	; LineNumber: 185
	; Assigning single variable : frog_old_x
	lda frog_x
	; Calling storevariable
	sta frog_old_x
	; LineNumber: 186
	; Assigning single variable : frog_old_y
	lda frog_y
	; Calling storevariable
	sta frog_old_y
	; LineNumber: 187
	; Assigning single variable : KEYPRESS
	jsr getkey
	; Calling storevariable
	sta KEYPRESS
	; LineNumber: 190
	; Binary clause Simplified: EQUALS
	; Compare with pure num / var optimization
	cmp #$b8;keep
	bne MainProgram_elsedoneblock166
MainProgram_ConditionalTrueBlock164: ;Main true block ;keep 
	; LineNumber: 191
	; LineNumber: 192
	; Binary clause Simplified: GREATEREQUAL
	lda frog_y
	; Compare with pure num / var optimization
	cmp #$5;keep
	bcc MainProgram_elsedoneblock180
MainProgram_ConditionalTrueBlock178: ;Main true block ;keep 
	; LineNumber: 193
	; LineNumber: 194
	
; //textat(30,20, #KEYPRESS,1);
	dec frog_y
	; LineNumber: 195
MainProgram_elsedoneblock180
	; LineNumber: 196
MainProgram_elsedoneblock166
	; LineNumber: 198
	; Binary clause Simplified: EQUALS
	lda KEYPRESS
	; Compare with pure num / var optimization
	cmp #$b6;keep
	bne MainProgram_elsedoneblock188
MainProgram_ConditionalTrueBlock186: ;Main true block ;keep 
	; LineNumber: 199
	; LineNumber: 200
	; Binary clause Simplified: LESS
	lda frog_x
	; Compare with pure num / var optimization
	cmp #$27;keep
	bcs MainProgram_elsedoneblock202
MainProgram_ConditionalTrueBlock200: ;Main true block ;keep 
	; LineNumber: 201
	; LineNumber: 202
	inc frog_x
	; LineNumber: 203
MainProgram_elsedoneblock202
	; LineNumber: 204
MainProgram_elsedoneblock188
	; LineNumber: 206
	; Binary clause Simplified: EQUALS
	lda KEYPRESS
	; Compare with pure num / var optimization
	cmp #$b2;keep
	bne MainProgram_localfailed220
	jmp MainProgram_ConditionalTrueBlock208
MainProgram_localfailed220: ;keep
	; ; logical OR, second chance
	; Binary clause Simplified: EQUALS
	lda KEYPRESS
	; Compare with pure num / var optimization
	cmp #$b5;keep
	bne MainProgram_elsedoneblock210
MainProgram_ConditionalTrueBlock208: ;Main true block ;keep 
	; LineNumber: 207
	; LineNumber: 208
	; Binary clause Simplified: LESS
	lda frog_y
	; Compare with pure num / var optimization
	cmp #$18;keep
	bcs MainProgram_elsedoneblock225
MainProgram_ConditionalTrueBlock223: ;Main true block ;keep 
	; LineNumber: 209
	; LineNumber: 210
	inc frog_y
	; LineNumber: 211
MainProgram_elsedoneblock225
	; LineNumber: 212
MainProgram_elsedoneblock210
	; LineNumber: 214
	; Binary clause Simplified: EQUALS
	lda KEYPRESS
	; Compare with pure num / var optimization
	cmp #$b4;keep
	bne MainProgram_elsedoneblock233
MainProgram_ConditionalTrueBlock231: ;Main true block ;keep 
	; LineNumber: 215
	; LineNumber: 216
	; Binary clause Simplified: GREATEREQUAL
	lda frog_x
	; Compare with pure num / var optimization
	cmp #$1;keep
	bcc MainProgram_elsedoneblock247
MainProgram_ConditionalTrueBlock245: ;Main true block ;keep 
	; LineNumber: 217
	; LineNumber: 218
	dec frog_x
	; LineNumber: 219
MainProgram_elsedoneblock247
	; LineNumber: 220
MainProgram_elsedoneblock233
	; LineNumber: 223
	; Binary clause Simplified: NOTEQUALS
	lda frog_x
	; Compare with pure num / var optimization
	cmp frog_old_x;keep
	beq MainProgram_localfailed257
	jmp MainProgram_ConditionalTrueBlock253
MainProgram_localfailed257: ;keep
	; ; logical OR, second chance
	; Binary clause Simplified: NOTEQUALS
	lda frog_y
	; Compare with pure num / var optimization
	cmp frog_old_y;keep
	beq MainProgram_elsedoneblock255
MainProgram_ConditionalTrueBlock253: ;Main true block ;keep 
	; LineNumber: 224
	; LineNumber: 225
	
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
	; LineNumber: 226
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
	; LineNumber: 227
MainProgram_elsedoneblock255
	; LineNumber: 230
	; Binary clause Simplified: GREATEREQUAL
	lda frog_y
	; Compare with pure num / var optimization
	cmp #$11;keep
	bcc MainProgram_elseblock261
MainProgram_ConditionalTrueBlock260: ;Main true block ;keep 
	; LineNumber: 231
	; LineNumber: 232
	
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
	; LineNumber: 234
	jmp MainProgram_elsedoneblock262
MainProgram_elseblock261
	; LineNumber: 235
	; LineNumber: 236
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
	; LineNumber: 237
MainProgram_elsedoneblock262
	; LineNumber: 242
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
	; LineNumber: 243
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
	; LineNumber: 244
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
	; LineNumber: 245
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
	; LineNumber: 246
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
	; LineNumber: 247
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
	; LineNumber: 248
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
	; LineNumber: 249
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
	; LineNumber: 251
	; Binary clause Simplified: LESS
	lda crock_a_x
	; Compare with pure num / var optimization
	cmp #$28;keep
	bcs MainProgram_elseblock269
MainProgram_ConditionalTrueBlock268: ;Main true block ;keep 
	; LineNumber: 252
	; LineNumber: 252
	inc crock_a_x
	; LineNumber: 255
	jmp MainProgram_elsedoneblock270
MainProgram_elseblock269
	; LineNumber: 256
	; LineNumber: 257
	; Assigning single variable : crock_a_x
	lda #$0
	; Calling storevariable
	sta crock_a_x
	; LineNumber: 258
MainProgram_elsedoneblock270
	; LineNumber: 262
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
	; LineNumber: 263
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
	; LineNumber: 266
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
	; LineNumber: 267
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
	; LineNumber: 270
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
	; LineNumber: 271
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
	; LineNumber: 273
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
	; LineNumber: 274
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
	; LineNumber: 276
	; Wait
	lda #$ff
	ldy #$ff
	tax
	dex
	bne *-1
	; LineNumber: 277
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 278
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 279
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 280
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 281
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 282
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 283
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 283
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 285
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 286
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 287
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 288
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 289
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 290
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 291
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 291
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 293
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 294
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 295
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 296
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 297
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 298
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 299
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 300
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 301
	jmp MainProgram_while42
MainProgram_elsedoneblock45
	; LineNumber: 306
	
; // Second doesn't
	jsr waitkey
	; LineNumber: 307
	; Assigning memory location
	; Assigning single variable : $8000
	; Integer constant assigning
	ldy #$80
	lda #$00
	; Calling storevariable
	sta $8000
	; LineNumber: 308
	; Assigning single variable : screenmemory
	ldx #$80
	sta screenmemory
	stx screenmemory+1
	; LineNumber: 309
	jsr cls
	; LineNumber: 312
	; Assigning single variable : screenmemory
	lda #$28
	ldx #$80
	sta screenmemory
	stx screenmemory+1
	; LineNumber: 313
	; Binary clause Simplified: EQUALS
	; Peek
	lda $c353 + $0
	; Compare with pure num / var optimization
	cmp #$a0;keep
	bne MainProgram_elsedoneblock280
MainProgram_ConditionalTrueBlock278: ;Main true block ;keep 
	; LineNumber: 314
	; LineNumber: 315
	; Assigning single variable : x
	lda #$5
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$f
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<rom4
	ldx #>rom4
	sta this_str
	stx this_str+1
	; Assigning single variable : str_len
	lda #$7
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 316
MainProgram_elsedoneblock280
	; LineNumber: 318
	; Binary clause Simplified: EQUALS
	; Peek
	lda $c353 + $0
	; Compare with pure num / var optimization
	cmp #$7;keep
	bne MainProgram_elsedoneblock286
MainProgram_ConditionalTrueBlock284: ;Main true block ;keep 
	; LineNumber: 319
	; LineNumber: 320
	
; //4.0 ROMS
	; Assigning single variable : x
	lda #$5
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$f
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<rom2
	ldx #>rom2
	sta this_str
	stx this_str+1
	; Assigning single variable : str_len
	lda #$8
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 321
MainProgram_elsedoneblock286
	; LineNumber: 331
	; Assigning single variable : i
	ldy #0
	lda #$0
	; Calling storevariable
	sta i
	sty i+1
MainProgram_forloop289
	; LineNumber: 327
	; LineNumber: 329
	
; //2.0 ROMS
; // Loop through all PETSCII characters
; // Put the character at screen address
	; Assigning single variable : $8000
	; Store Variable simplified optimization : right-hand term is pure
	; integer assignment NodeVar
	ldy i+1 ; Next one
	ldx i ; optimized, look out for bugs
	; integer assignment NodeVar
	lda i
	sta $8000,x
	; LineNumber: 330
MainProgram_forloopcounter291
	; Compare is onpage
	inc i
	bne MainProgram_lblCounterWord295
	inc i+1
MainProgram_lblCounterWord295
	; Executing integer comparison #$ff
	; Binary clause INTEGER: NOTEQUALS
	; Compare INTEGER with pure num / var optimization. GREATER. 
	lda i+1   ; compare high bytes
	cmp #$00 ;keep
	beq MainProgram_pass1301
	jmp MainProgram_ConditionalTrueBlock297
MainProgram_pass1301
	lda i
	cmp #$ff ;keep
	beq MainProgram_elsedoneblock299
	jmp MainProgram_ConditionalTrueBlock297
MainProgram_ConditionalTrueBlock297: ;Main true block ;keep 
	; LineNumber: 325
	; LineNumber: 326
	; ****** Inline assembler section
  jmp MainProgram_forloop289
MainProgram_elsedoneblock299
MainProgram_loopdone294: ;keep
MainProgram_forloopend290
	; LineNumber: 332
	; Assigning single variable : x
	lda #$0
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$a
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<MainProgram_stringassignstr303
	sta this_str
	lda #>MainProgram_stringassignstr303
	sta this_str+1
	; Assigning single variable : str_len
	lda #$28
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 334
	jmp * ; loop like (�/%
	; LineNumber: 336
	; End of program
	; Ending memory block
EndBlock410
MainProgram_stringassignstr303	.dc "1234567890123456789012345678901234567890",0
