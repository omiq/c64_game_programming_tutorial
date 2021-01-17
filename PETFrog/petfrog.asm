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
PETFrog
	; LineNumber: 699
	jmp block1
	; LineNumber: 7
oldti = $8f
	; LineNumber: 7
ti = $90
	; LineNumber: 21
KEYPRESS	dc.b	$ff
	; LineNumber: 23
blk	
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	$20, 0
	; LineNumber: 24
by	
	dc.b	$20, $02, $19, $20, $03, $08, $12, $09, $13
	dc.b	$20, $07, $01, $12, $12, $05, $14, $14, $20
	dc.b	$30, $31, $2f, $32, $30, $32, $31, $20, $20
	dc.b	$20, 0
	; LineNumber: 25
url	
	dc.b	$20, $00, $0d, $01, $0b, $05, $12, $08, $01
	dc.b	$03, $0b, $13, $20, $0d, $01, $0b, $05, $12
	dc.b	$08, $01, $03, $0b, $13, $2e, $03, $0f, $0d
	dc.b	$20, 0
	; LineNumber: 26
over	
	dc.b	$20, $07, $01, $0d, $05, $20, $0f, $16, $05
	dc.b	$12, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	$20, 0
	; LineNumber: 27
score	
	dc.b	$20, $19, $0f, $15, $20, $13, $03, $0f, $12
	dc.b	$05, $04, $3a, $20, $20, $20, $20, $20, $20
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	$20, 0
	; LineNumber: 28
space	
	dc.b	$20, $10, $12, $05, $13, $13, $20, $13, $10
	dc.b	$01, $03, $05, $20, $14, $0f, $20, $03, $0f
	dc.b	$0e, $14, $09, $0e, $15, $05, $20, $20, $20
	dc.b	$20, 0
	; LineNumber: 30
ALIVE	dc.b	$01
	; LineNumber: 31
WON_GAME	dc.b	$00
	; LineNumber: 46
frogcharA	dc.b	$d6
	; LineNumber: 47
frogcharB	dc.b	$56
	; LineNumber: 48
frog_x	dc.b	$14
	; LineNumber: 48
frog_old_x	dc.b	$14
	; LineNumber: 49
frog_y	dc.b	$18
	; LineNumber: 49
frog_old_y	dc.b	$18
	; LineNumber: 50
previous_tile	dc.b	$20
	; LineNumber: 51
player_lives	dc.b	$00
	; LineNumber: 52
player_score	dc.w	$00
	; LineNumber: 54
arr_crockr	dc.b $0c0, $0a2, $0dc, $0dc, $0dc, $0dc, $0dc, $062
	dc.b $079
	; LineNumber: 55
str_crockr	
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	0 
	; LineNumber: 57
arr_crockl	dc.b $079, $062, $0dc, $0dc, $0dc, $0dc, $0dc, $0a2
	dc.b $0c0
	; LineNumber: 58
str_crockl	
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	0 
	; LineNumber: 60
arr_logl	dc.b $0a8, $0a8, $0a8, $0a8, $0d1
	; LineNumber: 61
str_logl	
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	0 
	; LineNumber: 63
arr_logr	dc.b $0d1, $0a9, $0a9, $0a9, $0a9
	; LineNumber: 64
str_logr	
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	0 
	; LineNumber: 66
arr_carl	dc.b $0f0, $0cf, $0d0, $0e0
	; LineNumber: 67
str_cart	
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	0 
	; LineNumber: 68
arr_carr	dc.b $0ed, $0d7, $0d7, $0a0
	; LineNumber: 69
str_carb	
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	0 
	; LineNumber: 77
arr_truckb_r	dc.b $0a0, $0d7, $062, $0d7, $0f1, $0d7, $0fd, $0a0
	; LineNumber: 78
str_truckb_r	
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	0 
	; LineNumber: 79
arr_truckt_r	dc.b $0e0, $060, $060, $060, $0fe, $0eb, $0ee, $0e0
	; LineNumber: 80
str_truckt_r	
	dc.b	$20, $20, $20, $20, $20, $20, $20, $20, $20
	dc.b	0 
	; LineNumber: 85
obstacles_y	dc.b $04, $05, $06, $07, $0c, $0d, $0f, $010
	dc.b $012, $013, $015, $016
	; LineNumber: 86
strip_direction	dc.b $01, $00, $01, $00, $01, $01, $01, $01
	dc.b $00, $00, $00, $00
	; LineNumber: 88
level_strips	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0, 0, 0, 0, 0, 0, 0, 0
	; LineNumber: 91
obstacles_x_rl	dc.b	0
	; LineNumber: 91
obstacles_x_lr	dc.b	0
	; LineNumber: 95
logo	dc.b $072, $049, $070, $06e, $070, $072, $06e, $055
	dc.b $049, $020, $020, $020, $020, $06b, $04b, $06b
	dc.b $020, $020, $042, $020, $06b, $055, $055, $049
	dc.b $055, $049, $071, $020, $06d, $07d, $020, $071
	dc.b $020, $04b, $071, $04a, $04b, $04a, $042, $078
	dc.b $078, $078, $078, $078, $078, $078, $078, $078
	dc.b $078, $078, $04a, $04b
	; LineNumber: 103
title_screen_frog_pointer	= $02
	; LineNumber: 104
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
	; LineNumber: 135
petscii_pointer	=  $04
	; LineNumber: 169
level2	dc.b $0cc, $0ef, $0fa, $013, $03, $0f, $012, $05
	dc.b $03a, $039, $039, $039, $0cc, $0ef, $0ef, $0ef
	dc.b $0a0, $090, $085, $094, $086, $092, $08f, $087
	dc.b $0a0, $0ef, $0ef, $0ef, $0ef, $0fa, $0c, $09
	dc.b $016, $05, $013, $03a, $033, $0cc, $0ef, $0fa
	dc.b $020, $068, $068, $020, $068, $068, $068, $068
	dc.b $068, $068, $020, $068, $068, $068, $068, $068
	dc.b $068, $068, $020, $068, $068, $068, $068, $068
	dc.b $068, $068, $068, $068, $068, $068, $068, $020
	dc.b $068, $068, $068, $068, $068, $020, $068, $020
	dc.b $066, $05c, $020, $020, $020, $020, $066, $066
	dc.b $020, $020, $020, $020, $020, $066, $066, $020
	dc.b $020, $020, $020, $020, $066, $066, $066, $020
	dc.b $020, $020, $020, $066, $066, $020, $020, $020
	dc.b $020, $066, $066, $020, $020, $020, $020, $05c
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $020
	dc.b $066, $068, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $068, $068, $068
	dc.b $068, $068, $020, $020, $020, $020, $020, $020
	dc.b $020, $020, $020, $020, $020, $020, $020, $068
	dc.b $068, $068, $020, $020, $020, $020, $068, $066
	dc.b $0c3, $0c3, $0c3, $0c3, $0c3, $0c3, $0c3, $0c3
	dc.b $0c3, $0c3, $0c3, $0c3, $0c3, $0c3, $0c3, $0c3
	dc.b $0c3, $0c3, $0c3, $0c3, $0c3, $0c3, $0c3, $0c3
	dc.b $0c3, $0c3, $0c3, $0c3, $0c3, $0c3, $0c3, $0c3
	dc.b $0c3, $0c3, $0c3, $0c3, $0c3, $0c3, $0c3, $0c3
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0ad, $0ad, $0ad, $0ad, $0ad, $0ad, $0ad, $0ad
	dc.b $0ad, $0ad, $0ad, $0ad, $0ad, $0ad, $0ad, $0ad
	dc.b $0ad, $0ad, $0ad, $0ad, $0ad, $0ad, $0ad, $0ad
	dc.b $0ad, $0ad, $0ad, $0ad, $0ad, $0ad, $0ad, $0ad
	dc.b $0ad, $0ad, $0ad, $0ad, $0ad, $0ad, $0ad, $0ad
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0c3, $0c3, $0c3, $0c3, $0c3, $0c3, $0c3, $0c3
	dc.b $0c3, $0c3, $0c3, $0c3, $0c3, $0c3, $0c3, $0c3
	dc.b $0c3, $0c3, $0c3, $0c3, $0c3, $0c3, $0c3, $0c3
	dc.b $0c3, $0c3, $0c3, $0c3, $0c3, $0c3, $0c3, $0c3
	dc.b $0c3, $0c3, $0c3, $0c3, $0c3, $0c3, $0c3, $0c3
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0ad, $0ad, $0ad, $0ad, $0ad, $0ad, $0ad, $0ad
	dc.b $0ad, $0ad, $0ad, $0ad, $0ad, $0ad, $0ad, $0ad
	dc.b $0ad, $0ad, $0ad, $0ad, $0ad, $0ad, $0ad, $0ad
	dc.b $0ad, $0ad, $0ad, $0ad, $0ad, $0ad, $0ad, $0ad
	dc.b $0ad, $0ad, $0ad, $0ad, $0ad, $0ad, $0ad, $0ad
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0, $0a0
	dc.b $0e2, $0e2, $0e2, $0e2, $0e2, $0e2, $0e2, $0e2
	dc.b $0e2, $0e2, $0e2, $0e2, $0e2, $0e2, $0e2, $0e2
	dc.b $0e2, $0e2, $0e2, $0e2, $0e2, $0e2, $0e2, $0e2
	dc.b $0e2, $0e2, $0e2, $0e2, $0e2, $0e2, $0e2, $0e2
	dc.b $0e2, $0e2, $0e2, $0e2, $0e2, $0e2, $0e2, $0e2
	dc.b $066, $066, $066, $066, $066, $066, $066, $066
	dc.b $066, $066, $066, $066, $066, $066, $066, $066
	dc.b $066, $066, $066, $066, $066, $066, $066, $066
	dc.b $066, $066, $066, $066, $066, $066, $066, $066
	dc.b $066, $066, $066, $066, $066, $066, $066, $066
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
; // === functions ============================================================================================ 
	; NodeProcedureDecl -1
	; ***********  Defining procedure : cls
	;    Procedure type : User-defined procedure
	; LineNumber: 204
