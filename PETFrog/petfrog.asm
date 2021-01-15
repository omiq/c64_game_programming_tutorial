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
	; LineNumber: 125
	jmp block1
	; LineNumber: 4
i	dc.w	$00
	; LineNumber: 6
cs	
	dc.b	$14, $12, $13, $05, $20, $13, $10, $05, $01
	dc.b	$0b, $20, $10, $05, $14, $13, $03, $09, $09
	dc.b	0 
	; LineNumber: 8
rom4	
	dc.b	$34, $2e, $30, $20, $12, $0f, $0d, 0
	; LineNumber: 9
rom2	
	dc.b	$32, $2e, $30, $20, $12, $0f, $0d, 0
	; LineNumber: 23
crockr	dc.b $0c0, $0a2, $0dc, $0dc, $0dc, $0dc, $0dc, $062
	dc.b $079
	; LineNumber: 24
crockl	dc.b $079, $062, $0dc, $0dc, $0dc, $0dc, $0dc, $0a2
	dc.b $0c0
	; LineNumber: 25
logr	dc.b $0a8, $0a8, $0a8, $0a8, $0d1
	; LineNumber: 26
logl	dc.b $0d1, $0a9, $0a9, $0a9, $056
	; LineNumber: 32
truckt	dc.b $0a0, $0d7, $062, $0d7, $0f1, $0d7, $0fd, $0a0
	; LineNumber: 33
truckb	dc.b $0e2, $0e2, $0e2, $0e2, $0e2, $0e2, $0e2, $0e2
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
	; NodeProcedureDecl -1
	; ***********  Defining procedure : initprintstring
	;    Procedure type : User-defined procedure
print_text = $4c
print_number_text .dc "    ",0
printstring
	ldy #0
printstringloop
	lda (print_text),y
	cmp #0 ;keep
	beq printstring_done
	cmp #64
	bcc printstring_skip
	sec
	sbc #64
printstring_skip
	sta (screenmemory),y
	iny
	dex
	cpx #0
	beq printstring_done
	jmp printstringloop
printstring_done
	rts
	
; // Keys being pressed
; // Keyboard buffer
; //1   2   3   4   5   6   7   8   9   0   1   2   3   4   5   6   7   8   9   20  1   2   3   4   5   6   7   8   9   30  1   2   3   4   5   6   7   8   9   40   
; //
; //charspr: array[240] of byte =( 227,227,227,227,);
; //charspr: array[240] of byte =( 240,207,208,224,);
; //charspr: array[240] of byte =( 237,215,215,160,);
; //charspr: array[240] of byte =( 173,173,173,173,173,173,173,173,);
; //charspr: array[240] of byte =( 224, 96, 96, 96,254,235,238,224,); =============================================================================================== 
	; NodeProcedureDecl -1
	; ***********  Defining procedure : cls
	;    Procedure type : User-defined procedure
	; LineNumber: 85
cls
	; LineNumber: 85
	lda #$ff
	ldx #0
cls_fill5
	sta $8000,x
	inx
	cpx #$20
	bne cls_fill5
	; LineNumber: 86
	
; // Fill rows of spaces 
	lda #$ff
	ldx #0
cls_fill6
	sta $80fa,x
	inx
	cpx #$20
	bne cls_fill6
	; LineNumber: 87
	
; // 
	lda #$ff
	ldx #0
cls_fill7
	sta $81f4,x
	inx
	cpx #$20
	bne cls_fill7
	; LineNumber: 88
	
; //  
	lda #$ff
	ldx #0
cls_fill8
	sta $82ee,x
	inx
	cpx #$20
	bne cls_fill8
	; LineNumber: 90
	
; // 
	; MoveTo optimization
	lda #$00
	sta screenmemory
	lda #>$8000
	clc
	adc #$00
	sta screenmemory+1
	; LineNumber: 91
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : getkey
	;    Procedure type : User-defined procedure
	; LineNumber: 96
getkey
	; LineNumber: 99
	; LineNumber: 100
	; Peek
	lda $97 + $0
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : waitkey
	;    Procedure type : User-defined procedure
	; LineNumber: 104
