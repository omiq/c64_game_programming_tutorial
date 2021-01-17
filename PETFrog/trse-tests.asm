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
	; LineNumber: 176
	jmp block1
	; LineNumber: 4
i	dc.w	$00
	; LineNumber: 15
KEYPRESS	dc.b	$ff
	; LineNumber: 34
frog_x	dc.b	$14
	; LineNumber: 34
frog_old_x	dc.b	$14
	; LineNumber: 35
frog_y	dc.b	$19
	; LineNumber: 35
frog_old_y	dc.b	$19
	; LineNumber: 36
previous_tile	dc.b	$20
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
	; ***********  Defining procedure : initprintdecimal
	;    Procedure type : Built-in function
	;    Requires initialization : no
ipd_div_hi dc.b 0
ipd_div_lo dc.b 0
init_printdecimal_div10
	ldx #$11
	lda #$00
	clc
init_printdecimal_loop
	rol
	cmp #$0A
	bcc init_printdecimal_skip
	sbc #$0A
init_printdecimal_skip
	rol ipd_div_lo
	rol ipd_div_hi
	dex
	bne init_printdecimal_loop
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
	
; //1   2   3   4   5   6   7   8   9   0   1   2   3   4   5   6   7   8   9   20  1   2   3   4   5   6   7   8   9   30  1   2   3   4   5   6   7   8   9   40   
; // =============================================================================================== 
	; NodeProcedureDecl -1
	; ***********  Defining procedure : cls
	;    Procedure type : User-defined procedure
	; LineNumber: 117
cls
	; LineNumber: 118
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
	; LineNumber: 119
	; MoveTo optimization
	lda #$00
	sta screenmemory
	lda #>$8000
	clc
	adc #$00
	sta screenmemory+1
	; LineNumber: 120
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : getkey
	;    Procedure type : User-defined procedure
	; LineNumber: 124
getkey
	; LineNumber: 127
	; LineNumber: 128
	; Peek
	lda $97 + $0
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : textat
	;    Procedure type : User-defined procedure
	; LineNumber: 134
	; LineNumber: 132
zp	= $02
	; LineNumber: 130
x	dc.b	0
	; LineNumber: 130
y	dc.b	0
	; LineNumber: 130
this_str	= $04
	; LineNumber: 130
str_len	dc.b	0
textat_block7
textat
	; LineNumber: 135
	; Assigning single variable : zp
	; Generic 16 bit op
	ldy #0
	lda x
textat_rightvarInteger_var10 = $54
	sta textat_rightvarInteger_var10
	sty textat_rightvarInteger_var10+1
	; Generic 16 bit op
	; Integer constant assigning
	ldy #$80
	lda #$00
textat_rightvarInteger_var13 = $56
	sta textat_rightvarInteger_var13
	sty textat_rightvarInteger_var13+1
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
	adc textat_rightvarInteger_var13
textat_wordAdd11
	sta textat_rightvarInteger_var13
	; High-bit binop
	tya
	adc textat_rightvarInteger_var13+1
	tay
	lda textat_rightvarInteger_var13
	; Low bit binop:
	clc
	adc textat_rightvarInteger_var10
textat_wordAdd8
	sta textat_rightvarInteger_var10
	; High-bit binop
	tya
	adc textat_rightvarInteger_var10+1
	tay
	lda textat_rightvarInteger_var10
	sta zp
	sty zp+1
	; LineNumber: 135
	; memcpyfast
	ldy str_len
	dey
textat_memcpy14
	lda (this_str),y
	sta (zp),y
	dey
	bpl textat_memcpy14
	; LineNumber: 137
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : shit_delay
	;    Procedure type : User-defined procedure
	; LineNumber: 140
shit_delay
	; LineNumber: 141
	; Wait
	lda #$ff
	ldy #$ff
	tax
	dex
	bne *-1
	; LineNumber: 142
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 143
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 144
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 145
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 146
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 147
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 148
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 148
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 150
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 151
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 152
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 153
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 154
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 155
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 156
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 156
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 158
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 159
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 160
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 161
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 162
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 163
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 164
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 165
	; Wait
	ldx #$ff ; optimized, look out for bugs
	dex
	bne *-1
	; LineNumber: 166
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : getat
	;    Procedure type : User-defined procedure
	; LineNumber: 171
	; LineNumber: 169
szp	= $02
	; LineNumber: 167
sx	dc.b	0
	; LineNumber: 167
sy	dc.b	0
getat_block16
getat
	; LineNumber: 172
	; Assigning single variable : szp
	; Generic 16 bit op
	ldy #0
	lda sx
getat_rightvarInteger_var19 = $54
	sta getat_rightvarInteger_var19
	sty getat_rightvarInteger_var19+1
	; Generic 16 bit op
	; Integer constant assigning
	ldy #$80
	lda #$00
getat_rightvarInteger_var22 = $56
	sta getat_rightvarInteger_var22
	sty getat_rightvarInteger_var22+1
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
	adc getat_rightvarInteger_var22
getat_wordAdd20
	sta getat_rightvarInteger_var22
	; High-bit binop
	tya
	adc getat_rightvarInteger_var22+1
	tay
	lda getat_rightvarInteger_var22
	; Low bit binop:
	clc
	adc getat_rightvarInteger_var19