cls
	; LineNumber: 205
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
	; LineNumber: 206
	; MoveTo optimization
	lda #$00
	sta screenmemory
	lda #>$8000
	clc
	adc #$00
	sta screenmemory+1
	; LineNumber: 207
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : getkey
	;    Procedure type : User-defined procedure
	; LineNumber: 212
getkey
	; LineNumber: 215
	; LineNumber: 216
	; Peek
	lda $97 + $0
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : getat
	;    Procedure type : User-defined procedure
	; LineNumber: 234
	; LineNumber: 232
szp	=  $08
	; LineNumber: 230
sx	dc.b	0
	; LineNumber: 230
sy	dc.b	0
getat_block7
getat
	; LineNumber: 235
	; Assigning single variable : szp
	; Generic 16 bit op
	ldy #0
	lda sx
getat_rightvarInteger_var10 = $54
	sta getat_rightvarInteger_var10
	sty getat_rightvarInteger_var10+1
	; Generic 16 bit op
	; Integer constant assigning
	ldy #$80
	lda #$00
getat_rightvarInteger_var13 =  $56
	sta getat_rightvarInteger_var13
	sty getat_rightvarInteger_var13+1
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
	adc getat_rightvarInteger_var13
getat_wordAdd11
	sta getat_rightvarInteger_var13
	; High-bit binop
	tya
	adc getat_rightvarInteger_var13+1
	tay
	lda getat_rightvarInteger_var13
	; Low bit binop:
	clc
	adc getat_rightvarInteger_var10
getat_wordAdd8
	sta getat_rightvarInteger_var10
	; High-bit binop
	tya
	adc getat_rightvarInteger_var10+1
	tay
	lda getat_rightvarInteger_var10
	sta szp
	sty szp+1
	; LineNumber: 236
	; LineNumber: 237
	; Load pointer array
	ldy #$0
	lda (szp),y
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : textat
	;    Procedure type : User-defined procedure
	; LineNumber: 243
	; LineNumber: 241
zp	=  $08
	; LineNumber: 239
x	dc.b	0
	; LineNumber: 239
y	dc.b	0
	; LineNumber: 239
this_str	=  $16
	; LineNumber: 239
str_len	dc.b	0
textat_block14
textat
	; LineNumber: 244
	; Assigning single variable : zp
	; Generic 16 bit op
	ldy #0
	lda x
textat_rightvarInteger_var17 = $54
	sta textat_rightvarInteger_var17
	sty textat_rightvarInteger_var17+1
	; Generic 16 bit op
	; Integer constant assigning
	ldy #$80
	lda #$00
textat_rightvarInteger_var20 =  $56
	sta textat_rightvarInteger_var20
	sty textat_rightvarInteger_var20+1
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
	adc textat_rightvarInteger_var20
textat_wordAdd18
	sta textat_rightvarInteger_var20
	; High-bit binop
	tya
	adc textat_rightvarInteger_var20+1
	tay
	lda textat_rightvarInteger_var20
	; Low bit binop:
	clc
	adc textat_rightvarInteger_var17
textat_wordAdd15
	sta textat_rightvarInteger_var17
	; High-bit binop
	tya
	adc textat_rightvarInteger_var17+1
	tay
	lda textat_rightvarInteger_var17
	sta zp
	sty zp+1
	; LineNumber: 244
	; memcpyfast
	ldy str_len
	dey
textat_memcpy21
	lda (this_str),y
	sta (zp),y
	dey
	bpl textat_memcpy21
	; LineNumber: 246
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : numberat
	;    Procedure type : User-defined procedure
	; LineNumber: 254
	; LineNumber: 251
num_p	=  $08
	; LineNumber: 252
num_str	
	dc.b	$30, $30, $30, $30, $30, 0
	; LineNumber: 249
num_x	dc.b	0
	; LineNumber: 249
num_y	dc.b	0
	; LineNumber: 249
num	dc.w	0
	; LineNumber: 249
num_len	dc.b	0
numberat_block22
numberat
	; LineNumber: 256
	; Binary clause INTEGER: GREATEREQUAL
	; Compare INTEGER with pure num / var optimization. GREATER. 
	lda num+1   ; compare high bytes
	cmp #$00 ;keep
	bcc numberat_localfailed38
	bne numberat_ConditionalTrueBlock24
	lda num
	cmp #$0a ;keep
	bcc numberat_localfailed38
	jmp numberat_ConditionalTrueBlock24
numberat_localfailed38
	jmp numberat_elseblock25
numberat_ConditionalTrueBlock24: ;Main true block ;keep 
	; LineNumber: 257
	; LineNumber: 259
	
; // Put each digit as PETSCII into the string
	; Poke
	lda #$2
	sta $50
	; 8 bit binop
	; Add/sub where right value is constant number
	; Modulo
	lda #$a
numberat_val_var40 = $54
	sta numberat_val_var40
	; integer assignment NodeVar
	ldy num+1 ; Next one
	lda num
	sec
numberat_modulo41
	sbc numberat_val_var40
	bcs numberat_modulo41
	adc numberat_val_var40
	clc
	adc #$30
	 ; end add / sub var with constant
	ldx $50
	sta num_str,x
	; LineNumber: 261
	; Poke
	lda #$1
	sta $50
	; 8 bit binop
	; Add/sub where right value is constant number
	; Modulo
	lda #$a
numberat_val_var42 = $54
	sta numberat_val_var42
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
numberat_modulo43
	sbc numberat_val_var42
	bcs numberat_modulo43
	adc numberat_val_var42
	clc
	adc #$30
	 ; end add / sub var with constant
	ldx $50
	sta num_str,x
	; LineNumber: 262
	; Poke
	; Optimization: shift is zero
	; Generic 16 bit op
	ldy #0
	lda #$30
numberat_rightvarInteger_var46 = $54
	sta numberat_rightvarInteger_var46
	sty numberat_rightvarInteger_var46+1
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
	lda initdiv16x8_dividend
	ldy initdiv16x8_dividend+1
	; Low bit binop:
	clc
	adc numberat_rightvarInteger_var46
numberat_wordAdd44
	sta numberat_rightvarInteger_var46
	; High-bit binop
	tya
	adc numberat_rightvarInteger_var46+1
	tay
	lda numberat_rightvarInteger_var46
	sta num_str
	; LineNumber: 266
	jmp numberat_elsedoneblock26
numberat_elseblock25
	; LineNumber: 267
	; LineNumber: 268
	; Poke
	; Optimization: shift is zero
	; HandleVarBinopB16bit
	ldy #0 ; ::HandleVarBinopB16bit 0
	lda #$30
numberat_rightvarInteger_var49 = $54
	sta numberat_rightvarInteger_var49
	sty numberat_rightvarInteger_var49+1
	lda num+1
	clc
	adc numberat_rightvarInteger_var49+1
	tay
	lda num
	clc
	adc numberat_rightvarInteger_var49
	bcc numberat_wordAdd48
	iny
numberat_wordAdd48
	sta num_str
	; LineNumber: 269