waitkey
	; LineNumber: 106
waitkey_while11
	; Binary clause Simplified: EQUALS
	jsr getkey
	; Compare with pure num / var optimization
	cmp #$ff;keep
	bne waitkey_elsedoneblock14
waitkey_ConditionalTrueBlock12: ;Main true block ;keep 
	; LineNumber: 107
	; LineNumber: 108
	; ****** Inline assembler section
NOP
	; LineNumber: 109
	jmp waitkey_while11
waitkey_elsedoneblock14
	; LineNumber: 111
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : textat
	;    Procedure type : User-defined procedure
	; LineNumber: 118
	; LineNumber: 116
zp	= $02
	; LineNumber: 117
this_key	dc.b	$ff
	; LineNumber: 114
x	dc.b	0
	; LineNumber: 114
y	dc.b	0
	; LineNumber: 114
this_str	= $04
	; LineNumber: 114
str_len	dc.b	0
textat_block17
textat
	; LineNumber: 119
	; Assigning single variable : zp
	; Generic 16 bit op
	ldy #0
	lda x
textat_rightvarInteger_var20 = $54
	sta textat_rightvarInteger_var20
	sty textat_rightvarInteger_var20+1
	; Generic 16 bit op
	; Integer constant assigning
	ldy #$80
	lda #$00
textat_rightvarInteger_var23 = $56
	sta textat_rightvarInteger_var23
	sty textat_rightvarInteger_var23+1
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
	adc textat_rightvarInteger_var23
textat_wordAdd21
	sta textat_rightvarInteger_var23
	; High-bit binop
	tya
	adc textat_rightvarInteger_var23+1
	tay
	lda textat_rightvarInteger_var23
	; Low bit binop:
	clc
	adc textat_rightvarInteger_var20
textat_wordAdd18
	sta textat_rightvarInteger_var20
	; High-bit binop
	tya
	adc textat_rightvarInteger_var20+1
	tay
	lda textat_rightvarInteger_var20
	sta zp
	sty zp+1
	; LineNumber: 120
	; memcpyfast
	ldy str_len
	dey
textat_memcpy24
	lda (this_str),y
	sta (zp),y
	dey
	bpl textat_memcpy24
	; LineNumber: 122
	rts
block1
	; LineNumber: 125
	; LineNumber: 128
	; Assigning single variable : screenmemory
	lda $00
	ldx $80
	sta screenmemory
	stx screenmemory+1
	; LineNumber: 129
	; Assigning single variable : screenmemory
	; Store Variable simplified optimization : right-hand term is pure
	ldy #$0 ; optimized, look out for bugs
	lda #$1
	sta (screenmemory),y
	; LineNumber: 131
	
; // place the A character at the top left of the display on the C64
	jsr cls
	; LineNumber: 146
	
; //	MemCpy(#petscii1, 0, screenmemory, 240 ); 
; //	screenmemory:=$8000+240;
; //	MemCpy(#petscii2, 0, screenmemory, 240 ); 
; //	screenmemory:=$8000+480;
; //	MemCpy(#petscii3, 0, screenmemory, 240 ); 
; //	screenmemory:=$8000+720;
; //	MemCpy(#petscii4, 0, screenmemory, 240 ); 
; //	screenmemory:=$8000+960;
; //	MemCpy(#petscii5, 0, screenmemory, 40 ); 
; //	screenmemory:=screen_char_loc;
; //				
; //
	; memcpy
	ldy #0
MainProgram_memcpy25
	lda crockr+ $00,y
	sta (screenmemory),y
	iny
	cpy #$9
	bne MainProgram_memcpy25
	; LineNumber: 148
	; Assigning single variable : screenmemory
	lda #$28
	ldx #$80
	sta screenmemory
	stx screenmemory+1
	; LineNumber: 148
	; memcpy
	ldy #0
MainProgram_memcpy26
	lda crockl+ $00,y
	sta (screenmemory),y
	iny
	cpy #$9
	bne MainProgram_memcpy26
	; LineNumber: 150
	; Assigning single variable : screenmemory
	lda #$3c
	ldx #$80
	sta screenmemory
	stx screenmemory+1
	; LineNumber: 150
	; memcpy
	ldy #0
