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
PET_sounds
	; LineNumber: 45
	jmp block1
	
; //i : byte;
; //Note	Frequency
; //   octave=15	    octave=51	    octave=85
; //   Oct.0	Oct.1	Oct.1	Oct.2	Oct.2	Oct.3
; //B	251	    125	    251	    125	    251	    125
; //C	238	    118		238		118		238		118
; //C#	224	    110		224		110		224		110
; //D	210		104		210		104		210		104
; //D#	199		99		199		99		199		99
; //E	188		93		188		93		188		93
; //F	177		88		177		88		177		88
; //F#	168		83		168		83		168		83
; //G	158		78		158		78		158		78
; //G#	149		74		149		74		149		74
; //A	140		69		140		69		140		69
; //A#	133		65		133		65		133		65
; //
	; NodeProcedureDecl -1
	; ***********  Defining procedure : PlayNote
	;    Procedure type : User-defined procedure
	; LineNumber: 30
	; LineNumber: 29
note_duration	dc.b	0
	; LineNumber: 27
note	dc.b	0
PlayNote_block2
PlayNote
	; LineNumber: 31
	; Assigning memory location
	; Assigning single variable : $e848
	lda note
	; Calling storevariable
	sta $e848
	; LineNumber: 33
	; Assigning single variable : note_duration
	lda #$0
	; Calling storevariable
	sta note_duration
PlayNote_forloop3
	; LineNumber: 31
	; Wait
	ldx #$c8 ; optimized, look out for bugs
	dex
	bne *-1
PlayNote_forloopcounter5
	; Compare is onpage
	inc note_duration
	lda #$c8
	cmp note_duration ;keep
	bne PlayNote_forloop3
PlayNote_loopdone8: ;keep
PlayNote_forloopend4
	; LineNumber: 33
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : Burp
	;    Procedure type : User-defined procedure
	; LineNumber: 38
Burp
	; LineNumber: 39
	; Assigning memory location
	; Assigning single variable : $e84a
	lda #$f
	; Calling storevariable
	sta $e84a
	; LineNumber: 40
	; Assigning memory location
	; Assigning single variable : $e84b
	lda #$10
	; Calling storevariable
	sta $e84b
	; LineNumber: 41
	; Assigning single variable : note
	lda #$ee
	; Calling storevariable
	sta note
	jsr PlayNote
	; LineNumber: 42
	; Assigning memory location
	; Assigning single variable : $e84b
	lda #$0
	; Calling storevariable
	sta $e84b
	; LineNumber: 43
	rts
block1
	; LineNumber: 96
	; point to start of random table
; //	SOUND := SOUND_ON;
; //	while(1) do
; //	begin
; //		SOUND_OCTAVE := 51;
; //		PlayNote(238);
; //		PlayNote(188);
; //		PlayNote(158);
; //		PlayNote(188);
; //		SOUND_OCTAVE := 15;
; //		PlayNote(238);
; //		PlayNote(188);
; //		PlayNote(158);
; //		PlayNote(188);
; //		SOUND_OCTAVE := 51;
; //		PlayNote(210);
; //		PlayNote(177);
; //		PlayNote(140);
; //		PlayNote(177);
; //		SOUND_OCTAVE := 15;
; //		PlayNote(210);
; //		PlayNote(177);
; //		PlayNote(140);
; //		PlayNote(177);
; //		SOUND_OCTAVE := 51;
; //		PlayNote(210);
; //		PlayNote(210);
; //		PlayNote(177);
; //		PlayNote(140);
; //		SOUND_OCTAVE := 15;
; //		PlayNote(210);
; //		PlayNote(210);
; //		PlayNote(177);
; //		PlayNote(140);
; //		SOUND_OCTAVE := 51;
; //		PlayNote(238);
; //		PlayNote(188);
; //		PlayNote(158);
; //		PlayNote(188);
; //		SOUND_OCTAVE := 15;
; //		PlayNote(238);
; //		PlayNote(188);
; //		PlayNote(158);
; //		PlayNote(188);
; //	end;	
; //	
; //cls();
; //	loop();
; //
	jsr Burp
	; LineNumber: 97
	; End of program
	; Ending memory block
EndBlock410