numberat_elsedoneblock26
	; LineNumber: 272
	; Assigning single variable : num_p
	; Generic 16 bit op
	ldy #0
	lda num_x
numberat_rightvarInteger_var52 = $54
	sta numberat_rightvarInteger_var52
	sty numberat_rightvarInteger_var52+1
	; Generic 16 bit op
	; Integer constant assigning
	ldy #$80
	lda #$00
numberat_rightvarInteger_var55 =  $56
	sta numberat_rightvarInteger_var55
	sty numberat_rightvarInteger_var55+1
	; Right is PURE NUMERIC : Is word =1
	; 16 bit mul or div
	; Mul 16x8 setup
	ldy #0
	lda num_y
	sta mul16x8_num1
	sty mul16x8_num1Hi
	lda #$28
	sta mul16x8_num2
	jsr mul16x8_procedure
	; Low bit binop:
	clc
	adc numberat_rightvarInteger_var55
numberat_wordAdd53
	sta numberat_rightvarInteger_var55
	; High-bit binop
	tya
	adc numberat_rightvarInteger_var55+1
	tay
	lda numberat_rightvarInteger_var55
	; Low bit binop:
	clc
	adc numberat_rightvarInteger_var52
numberat_wordAdd50
	sta numberat_rightvarInteger_var52
	; High-bit binop
	tya
	adc numberat_rightvarInteger_var52+1
	tay
	lda numberat_rightvarInteger_var52
	sta num_p
	sty num_p+1
	; LineNumber: 272
	; memcpy
	ldy #0
numberat_memcpy56
	lda num_str+ $00,y
	sta (num_p),y
	iny
	cpy num_len
	bne numberat_memcpy56
	; LineNumber: 274
	rts
	
; // =========================================
; // SOUND!
	; NodeProcedureDecl -1
	; ***********  Defining procedure : PlayNote
	;    Procedure type : User-defined procedure
	; LineNumber: 282
	; LineNumber: 281
note_duration	dc.b	0
	; LineNumber: 279
note	dc.b	0
	; LineNumber: 279
note_len	dc.b	0
PlayNote_block57
PlayNote
	; LineNumber: 283
	; Assigning memory location
	; Assigning single variable : $e848
	lda note
	; Calling storevariable
	sta $e848
	; LineNumber: 285
	; Assigning single variable : note_duration
	lda #$0
	; Calling storevariable
	sta note_duration
PlayNote_forloop58
	; LineNumber: 283
	; Wait
	ldx #$c8 ; optimized, look out for bugs
	dex
	bne *-1
PlayNote_forloopcounter60
	; Compare is onpage
	inc note_duration
	lda note_len
	cmp note_duration ;keep
	bne PlayNote_forloop58
PlayNote_loopdone63: ;keep
PlayNote_forloopend59
	; LineNumber: 285
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : burp
	;    Procedure type : User-defined procedure
	; LineNumber: 288
burp
	; LineNumber: 289
	; Assigning memory location
	; Assigning single variable : $e84a
	lda #$f
	; Calling storevariable
	sta $e84a
	; LineNumber: 290
	; Assigning memory location
	; Assigning single variable : $e84b
	lda #$10
	; Calling storevariable
	sta $e84b
	; LineNumber: 291
	; Assigning single variable : note
	lda #$ee
	; Calling storevariable
	sta note
	; Assigning single variable : note_len
	lda #$ff
	; Calling storevariable
	sta note_len
	jsr PlayNote
	; LineNumber: 292
	; Assigning memory location
	; Assigning single variable : $e84b
	lda #$0
	; Calling storevariable
	sta $e84b
	; LineNumber: 293
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : ping
	;    Procedure type : User-defined procedure
	; LineNumber: 296
ping
	; LineNumber: 297
	; Assigning memory location
	; Assigning single variable : $e84a
	lda #$55
	; Calling storevariable
	sta $e84a
	; LineNumber: 298
	; Assigning memory location
	; Assigning single variable : $e84b
	lda #$10
	; Calling storevariable
	sta $e84b
	; LineNumber: 299
	; Assigning single variable : note
	lda #$ee
	; Calling storevariable
	sta note
	; Assigning single variable : note_len
	lda #$c8
	; Calling storevariable
	sta note_len
	jsr PlayNote
	; LineNumber: 300
	; Assigning single variable : note
	lda #$fb
	; Calling storevariable
	sta note
	; Assigning single variable : note_len
	lda #$c8
	; Calling storevariable
	sta note_len
	jsr PlayNote
	; LineNumber: 301
	; Assigning single variable : note
	lda #$d2
	; Calling storevariable
	sta note
	; Assigning single variable : note_len
	lda #$ff
	; Calling storevariable
	sta note_len
	jsr PlayNote
	; LineNumber: 302
	; Assigning single variable : note
	lda #$d2
	; Calling storevariable
	sta note
	; Assigning single variable : note_len
	lda #$ff
	; Calling storevariable
	sta note_len
	jsr PlayNote
	; LineNumber: 303
	; Assigning memory location
	; Assigning single variable : $e84b
	lda #$0
	; Calling storevariable
	sta $e84b
	; LineNumber: 304
	rts
	
; // =========================================
	; NodeProcedureDecl -1
	; ***********  Defining procedure : title_screen
	;    Procedure type : User-defined procedure
	; LineNumber: 309
title_screen
	; LineNumber: 312
	
; // Set up pointer to array:
	; Assigning single variable : title_screen_frog_pointer
	lda #<title_screen_frog
	ldx #>title_screen_frog
	sta title_screen_frog_pointer
	stx title_screen_frog_pointer+1
	; LineNumber: 314
	jsr cls
	; LineNumber: 317
	
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
title_screen_outer67
	ldy #0
title_screen_inner68
	lda ($4c),y
	sta ($4e),y
	dey
	bne title_screen_inner68
	inc $4c+1
	inc $4e+1
	dex
	bne title_screen_outer67
	ldy #0
title_screen_final69
	lda ($4c),y
	sta ($4e),y
	iny
	cpy #232
	bne title_screen_final69
	; LineNumber: 318
	; memcpyfast
	ldx #12
title_screen_memcpy70
	lda logo+ $00,x
	sta $8000,x
	dex
	bpl title_screen_memcpy70
	; LineNumber: 319
	; memcpyfast
	ldx #12
title_screen_memcpy71
	lda logo+ $0d,x
	sta $8028,x
	dex
	bpl title_screen_memcpy71
	; LineNumber: 320
	; memcpyfast
	ldx #12
title_screen_memcpy72
	lda logo+ $1a,x
	sta $8050,x
	dex
	bpl title_screen_memcpy72
	; LineNumber: 321
	; memcpyfast
	ldx #12
title_screen_memcpy73
	lda logo+ $27,x
	sta $8078,x
	dex
	bpl title_screen_memcpy73
	; LineNumber: 325
title_screen_while74
	; Binary clause Simplified: NOTEQUALS
	jsr getkey
	; Compare with pure num / var optimization
	cmp #$20;keep
	beq title_screen_elsedoneblock77
title_screen_ConditionalTrueBlock75: ;Main true block ;keep 
	; LineNumber: 326
	; LineNumber: 327
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
	; LineNumber: 328
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
	; LineNumber: 329
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
	; LineNumber: 330
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
	; LineNumber: 331
	jmp title_screen_while74
title_screen_elsedoneblock77
	; LineNumber: 333
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : score_screen
	;    Procedure type : User-defined procedure
	; LineNumber: 336
score_screen
	; LineNumber: 337
	jsr cls
	; LineNumber: 338
score_screen_while81
	; Binary clause Simplified: NOTEQUALS
	jsr getkey
	; Compare with pure num / var optimization
	cmp #$20;keep
	beq score_screen_localfailed90
	jmp score_screen_ConditionalTrueBlock82
score_screen_localfailed90
	jmp score_screen_elsedoneblock84
score_screen_ConditionalTrueBlock82: ;Main true block ;keep 
	; LineNumber: 339
	; LineNumber: 340
	; memcpyfast
	ldx #12
score_screen_memcpy92
	lda logo+ $00,x
	sta $8000,x
	dex
	bpl score_screen_memcpy92
	; LineNumber: 341
	; memcpyfast
	ldx #12
score_screen_memcpy93
	lda logo+ $0d,x
	sta $8028,x
	dex
	bpl score_screen_memcpy93
	; LineNumber: 342
	; memcpyfast
	ldx #12