MainProgram_memcpy27
	lda logl+ $00,y
	sta (screenmemory),y
	iny
	cpy #$5
	bne MainProgram_memcpy27
	; LineNumber: 152
	; Assigning single variable : screenmemory
	lda #$64
	ldx #$80
	sta screenmemory
	stx screenmemory+1
	; LineNumber: 152
	; memcpy
	ldy #0
MainProgram_memcpy28
	lda logr+ $00,y
	sta (screenmemory),y
	iny
	cpy #$5
	bne MainProgram_memcpy28
	; LineNumber: 154
	; Assigning single variable : screenmemory
	lda #$8c
	ldx #$80
	sta screenmemory
	stx screenmemory+1
	; LineNumber: 154
	; memcpy
	ldy #0
MainProgram_memcpy29
	lda truckt+ $00,y
	sta (screenmemory),y
	iny
	cpy #$8
	bne MainProgram_memcpy29
	; LineNumber: 156
	; Assigning single variable : screenmemory
	lda #$b4
	ldx #$80
	sta screenmemory
	stx screenmemory+1
	; LineNumber: 156
	; memcpy
	ldy #0
MainProgram_memcpy30
	lda truckb+ $00,y
	sta (screenmemory),y
	iny
	cpy #$8
	bne MainProgram_memcpy30
	; LineNumber: 159
MainProgram_while31
	; Binary clause Simplified: NOTEQUALS
	lda this_key
	; Compare with pure num / var optimization
	cmp #$20;keep
	beq MainProgram_elsedoneblock34
MainProgram_ConditionalTrueBlock32: ;Main true block ;keep 
	; LineNumber: 160
	; LineNumber: 161
	; Assigning single variable : this_key
	jsr getkey
	; Calling storevariable
	sta this_key
	; LineNumber: 162
	; MoveTo optimization
	lda #$54
	sta screenmemory
	lda #>$8000
	clc
	adc #$06
	sta screenmemory+1
	; LineNumber: 163
	ldx #0
	; Peek
	ldy $97 + $0 ; optimized, look out for bugs
	and #$F0
	lsr
	lsr 
	lsr 
	lsr 
	cmp #$0A
	bcc MainProgram_printnumber_l141
	sec
	sbc #$39
MainProgram_printnumber_l141
	adc #$30 + #64
	sta print_number_text,x
	inx
	tya
	and #$0F
	cmp #$0A
	bcc MainProgram_printnumber_l242
	sec
	sbc #$39
MainProgram_printnumber_l242
	adc #$30 + #64
	sta print_number_text,x
	inx
	lda #0
	sta print_number_text,x
	ldx #0
	lda #<print_number_text
	ldy #>print_number_text
	sta print_text+0
	sty print_text+1
	jsr printstring
	; LineNumber: 164
	jmp MainProgram_while31
MainProgram_elsedoneblock34
	; LineNumber: 166
	jsr waitkey
	; LineNumber: 167
MainProgram_printstring_call43
	clc
	lda #<MainProgram_printstring_text44
	adc #$0
	ldy #>MainProgram_printstring_text44
	sta print_text+0
	sty print_text+1
	ldx #$b ; optimized, look out for bugs
	jsr printstring
	; LineNumber: 170
	; Assigning single variable : screenmemory
	lda #$50
	ldx #$80
	sta screenmemory
	stx screenmemory+1
	; LineNumber: 171
	; Binary clause Simplified: EQUALS
	; Peek
	lda $c353 + $0
	; Compare with pure num / var optimization
	cmp #$a0;keep
	bne MainProgram_elsedoneblock48
MainProgram_ConditionalTrueBlock46: ;Main true block ;keep 
	; LineNumber: 172
	; LineNumber: 173
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
	; LineNumber: 174
MainProgram_elsedoneblock48
	; LineNumber: 176
	; Binary clause Simplified: EQUALS
	; Peek
	lda $c353 + $0
	; Compare with pure num / var optimization
	cmp #$7;keep
	bne MainProgram_elsedoneblock54