getat_wordAdd17
	sta getat_rightvarInteger_var19
	; High-bit binop
	tya
	adc getat_rightvarInteger_var19+1
	tay
	lda getat_rightvarInteger_var19
	sta szp
	sty szp+1
	; LineNumber: 173
	; LineNumber: 174
	; Load pointer array
	ldy #$0
	lda (szp),y
	rts
block1
	; LineNumber: 176
	; LineNumber: 180
	; Assigning memory location
	; Assigning single variable : $8000
	; Integer constant assigning
	ldy #$80
	lda #$00
	; Calling storevariable
	sta $8000
	; LineNumber: 181
	; Assigning single variable : screenmemory
	ldx #$80
	sta screenmemory
	stx screenmemory+1
	; LineNumber: 182
	jsr cls
	; LineNumber: 191
	; Assigning single variable : i
	ldy #0
	lda #$0
	; Calling storevariable
	sta i
	sty i+1
MainProgram_forloop23
	; LineNumber: 187
	; LineNumber: 189
	
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
	; LineNumber: 190
MainProgram_forloopcounter25
	; Compare is onpage
	inc i
	bne MainProgram_lblCounterWord29
	inc i+1
MainProgram_lblCounterWord29
	; Executing integer comparison #$ff
	; Binary clause INTEGER: NOTEQUALS
	; Compare INTEGER with pure num / var optimization. GREATER. 
	lda i+1   ; compare high bytes
	cmp #$00 ;keep
	beq MainProgram_pass135
	jmp MainProgram_ConditionalTrueBlock31
MainProgram_pass135
	lda i
	cmp #$ff ;keep
	beq MainProgram_elsedoneblock33
	jmp MainProgram_ConditionalTrueBlock31
MainProgram_ConditionalTrueBlock31: ;Main true block ;keep 
	; LineNumber: 185
	; LineNumber: 186
	; ****** Inline assembler section
  jmp MainProgram_forloop23
MainProgram_elsedoneblock33
MainProgram_loopdone28: ;keep
MainProgram_forloopend24
	; LineNumber: 193
	; MoveTo optimization
	lda #$42
	sta screenmemory
	lda #>$8000
	clc
	adc #$06
	sta screenmemory+1
	; LineNumber: 194
	; Binary clause Simplified: EQUALS
	; Peek
	lda $c353 + $0
	; Compare with pure num / var optimization
	cmp #$a0;keep
	bne MainProgram_localfailed49
	jmp MainProgram_ConditionalTrueBlock38
MainProgram_localfailed49
	jmp MainProgram_elseblock39
MainProgram_ConditionalTrueBlock38: ;Main true block ;keep 
	; LineNumber: 195
	; LineNumber: 196
	ldx #0
	ldy #$4 ; optimized, look out for bugs
	and #$F0
	lsr
	lsr 
	lsr 
	lsr 
	cmp #$0A
	bcc MainProgram_printnumber_l152
	sec
	sbc #$39
MainProgram_printnumber_l152
	adc #$30 + #64
	sta print_number_text,x
	inx
	tya
	and #$0F
	cmp #$0A
	bcc MainProgram_printnumber_l253
	sec
	sbc #$39
MainProgram_printnumber_l253
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
	jmp MainProgram_elsedoneblock40
MainProgram_elseblock39
	; LineNumber: 199
	; LineNumber: 200
	
; //4.0 ROMS
	ldx #0
	ldy #$2 ; optimized, look out for bugs
	and #$F0
	lsr
	lsr 
	lsr 
	lsr 
	cmp #$0A
	bcc MainProgram_printnumber_l156
	sec
	sbc #$39
MainProgram_printnumber_l156
	adc #$30 + #64
	sta print_number_text,x
	inx
	tya
	and #$0F
	cmp #$0A
	bcc MainProgram_printnumber_l257
	sec
	sbc #$39
MainProgram_printnumber_l257
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
	; LineNumber: 201
MainProgram_elsedoneblock40
	; LineNumber: 204
MainProgram_while58
	; Binary clause Simplified: NOTEQUALS
	lda #$1
	; Compare with pure num / var optimization
	cmp #$0;keep
	beq MainProgram_localfailed156
	jmp MainProgram_ConditionalTrueBlock59
MainProgram_localfailed156
	jmp MainProgram_elsedoneblock61
MainProgram_ConditionalTrueBlock59: ;Main true block ;keep 
	; LineNumber: 205
	; LineNumber: 206
	
; //2.0 ROMS
	; Assigning single variable : frog_old_x
	lda frog_x
	; Calling storevariable
	sta frog_old_x
	; LineNumber: 207
	; Assigning single variable : frog_old_y
	lda frog_y
	; Calling storevariable
	sta frog_old_y
	; LineNumber: 208
	; Assigning single variable : KEYPRESS
	jsr getkey
	; Calling storevariable
	sta KEYPRESS
	; LineNumber: 209
	; MoveTo optimization
	lda #$80
	sta screenmemory
	lda #>$8000
	clc
	adc #$07
	sta screenmemory+1
	; LineNumber: 210
	ldy #0
	lda KEYPRESS
	sta ipd_div_lo
	sty ipd_div_hi
	ldy #$2 ; optimized, look out for bugs