score_screen_memcpy94
	lda logo+ $1a,x
	sta $8050,x
	dex
	bpl score_screen_memcpy94
	; LineNumber: 343
	; memcpyfast
	ldx #12
score_screen_memcpy95
	lda logo+ $27,x
	sta $8078,x
	dex
	bpl score_screen_memcpy95
	; LineNumber: 346
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
	; LineNumber: 347
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
	; LineNumber: 348
	; Assigning single variable : num_x
	lda #$f
	; Calling storevariable
	sta num_x
	; Assigning single variable : num_y
	lda #$7
	; Calling storevariable
	sta num_y
	; Assigning single variable : num
	; integer assignment NodeVar
	ldy player_score+1 ; Next one
	lda player_score
	; Calling storevariable
	sta num
	sty num+1
	; Assigning single variable : num_len
	lda #$3
	; Calling storevariable
	sta num_len
	jsr numberat
	; LineNumber: 349
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
	; LineNumber: 350
	jmp score_screen_while81
score_screen_elsedoneblock84
	; LineNumber: 352
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : sprite_xy
	;    Procedure type : User-defined procedure
	; LineNumber: 358
	; LineNumber: 356
spr_p	=  $08
	; LineNumber: 354
spr_x	dc.b	0
	; LineNumber: 354
spr_y	dc.b	0
	; LineNumber: 354
source_str	=  $16
	; LineNumber: 354
spr_len	dc.b	0
sprite_xy_block96
sprite_xy
	; LineNumber: 359
	; Assigning single variable : spr_p
	; Generic 16 bit op
	ldy #0
	lda spr_x
sprite_xy_rightvarInteger_var99 = $54
	sta sprite_xy_rightvarInteger_var99
	sty sprite_xy_rightvarInteger_var99+1
	; Generic 16 bit op
	lda #<level_strips
	ldy #>level_strips
sprite_xy_rightvarInteger_var102 =  $56
	sta sprite_xy_rightvarInteger_var102
	sty sprite_xy_rightvarInteger_var102+1
	; Right is PURE NUMERIC : Is word =1
	; 16 bit mul or div
	; Mul 16x8 setup
	ldy #0
	lda spr_y
	sta mul16x8_num1
	sty mul16x8_num1Hi
	lda #$50
	sta mul16x8_num2
	jsr mul16x8_procedure
	; Low bit binop:
	clc
	adc sprite_xy_rightvarInteger_var102
sprite_xy_wordAdd100
	sta sprite_xy_rightvarInteger_var102
	; High-bit binop
	tya
	adc sprite_xy_rightvarInteger_var102+1
	tay
	lda sprite_xy_rightvarInteger_var102
	; Low bit binop:
	clc
	adc sprite_xy_rightvarInteger_var99
sprite_xy_wordAdd97
	sta sprite_xy_rightvarInteger_var99
	; High-bit binop
	tya
	adc sprite_xy_rightvarInteger_var99+1
	tay
	lda sprite_xy_rightvarInteger_var99
	sta spr_p
	sty spr_p+1
	; LineNumber: 359
	; memcpyfast
	ldy spr_len
	dey
sprite_xy_memcpy103
	lda (source_str),y
	sta (spr_p),y
	dey
	bpl sprite_xy_memcpy103
	; LineNumber: 361
	; Assigning single variable : spr_p
	; Generic 16 bit op
	ldy #0
	lda #$28
sprite_xy_rightvarInteger_var106 = $54
	sta sprite_xy_rightvarInteger_var106
	sty sprite_xy_rightvarInteger_var106+1
	; Generic 16 bit op
	ldy #0
	lda spr_x
sprite_xy_rightvarInteger_var109 =  $56
	sta sprite_xy_rightvarInteger_var109
	sty sprite_xy_rightvarInteger_var109+1
	; Generic 16 bit op
	lda #<level_strips
	ldy #>level_strips
sprite_xy_rightvarInteger_var112 =  $58
	sta sprite_xy_rightvarInteger_var112
	sty sprite_xy_rightvarInteger_var112+1
	; Right is PURE NUMERIC : Is word =1
	; 16 bit mul or div
	; Mul 16x8 setup
	ldy #0
	lda spr_y
	sta mul16x8_num1
	sty mul16x8_num1Hi
	lda #$50
	sta mul16x8_num2
	jsr mul16x8_procedure
	; Low bit binop:
	clc
	adc sprite_xy_rightvarInteger_var112
sprite_xy_wordAdd110
	sta sprite_xy_rightvarInteger_var112
	; High-bit binop
	tya
	adc sprite_xy_rightvarInteger_var112+1
	tay
	lda sprite_xy_rightvarInteger_var112
	; Low bit binop:
	clc
	adc sprite_xy_rightvarInteger_var109
sprite_xy_wordAdd107
	sta sprite_xy_rightvarInteger_var109
	; High-bit binop
	tya
	adc sprite_xy_rightvarInteger_var109+1
	tay
	lda sprite_xy_rightvarInteger_var109
	; Low bit binop:
	clc
	adc sprite_xy_rightvarInteger_var106
sprite_xy_wordAdd104
	sta sprite_xy_rightvarInteger_var106
	; High-bit binop
	tya
	adc sprite_xy_rightvarInteger_var106+1
	tay
	lda sprite_xy_rightvarInteger_var106
	sta spr_p
	sty spr_p+1
	; LineNumber: 361
	; memcpyfast
	ldy spr_len
	dey
sprite_xy_memcpy113
	lda (source_str),y
	sta (spr_p),y
	dey
	bpl sprite_xy_memcpy113
	; LineNumber: 363
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : init_vars
	;    Procedure type : User-defined procedure
	; LineNumber: 370
	; LineNumber: 367
this_row	=  $08
	; LineNumber: 367
target_strip	=  $16
	; LineNumber: 368
iteration	dc.b	0
	; LineNumber: 369
homeplate	dc.b	$d3
init_vars_block114
init_vars
	; LineNumber: 371
	jsr cls
	; LineNumber: 374
	
; // Init the playfield
	; Assigning single variable : screenmemory
	lda #$00
	ldx #$80
	sta screenmemory
	stx screenmemory+1
	; LineNumber: 375
	; Assigning single variable : petscii_pointer
	lda #<level2
	ldx #>level2
	sta petscii_pointer
	stx petscii_pointer+1
	; LineNumber: 376
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
init_vars_outer115
	ldy #0
init_vars_inner116
	lda ($4c),y
	sta ($4e),y
	dey
	bne init_vars_inner116
	inc $4c+1
	inc $4e+1
	dex
	bne init_vars_outer115
	ldy #0
init_vars_final117
	lda ($4c),y
	sta ($4e),y
	iny
	cpy #232
	bne init_vars_final117
	; LineNumber: 377
	; Assigning single variable : this_row
	lda petscii_pointer
	ldx petscii_pointer+1
	sta this_row
	stx this_row+1
	; LineNumber: 378
	; Assigning single variable : target_strip
	lda #<level_strips
	ldx #>level_strips
	sta target_strip
	stx target_strip+1
	; LineNumber: 392
	; Assigning single variable : iteration
	lda #$1
	; Calling storevariable
	sta iteration
init_vars_forloop118
	; LineNumber: 382
	; LineNumber: 384
	
; // Obstacle Blanks
; // Copy the source twice
	; memcpyfast
	ldy #39
init_vars_memcpy128
	lda (this_row),y
	sta (target_strip),y
	dey
	bpl init_vars_memcpy128
	; LineNumber: 385
	; Assigning single variable : target_strip
	lda target_strip
	clc
	adc #$28
	sta target_strip+0
	; Optimization : A := A op 8 bit - var and bvar are the same - perform inc
	bcc init_vars_WordAdd129
	inc target_strip+1
init_vars_WordAdd129
	; LineNumber: 386
	; memcpyfast
	ldy #39
init_vars_memcpy130
	lda (this_row),y
	sta (target_strip),y
	dey
	bpl init_vars_memcpy130
	; LineNumber: 387
	; Assigning single variable : target_strip
	lda target_strip
	clc
	adc #$28
	sta target_strip+0
	; Optimization : A := A op 8 bit - var and bvar are the same - perform inc
	bcc init_vars_WordAdd131
	inc target_strip+1
init_vars_WordAdd131
	; LineNumber: 390
	
; // Next row
	; Assigning single variable : this_row
	lda this_row
	clc
	adc #$28
	sta this_row+0
	; Optimization : A := A op 8 bit - var and bvar are the same - perform inc
	bcc init_vars_WordAdd132
	inc this_row+1
init_vars_WordAdd132
	; LineNumber: 391