MainProgram_ConditionalTrueBlock52: ;Main true block ;keep 
	; LineNumber: 177
	; LineNumber: 178
	
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
	; LineNumber: 179
MainProgram_elsedoneblock54
	; LineNumber: 182
	
; //2.0 ROMS
	; Assigning single variable : screenmemory
	lda $00
	ldx $80
	sta screenmemory
	stx screenmemory+1
	; LineNumber: 184
MainProgram_while57
	; Binary clause Simplified: NOTEQUALS
	lda this_key
	; Compare with pure num / var optimization
	cmp #$20;keep
	beq MainProgram_elsedoneblock60
MainProgram_ConditionalTrueBlock58: ;Main true block ;keep 
	; LineNumber: 185
	; LineNumber: 186
	; Assigning single variable : this_key
	jsr getkey
	; Calling storevariable
	sta this_key
	; LineNumber: 187
	; MoveTo optimization
	lda #$54
	sta screenmemory
	lda #>$8000
	clc
	adc #$06
	sta screenmemory+1
	; LineNumber: 188
	ldx #0
	; Peek
	ldy $97 + $0 ; optimized, look out for bugs
	and #$F0
	lsr
	lsr 
	lsr 
	lsr 
	cmp #$0A
	bcc MainProgram_printnumber_l167
	sec
	sbc #$39
MainProgram_printnumber_l167
	adc #$30 + #64
	sta print_number_text,x
	inx
	tya
	and #$0F
	cmp #$0A
	bcc MainProgram_printnumber_l268
	sec
	sbc #$39
MainProgram_printnumber_l268
	adc #$30 + #64
	sta print_number_text,x
	inx
	lda #0
	sta print_number_text,x
	ldx #0
	lda #<print_number_text
	ldy #>print_number_text
	sta print_text+0
	sty print_text+1
	jsr printstring
	; LineNumber: 189
	jmp MainProgram_while57
MainProgram_elsedoneblock60
	; LineNumber: 191
	jsr cls
	; LineNumber: 192
	; Assigning single variable : x
	lda #$0
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$a
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<MainProgram_stringassignstr69
	sta this_str
	lda #>MainProgram_stringassignstr69
	sta this_str+1
	; Assigning single variable : str_len
	lda #$28
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 195
	ldx #0
	; Peek
	ldy $9e + $0 ; optimized, look out for bugs
	and #$F0
	lsr
	lsr 
	lsr 
	lsr 
	cmp #$0A
	bcc MainProgram_printnumber_l172
	sec
	sbc #$39
MainProgram_printnumber_l172
	adc #$30 + #64
	sta print_number_text,x
	inx
	tya
	and #$0F
	cmp #$0A
	bcc MainProgram_printnumber_l273
	sec
	sbc #$39
