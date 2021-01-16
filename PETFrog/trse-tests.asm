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
	; LineNumber: 26
petscii_pointer	= $02
	; LineNumber: 78
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
	
; //  1    2   3  4   5   6   7   8   9  10  11  12  13
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
cls_clearloop4
	dex
	sta $0000+$8000,x
	sta $00fa+$8000,x
	sta $01f4+$8000,x
	sta $02ee+$8000,x
	sta $03e8+$8000,x
	sta $04e2+$8000,x
	sta $05dc+$8000,x
	sta $06d6+$8000,x
	bne cls_clearloop4
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
block1
	; LineNumber: 125
	; LineNumber: 129
	; Assigning memory location
	; Assigning single variable : $8000
	; Integer constant assigning
	ldy #$80
	lda #$00
	; Calling storevariable
	sta $8000
	; LineNumber: 130
	; Assigning single variable : screenmemory
	ldx #$80
	sta screenmemory
	stx screenmemory+1
	; LineNumber: 131
	jsr cls
	; LineNumber: 140
	; Assigning single variable : i
	ldy #0
	lda #$0
	; Calling storevariable
	sta i
	sty i+1
MainProgram_forloop5
	; LineNumber: 136
	; LineNumber: 138
	
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
	; LineNumber: 139
MainProgram_forloopcounter7
	; Compare is onpage
	inc i
	bne MainProgram_lblCounterWord11
	inc i+1
MainProgram_lblCounterWord11
	; Executing integer comparison #$ff
	; Binary clause INTEGER: NOTEQUALS
	; Compare INTEGER with pure num / var optimization. GREATER. 
	lda i+1   ; compare high bytes
	cmp #$00 ;keep
	beq MainProgram_pass117
	jmp MainProgram_ConditionalTrueBlock13
MainProgram_pass117
	lda i
	cmp #$ff ;keep
	beq MainProgram_elsedoneblock15
	jmp MainProgram_ConditionalTrueBlock13
MainProgram_ConditionalTrueBlock13: ;Main true block ;keep 
	; LineNumber: 134
	; LineNumber: 135
	; ****** Inline assembler section
  jmp MainProgram_forloop5
MainProgram_elsedoneblock15
MainProgram_loopdone10: ;keep
MainProgram_forloopend6
	; LineNumber: 142
	; MoveTo optimization
	lda #$42
	sta screenmemory
	lda #>$8000
	clc
	adc #$06
	sta screenmemory+1
	; LineNumber: 143
	; Binary clause Simplified: EQUALS
	; Peek
	lda $c353 + $0
	; Compare with pure num / var optimization
	cmp #$a0;keep
	bne MainProgram_localfailed31
	jmp MainProgram_ConditionalTrueBlock20
MainProgram_localfailed31
	jmp MainProgram_elseblock21
MainProgram_ConditionalTrueBlock20: ;Main true block ;keep 
	; LineNumber: 144
	; LineNumber: 145
	ldx #0
	ldy #$4 ; optimized, look out for bugs
	and #$F0
	lsr
	lsr 
	lsr 
	lsr 
	cmp #$0A
	bcc MainProgram_printnumber_l134
	sec
	sbc #$39
MainProgram_printnumber_l134
	adc #$30 + #64
	sta print_number_text,x
	inx
	tya
	and #$0F
	cmp #$0A
	bcc MainProgram_printnumber_l235
	sec
	sbc #$39
MainProgram_printnumber_l235
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
	; LineNumber: 146
	jmp MainProgram_elsedoneblock22
MainProgram_elseblock21
	; LineNumber: 148
	; LineNumber: 149
	
; //4.0 ROMS
	ldx #0
	ldy #$2 ; optimized, look out for bugs
	and #$F0
	lsr
	lsr 
	lsr 
	lsr 
	cmp #$0A
	bcc MainProgram_printnumber_l138
	sec
	sbc #$39
MainProgram_printnumber_l138
	adc #$30 + #64
	sta print_number_text,x
	inx
	tya
	and #$0F
	cmp #$0A
	bcc MainProgram_printnumber_l239
	sec
	sbc #$39
MainProgram_printnumber_l239
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
	; LineNumber: 150
MainProgram_elsedoneblock22
	; LineNumber: 168
	
; //2.0 ROMS
; //	
; // THIS WORKS
; //	screenmemory := $8000;
; //	MemCpy(#petscii, 0, #screenmemory, 250 ); 
; //	screenmemory := $8000+250;
; //	MemCpy(#petscii, 250, #screenmemory, 250 ); 
; //	screenmemory := $8000+500;
; //	MemCpy(#petscii, 500, #screenmemory, 250 );
; //	screenmemory := $8000+750; 
; //	MemCpy(#petscii, 750, #screenmemory, 250 ); 
; //
; // THIS DOESN'T WORK
	; Assigning single variable : petscii_pointer
	lda #<petscii
	ldx #>petscii
	sta petscii_pointer
	stx petscii_pointer+1
	; LineNumber: 169
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
MainProgram_outer40
	ldy #0
MainProgram_inner41
	lda ($4c),y
	sta ($4e),y
	dey
	bne MainProgram_inner41
	inc $4c+1
	inc $4e+1
	dex
	bne MainProgram_outer40
	ldy #0
MainProgram_final42
	lda ($4c),y
	sta ($4e),y
	iny
	cpy #232
	bne MainProgram_final42
	; LineNumber: 171
	; Assigning single variable : screenmemory
	lda #$00
	ldx #$80
	sta screenmemory
	stx screenmemory+1
	; LineNumber: 172
	jmp * ; loop like (�/%
	; LineNumber: 175
	; End of program
	; Ending memory block
EndBlock410