init_vars_forloopcounter120
	; Compare is onpage
	inc iteration
	lda #$19
	cmp iteration ;keep
	bcs init_vars_forloop118
init_vars_loopdone133: ;keep
init_vars_forloopend119
	; LineNumber: 394
	
; // Init the "sprites"
	; memcpy
	ldx #0
init_vars_memcpy134
	lda arr_crockr+ $00,x
	sta str_crockr,x
	inx
	cpx #$9
	bne init_vars_memcpy134
	; LineNumber: 395
	; memcpy
	ldx #0
init_vars_memcpy135
	lda arr_crockl+ $00,x
	sta str_crockl,x
	inx
	cpx #$9
	bne init_vars_memcpy135
	; LineNumber: 396
	; memcpy
	ldx #0
init_vars_memcpy136
	lda arr_logl+ $00,x
	sta str_logl,x
	inx
	cpx #$5
	bne init_vars_memcpy136
	; LineNumber: 397
	; memcpy
	ldx #0
init_vars_memcpy137
	lda arr_logr+ $00,x
	sta str_logr,x
	inx
	cpx #$5
	bne init_vars_memcpy137
	; LineNumber: 398
	; memcpy
	ldx #0
init_vars_memcpy138
	lda arr_truckt_r+ $00,x
	sta str_truckt_r,x
	inx
	cpx #$8
	bne init_vars_memcpy138
	; LineNumber: 399
	; memcpy
	ldx #0
init_vars_memcpy139
	lda arr_truckb_r+ $00,x
	sta str_truckb_r,x
	inx
	cpx #$8
	bne init_vars_memcpy139
	; LineNumber: 400
	; memcpy
	ldx #0
init_vars_memcpy140
	lda arr_carl+ $00,x
	sta str_cart,x
	inx
	cpx #$4
	bne init_vars_memcpy140
	; LineNumber: 401
	; memcpy
	ldx #0
init_vars_memcpy141
	lda arr_carr+ $00,x
	sta str_carb,x
	inx
	cpx #$4
	bne init_vars_memcpy141
	; LineNumber: 405
	
; // Sprite start positions
	; Assigning single variable : spr_x
	lda #$a
	; Calling storevariable
	sta spr_x
	; Assigning single variable : spr_y
	; Load Byte array
	ldx #$0
	lda obstacles_y,x
	; Calling storevariable
	sta spr_y
	; Assigning single variable : source_str
	lda #<str_crockr
	ldx #>str_crockr
	sta source_str
	stx source_str+1
	; Assigning single variable : spr_len
	lda #$9
	; Calling storevariable
	sta spr_len
	jsr sprite_xy
	; LineNumber: 406
	; Assigning single variable : spr_x
	lda #$1e
	; Calling storevariable
	sta spr_x
	; Assigning single variable : spr_y
	; Load Byte array
	ldx #$1
	lda obstacles_y,x
	; Calling storevariable
	sta spr_y
	; Assigning single variable : source_str
	lda #<str_crockl
	ldx #>str_crockl
	sta source_str
	stx source_str+1
	; Assigning single variable : spr_len
	lda #$9
	; Calling storevariable
	sta spr_len
	jsr sprite_xy
	; LineNumber: 407
	; Assigning single variable : spr_x
	lda #$4
	; Calling storevariable
	sta spr_x
	; Assigning single variable : spr_y
	; Load Byte array
	ldx #$2
	lda obstacles_y,x
	; Calling storevariable
	sta spr_y
	; Assigning single variable : source_str
	lda #<str_logr
	ldx #>str_logr
	sta source_str
	stx source_str+1
	; Assigning single variable : spr_len
	lda #$5
	; Calling storevariable
	sta spr_len
	jsr sprite_xy
	; LineNumber: 408
	; Assigning single variable : spr_x
	lda #$18
	; Calling storevariable
	sta spr_x
	; Assigning single variable : spr_y
	; Load Byte array
	ldx #$3
	lda obstacles_y,x
	; Calling storevariable
	sta spr_y
	; Assigning single variable : source_str
	lda #<str_logl
	ldx #>str_logl
	sta source_str
	stx source_str+1
	; Assigning single variable : spr_len
	lda #$5
	; Calling storevariable
	sta spr_len
	jsr sprite_xy
	; LineNumber: 409
	; Assigning single variable : spr_x
	lda #$22
	; Calling storevariable
	sta spr_x
	; Assigning single variable : spr_y
	; Load Byte array
	ldx #$4
	lda obstacles_y,x
	; Calling storevariable
	sta spr_y
	; Assigning single variable : source_str
	lda #<str_cart
	ldx #>str_cart
	sta source_str
	stx source_str+1
	; Assigning single variable : spr_len
	lda #$4
	; Calling storevariable
	sta spr_len
	jsr sprite_xy
	; LineNumber: 410
	; Assigning single variable : spr_x
	lda #$22
	; Calling storevariable
	sta spr_x
	; Assigning single variable : spr_y
	; Load Byte array
	ldx #$5
	lda obstacles_y,x
	; Calling storevariable
	sta spr_y
	; Assigning single variable : source_str
	lda #<str_carb
	ldx #>str_carb
	sta source_str
	stx source_str+1
	; Assigning single variable : spr_len
	lda #$4
	; Calling storevariable
	sta spr_len
	jsr sprite_xy
	; LineNumber: 411
	; Assigning single variable : spr_x
	lda #$13
	; Calling storevariable
	sta spr_x
	; Assigning single variable : spr_y
	; Load Byte array
	ldx #$6
	lda obstacles_y,x
	; Calling storevariable
	sta spr_y
	; Assigning single variable : source_str
	lda #<str_cart
	ldx #>str_cart
	sta source_str
	stx source_str+1
	; Assigning single variable : spr_len
	lda #$4
	; Calling storevariable
	sta spr_len
	jsr sprite_xy
	; LineNumber: 412
	; Assigning single variable : spr_x
	lda #$13
	; Calling storevariable
	sta spr_x
	; Assigning single variable : spr_y
	; Load Byte array
	ldx #$7
	lda obstacles_y,x
	; Calling storevariable
	sta spr_y
	; Assigning single variable : source_str
	lda #<str_carb
	ldx #>str_carb
	sta source_str
	stx source_str+1
	; Assigning single variable : spr_len
	lda #$4
	; Calling storevariable
	sta spr_len
	jsr sprite_xy
	; LineNumber: 413
	; Assigning single variable : spr_x
	lda #$a
	; Calling storevariable
	sta spr_x
	; Assigning single variable : spr_y
	; Load Byte array
	ldx #$8
	lda obstacles_y,x
	; Calling storevariable
	sta spr_y
	; Assigning single variable : source_str
	lda #<str_truckt_r
	ldx #>str_truckt_r
	sta source_str
	stx source_str+1
	; Assigning single variable : spr_len
	lda #$8
	; Calling storevariable
	sta spr_len
	jsr sprite_xy
	; LineNumber: 414
	; Assigning single variable : spr_x
	lda #$a
	; Calling storevariable
	sta spr_x
	; Assigning single variable : spr_y
	; Load Byte array
	ldx #$9
	lda obstacles_y,x
	; Calling storevariable
	sta spr_y
	; Assigning single variable : source_str
	lda #<str_truckb_r
	ldx #>str_truckb_r
	sta source_str
	stx source_str+1
	; Assigning single variable : spr_len
	lda #$8
	; Calling storevariable
	sta spr_len
	jsr sprite_xy
	; LineNumber: 415
	; Assigning single variable : spr_x
	lda #$13
	; Calling storevariable
	sta spr_x
	; Assigning single variable : spr_y
	; Load Byte array
	ldx #$a
	lda obstacles_y,x
	; Calling storevariable
	sta spr_y
	; Assigning single variable : source_str
	lda #<str_truckt_r
	ldx #>str_truckt_r
	sta source_str
	stx source_str+1
	; Assigning single variable : spr_len
	lda #$8
	; Calling storevariable
	sta spr_len
	jsr sprite_xy
	; LineNumber: 416
	; Assigning single variable : spr_x
	lda #$13
	; Calling storevariable
	sta spr_x
	; Assigning single variable : spr_y
	; Load Byte array
	ldx #$b
	lda obstacles_y,x
	; Calling storevariable
	sta spr_y
	; Assigning single variable : source_str
	lda #<str_truckb_r
	ldx #>str_truckb_r
	sta source_str
	stx source_str+1
	; Assigning single variable : spr_len
	lda #$8
	; Calling storevariable
	sta spr_len
	jsr sprite_xy
	; LineNumber: 419
	; Assigning single variable : frog_x
	lda #$14
	; Calling storevariable
	sta frog_x
	; LineNumber: 420
	; Assigning single variable : frog_y
	lda #$18
	; Calling storevariable
	sta frog_y
	; LineNumber: 422
	; Assigning single variable : KEYPRESS
	lda #$0
	; Calling storevariable
	sta KEYPRESS
	; LineNumber: 423
	; Assigning single variable : ALIVE
	lda #$1
	; Calling storevariable
	sta ALIVE
	; LineNumber: 424
	; Assigning single variable : WON_GAME
	lda #$0
	; Calling storevariable
	sta WON_GAME
	; LineNumber: 426
	; Assigning single variable : player_lives
	lda #$3
	; Calling storevariable
	sta player_lives
	; LineNumber: 427
	; Assigning single variable : player_score
	ldy #0
	lda #$0
	; Calling storevariable
	sta player_score
	sty player_score+1
	; LineNumber: 430
	
