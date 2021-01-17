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
counterz
		jsr initsine_calculate
	; LineNumber: 7
	jmp block1
	; LineNumber: 4
x	dc.b	$00
	; LineNumber: 4
y	dc.b	$00
	; LineNumber: 4
time	dc.b	$00
	; LineNumber: 4
time2	dc.b	$00
	; LineNumber: 4
i	dc.b	$00
	; LineNumber: 5
ti = $8f
	; LineNumber: 6
oldti	dc.b	0
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
	; NodeProcedureDecl -1
	; ***********  Defining procedure : initsinetable
	;    Procedure type : Built-in function
	;    Requires initialization : no
sine .byte 0 
	org sine +#255
value .word 0
delta .word 0
initsine_calculate
	ldy #$3f
	ldx #$00
initsin_a
	lda value
	clc
	adc delta
	sta value
	lda value+1
	adc delta+1
	sta value+1
	sta sine+$c0,x
	sta sine+$80,y
	eor #$ff
	sta sine+$40,x
	sta sine+$00,y
	lda delta
	adc #$10   ; this value adds up to the proper amplitude
	sta delta
	bcc initsin_b
	inc delta+1
initsin_b
	inx
	dey
	bpl initsin_a
	rts
block1
	; LineNumber: 8
	; MoveTo optimization
	lda #$00
	sta screenmemory
	lda #>$8000
	clc
	adc #$00
	sta screenmemory+1
	; LineNumber: 10
	
; // infinite loop
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
	; LineNumber: 12
MainProgram_while4
	; Binary clause Simplified: NOTEQUALS
	lda #$1
	; Compare with pure num / var optimization
	cmp #$0;keep
	beq MainProgram_localfailed36
	jmp MainProgram_ConditionalTrueBlock5
MainProgram_localfailed36
	jmp MainProgram_elsedoneblock7
MainProgram_ConditionalTrueBlock5: ;Main true block ;keep 
	; LineNumber: 13
	; LineNumber: 15
	; Assigning single variable : time2
	inc time2
	; LineNumber: 17
MainProgram_while38
	; Binary clause Simplified: EQUALS
	lda ti
	; Compare with pure num / var optimization
	cmp oldti;keep
	bne MainProgram_elsedoneblock41
MainProgram_ConditionalTrueBlock39: ;Main true block ;keep 
	; LineNumber: 16
	; LineNumber: 17
	jmp MainProgram_while38
MainProgram_elsedoneblock41
	; LineNumber: 18
	; Assigning single variable : oldti
	lda ti
	; Calling storevariable
	sta oldti
	; LineNumber: 20
MainProgram_printstring_call44
	clc
	lda #<MainProgram_printstring_text45
	adc #$0
	ldy #>MainProgram_printstring_text45
	sta print_text+0
	sty print_text+1
	ldx #$28 ; optimized, look out for bugs
	jsr printstring
	; LineNumber: 23
	
; // Calculate x,y some sine values(making a circle)
; // if sine[x] then sine[x+64] is equal to cosine  
	; Assigning single variable : x
	; 8 bit binop
	; Add/sub where right value is constant number
	; Right is PURE NUMERIC : Is word =0
	; 8 bit div
	; Load Unknown type array
	ldx time
	lda sine,x
	sta div8x8_d
	; Load right hand side
	lda #$6
	sta div8x8_c
	jsr div8x8_procedure
	clc
	adc #$c
	 ; end add / sub var with constant
	; Calling storevariable
	sta x
	; LineNumber: 24
	; Assigning single variable : y
	; 8 bit binop
	; Add/sub where right value is constant number
	; Right is PURE NUMERIC : Is word =0
	; 8 bit mul of power 2
	; Load Unknown type array
	; 8 bit binop
	; Add/sub where right value is constant number
	lda time
	clc
	adc #$40
	 ; end add / sub var with constant
	tax
	lda sine,x
	lsr
	lsr
	lsr
	lsr
	clc
	adc #$4
	 ; end add / sub var with constant
	; Calling storevariable
	sta y
	; LineNumber: 26
	
; // move "screenmemory" cursor to x,y at screen memory $0400
	lda x
	sta screen_x
	lda y
	sta screen_y
	lda #>$8000
	jsr SetScreenPosition
	; LineNumber: 27
	; Assigning single variable : i
	; 8 bit binop
	; Add/sub where right value is constant number
	lda time
	lsr
	lsr
	lsr
	lsr
	lsr
	lsr
	and #$3
	 ; end add / sub var with constant
	; Calling storevariable
	sta i
	; LineNumber: 29
	cmp #$0 ;keep
	bne MainProgram_casenext49
	; LineNumber: 29
	
; // i will now have values between 0 and 3(since time is between 0 and 255)
; // Print some random string
MainProgram_printstring_call51
	clc
	lda #<MainProgram_printstring_text52
	adc #$0
	ldy #>MainProgram_printstring_text52
	sta print_text+0
	sty print_text+1
	ldx #$28 ; optimized, look out for bugs
	jsr printstring
	jmp MainProgram_caseend48
MainProgram_casenext49
	lda i
	cmp #$1 ;keep
	bne MainProgram_casenext53
	; LineNumber: 30
MainProgram_printstring_call55
	clc
	lda #<MainProgram_printstring_text56
	adc #$0
	ldy #>MainProgram_printstring_text56
	sta print_text+0
	sty print_text+1
	ldx #$28 ; optimized, look out for bugs
	jsr printstring
	jmp MainProgram_caseend48
MainProgram_casenext53
	lda i
	cmp #$2 ;keep
	bne MainProgram_casenext57
	; LineNumber: 31
MainProgram_printstring_call59
	clc
	lda #<MainProgram_printstring_text60
	adc #$0
	ldy #>MainProgram_printstring_text60
	sta print_text+0
	sty print_text+1
	ldx #$28 ; optimized, look out for bugs
	jsr printstring
	jmp MainProgram_caseend48
MainProgram_casenext57
	lda i
	cmp #$3 ;keep
	bne MainProgram_casenext61
	; LineNumber: 32
MainProgram_printstring_call63
	clc
	lda #<MainProgram_printstring_text64
	adc #$0
	ldy #>MainProgram_printstring_text64
	sta print_text+0
	sty print_text+1
	ldx #$28 ; optimized, look out for bugs
	jsr printstring
	jmp MainProgram_caseend48
MainProgram_casenext61
MainProgram_caseend48
	; LineNumber: 36
	
; // Increase the timer
	; Assigning single variable : time
	inc time
	; LineNumber: 38
	jmp MainProgram_while4
MainProgram_elsedoneblock7
	; LineNumber: 39
	; End of program
	; Ending memory block
EndBlock410
MainProgram_printstring_text45	dc.b	"                "
	dc.b	0
MainProgram_printstring_text52	dc.b	"I AM FISH"
	dc.b	0
MainProgram_printstring_text56	dc.b	"ARE YOU FISH"
	dc.b	0
MainProgram_printstring_text60	dc.b	"ME AM CAT"
	dc.b	0
MainProgram_printstring_text64	dc.b	"OM NOM NOM"
	dc.b	0
