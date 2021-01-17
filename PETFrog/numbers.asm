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
MyProgram
	; LineNumber: 5
	jmp block1
	; LineNumber: 4
num	dc.w	$7b
	; NodeProcedureDecl -1
	; ***********  Defining procedure : init16x8div
	;    Procedure type : Built-in function
	;    Requires initialization : no
initdiv16x8_divisor = $4c     ;$59 used for hi-byte
initdiv16x8_dividend = $4e	  ;$fc used for hi-byte
initdiv16x8_remainder = $50	  ;$fe used for hi-byte
initdiv16x8_result = $4e ;save memory by reusing divident to store the result
divide16x8	lda #0	        ;preset remainder to 0
	sta initdiv16x8_remainder
	sta initdiv16x8_remainder+1
	ldx #16	        ;repeat for each bit: ...
divloop16	asl initdiv16x8_dividend	;dividend lb & hb*2, msb -> Carry
	rol initdiv16x8_dividend+1
	rol initdiv16x8_remainder	;remainder lb & hb * 2 + msb from carry
	rol initdiv16x8_remainder+1
	lda initdiv16x8_remainder
	sec
	sbc initdiv16x8_divisor	;substract divisor to see if it fits in
	tay	        ;lb result -> Y, for we may need it later
	lda initdiv16x8_remainder+1
	sbc initdiv16x8_divisor+1
	bcc skip16	;if carry=0 then divisor didn't fit in yet
	sta initdiv16x8_remainder+1	;else save substraction result as new remainder,
	sty initdiv16x8_remainder
	inc initdiv16x8_result	;and INCrement result cause divisor fit in 1 times
skip16	dex
	bne divloop16
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : init8x8div
	;    Procedure type : Built-in function
	;    Requires initialization : no
div8x8_c = $4c
div8x8_d = $4e
div8x8_e = $50
	; Normal 8x8 bin div
div8x8_procedure
	lda #$00
	ldx #$07
	clc
div8x8_loop1 rol div8x8_d
	rol
	cmp div8x8_c
	bcc div8x8_loop2
	sbc div8x8_c
div8x8_loop2 dex
	bpl div8x8_loop1
	rol div8x8_d
	lda div8x8_d
div8x8_def_end
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : initmoveto
	;    Procedure type : Built-in function
	;    Requires initialization : no
	jmp initmoveto_moveto2
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
initmoveto_moveto2
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
block1
	; LineNumber: 6
	; LineNumber: 8
	; Clear screen with offset
	lda #$20
	ldx #$fa
MainProgram_clearloop3
	dex
	sta $0000+$8000,x
	sta $00fa+$8000,x
	sta $01f4+$8000,x
	sta $02ee+$8000,x
	sta $03e8+$8000,x
	sta $04e2+$8000,x
	sta $05dc+$8000,x
	sta $06d6+$8000,x
	bne MainProgram_clearloop3
	; LineNumber: 10
	; Assigning memory location
	; Assigning single variable : $8000
	; Integer constant assigning
	lda #$00
	; Calling storevariable
	sta $8000
	; LineNumber: 11
	; Assigning single variable : screenmemory
	ldx #$80
	sta screenmemory
	stx screenmemory+1
	; LineNumber: 13
	; MoveTo optimization
	sta screenmemory
	lda #>$8000
	clc
	adc #$00
	sta screenmemory+1
	; LineNumber: 14
	ldx #0
	; Right is PURE NUMERIC : Is word =1
	; 16x8 div
	; integer assignment NodeVar
	ldy num+1 ; Next one
	lda num
	sta initdiv16x8_dividend
	sty initdiv16x8_dividend+1
	ldy #0
	lda #$64
	sta initdiv16x8_divisor
	sty initdiv16x8_divisor+1
	jsr divide16x8
	ldy initdiv16x8_dividend ; optimized, look out for bugs
	and #$F0
	lsr
	lsr 
	lsr 
	lsr 
	cmp #$0A
	bcc MainProgram_printnumber_l15
	sec
	sbc #$39
MainProgram_printnumber_l15
	adc #$30 + #64
	sta print_number_text,x
	inx
	tya
	and #$0F
	cmp #$0A
	bcc MainProgram_printnumber_l26
	sec
	sbc #$39
MainProgram_printnumber_l26
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
	; LineNumber: 16
	; MoveTo optimization
	lda #$a0
	sta screenmemory
	lda #>$8000
	clc
	adc #$00
	sta screenmemory+1
	; LineNumber: 17
	ldx #0
	; Modulo
	lda #$a
MainProgram_val_var10 = $54
	sta MainProgram_val_var10
	; Right is PURE NUMERIC : Is word =1
	; 16x8 div
	; integer assignment NodeVar
	ldy num+1 ; Next one
	lda num
	sta initdiv16x8_dividend
	sty initdiv16x8_dividend+1
	ldy #0
	lda #$a
	sta initdiv16x8_divisor
	sty initdiv16x8_divisor+1
	jsr divide16x8
	lda initdiv16x8_dividend
	ldy initdiv16x8_dividend+1
	sec
MainProgram_modulo11
	sbc MainProgram_val_var10
	bcs MainProgram_modulo11
	adc MainProgram_val_var10
	tay
	and #$F0
	lsr
	lsr 
	lsr 
	lsr 
	cmp #$0A
	bcc MainProgram_printnumber_l18
	sec
	sbc #$39
MainProgram_printnumber_l18
	adc #$30 + #64
	sta print_number_text,x
	inx
	tya
	and #$0F
	cmp #$0A
	bcc MainProgram_printnumber_l29
	sec
	sbc #$39
MainProgram_printnumber_l29
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
	; LineNumber: 19
	; MoveTo optimization
	lda #$40
	sta screenmemory
	lda #>$8000
	clc
	adc #$01
	sta screenmemory+1
	; LineNumber: 20
	ldx #0
	; Modulo
	lda #$a
MainProgram_val_var15 = $54
	sta MainProgram_val_var15
	; integer assignment NodeVar
	ldy num+1 ; Next one
	lda num
	sec
MainProgram_modulo16
	sbc MainProgram_val_var15
	bcs MainProgram_modulo16
	adc MainProgram_val_var15
	tay
	and #$F0
	lsr
	lsr 
	lsr 
	lsr 
	cmp #$0A
	bcc MainProgram_printnumber_l113
	sec
	sbc #$39
MainProgram_printnumber_l113
	adc #$30 + #64
	sta print_number_text,x
	inx
	tya
	and #$0F
	cmp #$0A
	bcc MainProgram_printnumber_l214
	sec
	sbc #$39
MainProgram_printnumber_l214
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
	; LineNumber: 23
	; End of program
	; Ending memory block
EndBlock410