; // Home plates
	; Assigning single variable : x
	lda #$3
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$1
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<homeplate
	ldx #>homeplate
	sta this_str
	stx this_str+1
	; Assigning single variable : str_len
	lda #$1
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 431
	; Assigning single variable : x
	lda #$a
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$1
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<homeplate
	ldx #>homeplate
	sta this_str
	stx this_str+1
	; Assigning single variable : str_len
	lda #$1
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 432
	; Assigning single variable : x
	lda #$12
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$1
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<homeplate
	ldx #>homeplate
	sta this_str
	stx this_str+1
	; Assigning single variable : str_len
	lda #$1
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 433
	; Assigning single variable : x
	lda #$18
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$1
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<homeplate
	ldx #>homeplate
	sta this_str
	stx this_str+1
	; Assigning single variable : str_len
	lda #$1
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 434
	; Assigning single variable : x
	lda #$1f
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$1
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<homeplate
	ldx #>homeplate
	sta this_str
	stx this_str+1
	; Assigning single variable : str_len
	lda #$1
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 435
	; Assigning single variable : x
	lda #$25
	; Calling storevariable
	sta x
	; Assigning single variable : y
	lda #$1
	; Calling storevariable
	sta y
	; Assigning single variable : this_str
	lda #<homeplate
	ldx #>homeplate
	sta this_str
	stx this_str+1
	; Assigning single variable : str_len
	lda #$1
	; Calling storevariable
	sta str_len
	jsr textat
	; LineNumber: 436
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : shit_delay
	;    Procedure type : User-defined procedure
	; LineNumber: 441
	; LineNumber: 440
temp_delay	dc.b	0
shit_delay_block142
shit_delay
	; LineNumber: 447
	; Assigning single variable : temp_delay
	lda #$1
	; Calling storevariable
	sta temp_delay
shit_delay_forloop143
	; LineNumber: 443
	; LineNumber: 444
shit_delay_while154
	; Binary clause Simplified: EQUALS
	lda ti
	; Compare with pure num / var optimization
	cmp oldti;keep
	bne shit_delay_elsedoneblock157
shit_delay_ConditionalTrueBlock155: ;Main true block ;keep 
	; LineNumber: 443
	; LineNumber: 444
	jmp shit_delay_while154
shit_delay_elsedoneblock157
	; LineNumber: 445
	; Assigning single variable : oldti
	lda ti
	; Calling storevariable
	sta oldti
	; LineNumber: 446
shit_delay_forloopcounter145
	; Compare is onpage
	inc temp_delay
	lda #$3
	cmp temp_delay ;keep
	bcs shit_delay_forloop143
shit_delay_loopdone160: ;keep
shit_delay_forloopend144
	; LineNumber: 447
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : show_obstacles
	;    Procedure type : User-defined procedure
	; LineNumber: 454
	; LineNumber: 452
strip_num	dc.b	0
	; LineNumber: 452
this_strip	dc.b	0
	; LineNumber: 453
this_source_offset	=  $08
show_obstacles_block161
show_obstacles
	; LineNumber: 458
	
; // TRSE way of incrementing 
; // counter with loop back to 0
	inc obstacles_x_rl
	lda obstacles_x_rl
	cmp #$27 ; keep
	bne show_obstacles_incmax163
	lda #$0
	sta obstacles_x_rl
show_obstacles_incmax163
	; LineNumber: 459
	; Assigning single variable : obstacles_x_lr
	; 8 bit binop
	; Add/sub where right value is constant number
	lda #$28
	sec
	sbc obstacles_x_rl
	 ; end add / sub var with constant
	; Calling storevariable
	sta obstacles_x_lr
	; LineNumber: 479
	; Assigning single variable : strip_num
	lda #$0
	; Calling storevariable
	sta strip_num
show_obstacles_forloop164
	; LineNumber: 462
	; LineNumber: 463
	; Assigning single variable : this_strip
	; Load Byte array
	ldx strip_num
	lda obstacles_y,x
	; Calling storevariable
	sta this_strip
	; LineNumber: 464
	; Assigning single variable : screenmemory
	; Generic 16 bit op
	; Integer constant assigning
	ldy #$80
	lda #$00
show_obstacles_rightvarInteger_var190 = $54
	sta show_obstacles_rightvarInteger_var190
	sty show_obstacles_rightvarInteger_var190+1
	; Right is PURE NUMERIC : Is word =1
	; 16 bit mul or div
	; Mul 16x8 setup
	ldy #0
	lda this_strip
	sta mul16x8_num1
	sty mul16x8_num1Hi
	lda #$28
	sta mul16x8_num2
	jsr mul16x8_procedure
	; Low bit binop:
	clc
	adc show_obstacles_rightvarInteger_var190
show_obstacles_wordAdd188
	sta show_obstacles_rightvarInteger_var190
	; High-bit binop
	tya
	adc show_obstacles_rightvarInteger_var190+1
	tay
	lda show_obstacles_rightvarInteger_var190
	sta screenmemory
	sty screenmemory+1
	; LineNumber: 466
	; Assigning single variable : this_source_offset
	; Generic 16 bit op
	lda #<level_strips
	ldy #>level_strips
show_obstacles_rightvarInteger_var193 = $54
	sta show_obstacles_rightvarInteger_var193
	sty show_obstacles_rightvarInteger_var193+1
	; Right is PURE NUMERIC : Is word =1
	; 16 bit mul or div
	; Mul 16x8 setup
	ldy #0
	lda this_strip
	sta mul16x8_num1
	sty mul16x8_num1Hi
	lda #$50
	sta mul16x8_num2
	jsr mul16x8_procedure
	; Low bit binop:
	clc
	adc show_obstacles_rightvarInteger_var193
show_obstacles_wordAdd191
	sta show_obstacles_rightvarInteger_var193
	; High-bit binop
	tya
	adc show_obstacles_rightvarInteger_var193+1
	tay
	lda show_obstacles_rightvarInteger_var193
	sta this_source_offset
	sty this_source_offset+1
	; LineNumber: 468
	; Binary clause Simplified: EQUALS
	; Load Byte array
	ldx strip_num
	lda strip_direction,x
	; Compare with pure num / var optimization
	cmp #$1;keep
	bne show_obstacles_elseblock196
show_obstacles_ConditionalTrueBlock195: ;Main true block ;keep 
	; LineNumber: 469
	; LineNumber: 470
	; Assigning single variable : this_source_offset
	lda this_source_offset
	clc
	adc obstacles_x_rl
	sta this_source_offset+0
	; Optimization : A := A op 8 bit - var and bvar are the same - perform inc
	bcc show_obstacles_WordAdd203
	inc this_source_offset+1
show_obstacles_WordAdd203
	; LineNumber: 472
	jmp show_obstacles_elsedoneblock197
show_obstacles_elseblock196
	; LineNumber: 473
	; LineNumber: 474
	; Assigning single variable : this_source_offset
	lda this_source_offset
	clc
	adc obstacles_x_lr
	sta this_source_offset+0
	; Optimization : A := A op 8 bit - var and bvar are the same - perform inc
	bcc show_obstacles_WordAdd205
	inc this_source_offset+1
show_obstacles_WordAdd205
	; LineNumber: 475
show_obstacles_elsedoneblock197
	; LineNumber: 476
	; memcpyfast
	ldy #39
show_obstacles_memcpy206
	lda (this_source_offset),y
	sta (screenmemory),y
	dey
	bpl show_obstacles_memcpy206
	; LineNumber: 478
show_obstacles_forloopcounter166
	inc strip_num
	lda #$c
	cmp strip_num ;keep
	beq show_obstacles_loopdone207