MainProgram_printnumber_l273
	adc #$30 + #64
	sta print_number_text,x
	inx
	lda #0
	sta print_number_text,x
	ldx #0
	lda #<print_number_text
	ldy #>print_number_text
	sta print_text+0
	sty print_text+1
	jsr printstring
	; LineNumber: 197
	jsr waitkey
	; LineNumber: 200
	jsr cls
	; LineNumber: 202
	; Assigning single variable : x
	lda #$5
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$10
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<MainProgram_stringassignstr74
	sta this_str
	lda #>MainProgram_stringassignstr74
	sta this_str+1
	; Assigning single variable : str_len
	lda #$3
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 203
	; Assigning single variable : x
	lda #$5
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$11
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<MainProgram_stringassignstr76
	sta this_str
	lda #>MainProgram_stringassignstr76
	sta this_str+1
	; Assigning single variable : str_len
	lda #$3
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 204
	; Assigning single variable : x
	lda #$5
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$12
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<MainProgram_stringassignstr78
	sta this_str
	lda #>MainProgram_stringassignstr78
	sta this_str+1
	; Assigning single variable : str_len
	lda #$3
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 205
	; Assigning single variable : x
	lda #$5
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$13
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<MainProgram_stringassignstr80
	sta this_str
	lda #>MainProgram_stringassignstr80
	sta this_str+1
	; Assigning single variable : str_len
	lda #$3
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 208
	; Assigning single variable : x
	lda #$b
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$d
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<MainProgram_stringassignstr82
	sta this_str
	lda #>MainProgram_stringassignstr82
	sta this_str+1
	; Assigning single variable : str_len
	lda #$3
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 209
	; Assigning single variable : x
	lda #$c
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$e
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<MainProgram_stringassignstr84
	sta this_str
	lda #>MainProgram_stringassignstr84
	sta this_str+1
	; Assigning single variable : str_len
	lda #$3
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 210
	; Assigning single variable : x
	lda #$a
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$c
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<cs
	ldx #>cs
	sta this_str
	stx this_str+1
	; Assigning single variable : str_len
	lda #$4
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 213
	; Assigning single variable : $8000
	; Store Variable is pure numeric and not pointer - store directly!
	lda #$fa
	sta $8000 + $1f5
	; LineNumber: 214
	; Assigning single variable : $8000
	; Store Variable is pure numeric and not pointer - store directly!
	sta $8000 + $1f6
	; LineNumber: 215
	; Assigning single variable : $8000
	; Store Variable is pure numeric and not pointer - store directly!
	sta $8000 + $1f7
	; LineNumber: 216
	; Assigning single variable : $8000
	; Store Variable is pure numeric and not pointer - store directly!
	sta $8000 + $21d
	; LineNumber: 217
	; Assigning single variable : $8000
	; Store Variable is pure numeric and not pointer - store directly!
	sta $8000 + $21e
	; LineNumber: 218
	; Assigning single variable : $8000
	; Store Variable is pure numeric and not pointer - store directly!
	sta $8000 + $21f
	; LineNumber: 219
	; Assigning single variable : $8000
	; Store Variable is pure numeric and not pointer - store directly!
	sta $8000 + $245
	; LineNumber: 220
	; Assigning single variable : $8000
	; Store Variable is pure numeric and not pointer - store directly!
	sta $8000 + $246
	; LineNumber: 221
	; Assigning single variable : $8000
	; Store Variable is pure numeric and not pointer - store directly!
	sta $8000 + $247
	; LineNumber: 230
	; Assigning single variable : i
	ldy #0
	lda #$0
	; Calling storevariable
	sta i
	sty i+1
MainProgram_forloop86
	; LineNumber: 226
	; LineNumber: 228
	
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
	; LineNumber: 229
MainProgram_forloopcounter88
	; Compare is onpage
	inc i
	bne MainProgram_lblCounterWord92
	inc i+1
MainProgram_lblCounterWord92
	; Executing integer comparison #$ff
	; Binary clause INTEGER: NOTEQUALS
	; Compare INTEGER with pure num / var optimization. GREATER. 
	lda i+1   ; compare high bytes
	cmp #$00 ;keep
	beq MainProgram_pass198
	jmp MainProgram_ConditionalTrueBlock94
MainProgram_pass198
	lda i
	cmp #$ff ;keep
	beq MainProgram_elsedoneblock96
	jmp MainProgram_ConditionalTrueBlock94
MainProgram_ConditionalTrueBlock94: ;Main true block ;keep 
	; LineNumber: 224
	; LineNumber: 225
	; ****** Inline assembler section
  jmp MainProgram_forloop86
MainProgram_elsedoneblock96
MainProgram_loopdone91: ;keep
MainProgram_forloopend87
	; LineNumber: 232
	jmp * ; loop like (�/%
	; LineNumber: 234
	; End of program
	; Ending memory block
EndBlock410
MainProgram_printstring_text44	dc.b	"PRESS SPACE"
	dc.b	0
MainProgram_stringassignstr69	.dc "0123456789012345678901234567890123456789",0
MainProgram_stringassignstr74	.dc "006",0
MainProgram_stringassignstr76	.dc "007",0
MainProgram_stringassignstr78	.dc "008",0
MainProgram_stringassignstr80	.dc "009",0
MainProgram_stringassignstr82	.dc "DEF",0
MainProgram_stringassignstr84	.dc "HIJ",0