MainProgram_printdecimal158
	jsr init_printdecimal_div10 
	ora #$30
	sta (screenmemory),y
	dey
	bpl MainProgram_printdecimal158
	; LineNumber: 212
	; Binary clause Simplified: EQUALS
	lda KEYPRESS
	; Compare with pure num / var optimization
	cmp #$b8;keep
	bne MainProgram_elsedoneblock162
MainProgram_ConditionalTrueBlock160: ;Main true block ;keep 
	; LineNumber: 213
	; LineNumber: 214
	; Binary clause Simplified: GREATEREQUAL
	lda frog_y
	; Compare with pure num / var optimization
	cmp #$1;keep
	bcc MainProgram_elsedoneblock176
MainProgram_ConditionalTrueBlock174: ;Main true block ;keep 
	; LineNumber: 215
	; LineNumber: 216
	dec frog_y
	; LineNumber: 217
MainProgram_elsedoneblock176
	; LineNumber: 218
MainProgram_elsedoneblock162
	; LineNumber: 220
	; Binary clause Simplified: EQUALS
	lda KEYPRESS
	; Compare with pure num / var optimization
	cmp #$b6;keep
	bne MainProgram_elsedoneblock184
MainProgram_ConditionalTrueBlock182: ;Main true block ;keep 
	; LineNumber: 221
	; LineNumber: 222
	; Binary clause Simplified: LESS
	lda frog_x
	; Compare with pure num / var optimization
	cmp #$27;keep
	bcs MainProgram_elsedoneblock198
MainProgram_ConditionalTrueBlock196: ;Main true block ;keep 
	; LineNumber: 223
	; LineNumber: 224
	inc frog_x
	; LineNumber: 225
MainProgram_elsedoneblock198
	; LineNumber: 226
MainProgram_elsedoneblock184
	; LineNumber: 228
	; Binary clause Simplified: EQUALS
	lda KEYPRESS
	; Compare with pure num / var optimization
	cmp #$b2;keep
	bne MainProgram_localfailed216
	jmp MainProgram_ConditionalTrueBlock204
MainProgram_localfailed216: ;keep
	; ; logical OR, second chance
	; Binary clause Simplified: EQUALS
	lda KEYPRESS
	; Compare with pure num / var optimization
	cmp #$b5;keep
	bne MainProgram_elsedoneblock206
MainProgram_ConditionalTrueBlock204: ;Main true block ;keep 
	; LineNumber: 229
	; LineNumber: 230
	; Binary clause Simplified: LESS
	lda frog_y
	; Compare with pure num / var optimization
	cmp #$18;keep
	bcs MainProgram_elsedoneblock221
MainProgram_ConditionalTrueBlock219: ;Main true block ;keep 
	; LineNumber: 231
	; LineNumber: 232
	inc frog_y
	; LineNumber: 233
MainProgram_elsedoneblock221
	; LineNumber: 234
MainProgram_elsedoneblock206
	; LineNumber: 236
	; Binary clause Simplified: EQUALS
	lda KEYPRESS
	; Compare with pure num / var optimization
	cmp #$b4;keep
	bne MainProgram_elsedoneblock229
MainProgram_ConditionalTrueBlock227: ;Main true block ;keep 
	; LineNumber: 237
	; LineNumber: 238
	; Binary clause Simplified: GREATEREQUAL
	lda frog_x
	; Compare with pure num / var optimization
	cmp #$1;keep
	bcc MainProgram_elsedoneblock243
MainProgram_ConditionalTrueBlock241: ;Main true block ;keep 
	; LineNumber: 239
	; LineNumber: 240
	dec frog_x
	; LineNumber: 241
MainProgram_elsedoneblock243
	; LineNumber: 242
MainProgram_elsedoneblock229
	; LineNumber: 244
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
	; LineNumber: 245
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
	; LineNumber: 247
	; Assigning single variable : x
	lda frog_x
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda frog_y
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<MainProgram_stringassignstr248
	sta this_str
	lda #>MainProgram_stringassignstr248
	sta this_str+1
	; Assigning single variable : str_len
	lda #$1
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 249
	; Assigning single variable : x
	lda #$a
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$f
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
	; LineNumber: 250
	; MoveTo optimization
	lda #$be
	sta screenmemory
	lda #>$8000
	clc
	adc #$04
	sta screenmemory+1
	; LineNumber: 251
	ldy #0
	lda previous_tile
	sta ipd_div_lo
	sty ipd_div_hi
	ldy #$3 ; optimized, look out for bugs
MainProgram_printdecimal250
	jsr init_printdecimal_div10 
	ora #$30
	sta (screenmemory),y
	dey
	bpl MainProgram_printdecimal250
	; LineNumber: 253
	jsr shit_delay
	jmp MainProgram_while58
MainProgram_elsedoneblock61
	; LineNumber: 276
	; End of program
	; Ending memory block
EndBlock410
MainProgram_stringassignstr248	.dc "X",0