show_obstacles_loopnotdone208
	jmp show_obstacles_forloop164
show_obstacles_loopdone207
show_obstacles_forloopend165
	; LineNumber: 481
	
; // RESET SCREEN MEMORY
	; Assigning single variable : screenmemory
	lda #$00
	ldx #$80
	sta screenmemory
	stx screenmemory+1
	; LineNumber: 483
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : kill_frog
	;    Procedure type : User-defined procedure
	; LineNumber: 486
kill_frog
	; LineNumber: 488
	; Assigning single variable : frog_x
	lda #$14
	; Calling storevariable
	sta frog_x
	; LineNumber: 489
	; Assigning single variable : frog_y
	lda #$18
	; Calling storevariable
	sta frog_y
	; LineNumber: 490
	; Assigning single variable : frog_old_x
	lda frog_x
	; Calling storevariable
	sta frog_old_x
	; LineNumber: 491
	; Assigning single variable : frog_old_y
	lda frog_y
	; Calling storevariable
	sta frog_old_y
	; LineNumber: 492
	jsr burp
	; LineNumber: 493
	dec player_lives
	; LineNumber: 494
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : check_collisions
	;    Procedure type : User-defined procedure
	; LineNumber: 499
	; LineNumber: 498
next_tile	dc.b	0
check_collisions_block211
check_collisions
	; LineNumber: 501
	
; // CHECK COLLISSIONS
	; Assigning single variable : next_tile
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
	sta next_tile
	; LineNumber: 507
	cmp #$66 ;keep
	bne check_collisions_casenext213
	; LineNumber: 510
	; LineNumber: 511
	; Binary clause Simplified: LESS
	lda frog_y
	; Compare with pure num / var optimization
	cmp #$18;keep
	bcs check_collisions_elsedoneblock218
check_collisions_ConditionalTrueBlock216: ;Main true block ;keep 
	; LineNumber: 512
	; LineNumber: 513
	
; // There is no function to search a string
; // or check an array, or return array size,
; // so we need to check each character individually
; // Scenery
	; Assigning single variable : frog_x
	lda frog_old_x
	; Calling storevariable
	sta frog_x
	; LineNumber: 514
	; Assigning single variable : frog_y
	lda frog_old_y
	; Calling storevariable
	sta frog_y
	; LineNumber: 515
check_collisions_elsedoneblock218
	; LineNumber: 516
	jmp check_collisions_caseend212
check_collisions_casenext213
	lda next_tile
	cmp #$68 ;keep
	bne check_collisions_casenext221
	; LineNumber: 519
	; LineNumber: 520
	; Assigning single variable : frog_x
	lda frog_old_x
	; Calling storevariable
	sta frog_x
	; LineNumber: 521
	; Assigning single variable : frog_y
	lda frog_old_y
	; Calling storevariable
	sta frog_y
	; LineNumber: 522
	jmp check_collisions_caseend212
check_collisions_casenext221
	lda next_tile
	cmp #$5c ;keep
	bne check_collisions_casenext223
	; LineNumber: 525
	; LineNumber: 526
	; Assigning single variable : frog_x
	lda frog_old_x
	; Calling storevariable
	sta frog_x
	; LineNumber: 527
	; Assigning single variable : frog_y
	lda frog_old_y
	; Calling storevariable
	sta frog_y
	; LineNumber: 528
	jmp check_collisions_caseend212
check_collisions_casenext223
	lda next_tile
	cmp #$f0 ;keep
	bne check_collisions_casenext225
	; LineNumber: 532
	; LineNumber: 533
	
; // Truck!
	jsr kill_frog
	; LineNumber: 534
	jmp check_collisions_caseend212
check_collisions_casenext225
	lda next_tile
	cmp #$d7 ;keep
	bne check_collisions_casenext227
	; LineNumber: 537
	; LineNumber: 538
	jsr kill_frog
	; LineNumber: 539
	jmp check_collisions_caseend212
check_collisions_casenext227
	lda next_tile
	cmp #$ed ;keep
	bne check_collisions_casenext229
	; LineNumber: 542
	; LineNumber: 543
	jsr kill_frog
	; LineNumber: 545
	jmp check_collisions_caseend212
check_collisions_casenext229
	lda next_tile
	cmp #$ee ;keep
	bne check_collisions_casenext231
	; LineNumber: 547
	; LineNumber: 548
	jsr kill_frog
	; LineNumber: 550
	jmp check_collisions_caseend212
check_collisions_casenext231
	lda next_tile
	cmp #$fd ;keep
	bne check_collisions_casenext233
	; LineNumber: 553
	; LineNumber: 554
	jsr kill_frog
	; LineNumber: 556
	jmp check_collisions_caseend212
check_collisions_casenext233
	lda next_tile
	cmp #$c6 ;keep
	bne check_collisions_casenext235
	; LineNumber: 560
	; LineNumber: 561
	
; // Crock!
	jsr kill_frog
	; LineNumber: 563
	jmp check_collisions_caseend212
check_collisions_casenext235
	lda next_tile
	cmp #$a2 ;keep
	bne check_collisions_casenext237
	; LineNumber: 566
	; LineNumber: 567
	jsr kill_frog
	; LineNumber: 568
	jmp check_collisions_caseend212
check_collisions_casenext237
	lda next_tile
	cmp #$d6 ;keep
	bne check_collisions_casenext239
	; LineNumber: 573
	; LineNumber: 574
	
; // HOME
; // Occupied
	; Assigning single variable : frog_x
	lda frog_old_x
	; Calling storevariable
	sta frog_x
	; LineNumber: 575
	; Assigning single variable : frog_y
	lda frog_old_y
	; Calling storevariable
	sta frog_y
	; LineNumber: 576
	jmp check_collisions_caseend212
check_collisions_casenext239
	lda next_tile
	cmp #$d3 ;keep
	bne check_collisions_casenext241
	; LineNumber: 579
	; LineNumber: 580
	; Binary clause Simplified: NOTEQUALS
	lda frog_x
	; Compare with pure num / var optimization
	cmp frog_old_x;keep
	beq check_collisions_localfailed249
	jmp check_collisions_ConditionalTrueBlock244
check_collisions_localfailed249: ;keep
	; ; logical OR, second chance
	; Binary clause Simplified: NOTEQUALS
	lda frog_y
	; Compare with pure num / var optimization
	cmp frog_old_y;keep
	beq check_collisions_elsedoneblock246
check_collisions_ConditionalTrueBlock244: ;Main true block ;keep 
	; LineNumber: 581
	; LineNumber: 582
	
; // Success
	; Assigning single variable : player_score
	ldy #0
	lda player_score
	clc
	adc #$64
	sta player_score+0
	; Optimization : A := A op 8 bit - var and bvar are the same - perform inc
	bcc check_collisions_WordAdd251
	inc player_score+1
check_collisions_WordAdd251
	; LineNumber: 583
	jsr ping
	; LineNumber: 584
	; Assigning single variable : frog_x
	lda #$14
	; Calling storevariable
	sta frog_x
	; LineNumber: 585
	; Assigning single variable : frog_y
	lda #$18
	; Calling storevariable
	sta frog_y
	; LineNumber: 586
	; Assigning single variable : frog_old_x
	lda frog_x
	; Calling storevariable
	sta frog_old_x
	; LineNumber: 587
	; Assigning single variable : frog_old_y
	lda frog_y
	; Calling storevariable
	sta frog_old_y
	; LineNumber: 588
check_collisions_elsedoneblock246
	; LineNumber: 589
	jmp check_collisions_caseend212
check_collisions_casenext241
	; LineNumber: 593
	; LineNumber: 595
	; Binary clause Simplified: NOTEQUALS
	lda KEYPRESS
	; Compare with pure num / var optimization
	cmp #$ff;keep
	beq check_collisions_elsedoneblock256
check_collisions_ConditionalTrueBlock254: ;Main true block ;keep 
	; LineNumber: 596
	; LineNumber: 597
	
; // None of the cases were valid so go ahead
	inc player_score
	bne check_collisions_incdec260
	inc player_score +1
check_collisions_incdec260
	; LineNumber: 598
check_collisions_elsedoneblock256
	; LineNumber: 599
check_collisions_caseend212
	; LineNumber: 600
	rts
	; === main logic ============================================================================================ 
	; NodeProcedureDecl -1
	; ***********  Defining procedure : game_loop
	;    Procedure type : User-defined procedure
	; LineNumber: 610
game_loop
	; LineNumber: 613
game_loop_while262
	; Binary clause Simplified: EQUALS
	lda ALIVE
	; Compare with pure num / var optimization
	cmp #$1;keep
	bne game_loop_localfailed377
game_loop_localsuccess378: ;keep
	; ; logical AND, second requirement
	; Binary clause Simplified: EQUALS
	lda WON_GAME
	; Compare with pure num / var optimization
	cmp #$0;keep
	bne game_loop_localfailed377
	jmp game_loop_ConditionalTrueBlock263
game_loop_localfailed377
	jmp game_loop_elsedoneblock265
game_loop_ConditionalTrueBlock263: ;Main true block ;keep 
	; LineNumber: 614
	; LineNumber: 615
	; Assigning single variable : frog_old_x
	lda frog_x
	; Calling storevariable
	sta frog_old_x
	; LineNumber: 616
	; Assigning single variable : frog_old_y
	lda frog_y
	; Calling storevariable
	sta frog_old_y
	; LineNumber: 617
	; Assigning single variable : KEYPRESS
	jsr getkey
	; Calling storevariable
	sta KEYPRESS
	; LineNumber: 622
	; Binary clause Simplified: EQUALS
	; Compare with pure num / var optimization
	cmp #$b8;keep
	bne game_loop_elsedoneblock383
game_loop_ConditionalTrueBlock381: ;Main true block ;keep 
	; LineNumber: 623
	; LineNumber: 624
	; Binary clause Simplified: GREATEREQUAL
	lda frog_y
	; Compare with pure num / var optimization
	cmp #$2;keep
	bcc game_loop_elsedoneblock397
game_loop_ConditionalTrueBlock395: ;Main true block ;keep 
	; LineNumber: 625
	; LineNumber: 626
	
; // Uncomment to show key that was pressed
; // textat(30,20, #KEYPRESS,1);
	dec frog_y
	; LineNumber: 627
game_loop_elsedoneblock397
	; LineNumber: 628
game_loop_elsedoneblock383
	; LineNumber: 630
	; Binary clause Simplified: EQUALS
	lda KEYPRESS
	; Compare with pure num / var optimization
	cmp #$b6;keep
	bne game_loop_elsedoneblock405
game_loop_ConditionalTrueBlock403: ;Main true block ;keep 
	; LineNumber: 631
	; LineNumber: 632
	; Binary clause Simplified: LESS
	lda frog_x
	; Compare with pure num / var optimization
	cmp #$27;keep
	bcs game_loop_elsedoneblock419
game_loop_ConditionalTrueBlock417: ;Main true block ;keep 
	; LineNumber: 633
	; LineNumber: 634
	inc frog_x
	; LineNumber: 635
game_loop_elsedoneblock419
	; LineNumber: 636
game_loop_elsedoneblock405
	; LineNumber: 638
	; Binary clause Simplified: EQUALS
	lda KEYPRESS
	; Compare with pure num / var optimization
	cmp #$b2;keep
	bne game_loop_localfailed437
	jmp game_loop_ConditionalTrueBlock425
game_loop_localfailed437: ;keep
	; ; logical OR, second chance
	; Binary clause Simplified: EQUALS
	lda KEYPRESS
	; Compare with pure num / var optimization
	cmp #$b5;keep
	bne game_loop_elsedoneblock427
game_loop_ConditionalTrueBlock425: ;Main true block ;keep 
	; LineNumber: 639
	; LineNumber: 640
	; Binary clause Simplified: LESS
	lda frog_y
	; Compare with pure num / var optimization
	cmp #$18;keep
	bcs game_loop_elsedoneblock442
game_loop_ConditionalTrueBlock440: ;Main true block ;keep 
	; LineNumber: 641
	; LineNumber: 642
	inc frog_y
	; LineNumber: 643
game_loop_elsedoneblock442
	; LineNumber: 644
game_loop_elsedoneblock427
	; LineNumber: 646
	; Binary clause Simplified: EQUALS
	lda KEYPRESS
	; Compare with pure num / var optimization
	cmp #$b4;keep
	bne game_loop_elsedoneblock450
game_loop_ConditionalTrueBlock448: ;Main true block ;keep 
	; LineNumber: 647
	; LineNumber: 648
	; Binary clause Simplified: GREATEREQUAL
	lda frog_x
	; Compare with pure num / var optimization
	cmp #$1;keep
	bcc game_loop_elsedoneblock464
game_loop_ConditionalTrueBlock462: ;Main true block ;keep 
	; LineNumber: 649
	; LineNumber: 650
	dec frog_x
	; LineNumber: 651
game_loop_elsedoneblock464
	; LineNumber: 652
game_loop_elsedoneblock450
	; LineNumber: 655
	
; // Show the obstacles in new positions
	jsr show_obstacles
	; LineNumber: 658
	
; // "Collision detection"
	jsr check_collisions
	; LineNumber: 661
	; Binary clause Simplified: LESS
	lda player_lives
	; Compare with pure num / var optimization
	cmp #$1;keep
	bcs game_loop_elsedoneblock472
game_loop_ConditionalTrueBlock470: ;Main true block ;keep 
	; LineNumber: 662
	; LineNumber: 664
	
; // Still alive?
; // Dead and didn't win :(
	; Assigning single variable : ALIVE
	lda #$0
	; Calling storevariable
	sta ALIVE
	; LineNumber: 666
game_loop_elsedoneblock472
	; LineNumber: 671
	; Binary clause Simplified: NOTEQUALS
	lda frog_x
	; Compare with pure num / var optimization
	cmp frog_old_x;keep
	beq game_loop_localfailed480
	jmp game_loop_ConditionalTrueBlock476
game_loop_localfailed480: ;keep
	; ; logical OR, second chance
	; Binary clause Simplified: NOTEQUALS
	lda frog_y
	; Compare with pure num / var optimization
	cmp frog_old_y;keep
	beq game_loop_elsedoneblock478
game_loop_ConditionalTrueBlock476: ;Main true block ;keep 
	; LineNumber: 672
	; LineNumber: 673
	
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
	; LineNumber: 674
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
	; LineNumber: 675
game_loop_elsedoneblock478
	; LineNumber: 678
	; Binary clause Simplified: GREATEREQUAL
	lda frog_y
	; Compare with pure num / var optimization
	cmp #$b;keep
	bcc game_loop_elseblock484
game_loop_ConditionalTrueBlock483: ;Main true block ;keep 
	; LineNumber: 679
	; LineNumber: 680
	
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
	; LineNumber: 682
	jmp game_loop_elsedoneblock485
game_loop_elseblock484
	; LineNumber: 683
	; LineNumber: 684
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
	; LineNumber: 685
game_loop_elsedoneblock485
	; LineNumber: 690
	
; // Score and lives
	; Assigning single variable : num_x
	lda #$9
	; Calling storevariable
	sta num_x
	; Assigning single variable : num_y
	lda #$0
	; Calling storevariable
	sta num_y
	; Assigning single variable : num
	; integer assignment NodeVar
	ldy player_score+1 ; Next one
	lda player_score
	; Calling storevariable
	sta num
	sty num+1
	; Assigning single variable : num_len
	lda #$3
	; Calling storevariable
	sta num_len
	jsr numberat
	; LineNumber: 691
	; Assigning single variable : num_x
	lda #$24
	; Calling storevariable
	sta num_x
	; Assigning single variable : num_y
	lda #$0
	; Calling storevariable
	sta num_y
	; Assigning single variable : num
	ldy #0
	lda player_lives
	; Calling storevariable
	sta num
	sty num+1
	; Assigning single variable : num_len
	lda #$1
	; Calling storevariable
	sta num_len
	jsr numberat
	; LineNumber: 694
	
; // Crappy delay
	jsr shit_delay
	; LineNumber: 695
	jmp game_loop_while262
game_loop_elsedoneblock265
	; LineNumber: 697
	rts
block1
	; LineNumber: 699
	; LineNumber: 702
MainProgram_while490
	; Binary clause Simplified: NOTEQUALS
	lda #$1
	; Compare with pure num / var optimization
	cmp #$0;keep
	beq MainProgram_elsedoneblock493
MainProgram_ConditionalTrueBlock491: ;Main true block ;keep 
	; LineNumber: 703
	; LineNumber: 704
	jsr title_screen
	; LineNumber: 705
	jsr init_vars
	; LineNumber: 706
	jsr game_loop
	; LineNumber: 707
	jsr score_screen
	; LineNumber: 708
	jmp MainProgram_while490
MainProgram_elsedoneblock493
	; LineNumber: 712
	; End of program
	; Ending memory block
EndBlock410
