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
	; LineNumber: 682
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
petscii_pointer	= $04
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
szp	= $08
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
getat_rightvarInteger_var13 = $56
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
zp	= $08
	; LineNumber: 239
x	dc.b	0
	; LineNumber: 239
y	dc.b	0
	; LineNumber: 239
this_str	= $16
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
textat_rightvarInteger_var20 = $56
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
num_p	= $08
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
numberat_rightvarInteger_var55 = $56
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
	lda #$64
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
	jsr PlayNote
	; LineNumber: 292
	; Assigning memory location
	; Assigning single variable : $e84b
	lda #$0
	; Calling storevariable
	sta $e84b
	; LineNumber: 293
	rts
	
; // =========================================
	; NodeProcedureDecl -1
	; ***********  Defining procedure : title_screen
	;    Procedure type : User-defined procedure
	; LineNumber: 298
title_screen
	; LineNumber: 301
	
; // Set up pointer to array:
	; Assigning single variable : title_screen_frog_pointer
	lda #<title_screen_frog
	ldx #>title_screen_frog
	sta title_screen_frog_pointer
	stx title_screen_frog_pointer+1
	; LineNumber: 303
	jsr cls
	; LineNumber: 306
	
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
title_screen_outer66
	ldy #0
title_screen_inner67
	lda ($4c),y
	sta ($4e),y
	dey
	bne title_screen_inner67
	inc $4c+1
	inc $4e+1
	dex
	bne title_screen_outer66
	ldy #0
title_screen_final68
	lda ($4c),y
	sta ($4e),y
	iny
	cpy #232
	bne title_screen_final68
	; LineNumber: 307
	; memcpyfast
	ldx #12
title_screen_memcpy69
	lda logo+ $00,x
	sta $8000,x
	dex
	bpl title_screen_memcpy69
	; LineNumber: 308
	; memcpyfast
	ldx #12
title_screen_memcpy70
	lda logo+ $0d,x
	sta $8028,x
	dex
	bpl title_screen_memcpy70
	; LineNumber: 309
	; memcpyfast
	ldx #12
title_screen_memcpy71
	lda logo+ $1a,x
	sta $8050,x
	dex
	bpl title_screen_memcpy71
	; LineNumber: 310
	; memcpyfast
	ldx #12
title_screen_memcpy72
	lda logo+ $27,x
	sta $8078,x
	dex
	bpl title_screen_memcpy72
	; LineNumber: 314
title_screen_while73
	; Binary clause Simplified: NOTEQUALS
	jsr getkey
	; Compare with pure num / var optimization
	cmp #$20;keep
	beq title_screen_elsedoneblock76
title_screen_ConditionalTrueBlock74: ;Main true block ;keep 
	; LineNumber: 315
	; LineNumber: 316
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
	; LineNumber: 317
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
	; LineNumber: 318
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
	; LineNumber: 319
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
	; LineNumber: 320
	jmp title_screen_while73
title_screen_elsedoneblock76
	; LineNumber: 322
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : score_screen
	;    Procedure type : User-defined procedure
	; LineNumber: 325
score_screen
	; LineNumber: 326
	jsr cls
	; LineNumber: 327
score_screen_while80
	; Binary clause Simplified: NOTEQUALS
	jsr getkey
	; Compare with pure num / var optimization
	cmp #$20;keep
	beq score_screen_localfailed89
	jmp score_screen_ConditionalTrueBlock81
score_screen_localfailed89
	jmp score_screen_elsedoneblock83
score_screen_ConditionalTrueBlock81: ;Main true block ;keep 
	; LineNumber: 328
	; LineNumber: 329
	; memcpyfast
	ldx #12
score_screen_memcpy91
	lda logo+ $00,x
	sta $8000,x
	dex
	bpl score_screen_memcpy91
	; LineNumber: 330
	; memcpyfast
	ldx #12
score_screen_memcpy92
	lda logo+ $0d,x
	sta $8028,x
	dex
	bpl score_screen_memcpy92
	; LineNumber: 331
	; memcpyfast
	ldx #12
score_screen_memcpy93
	lda logo+ $1a,x
	sta $8050,x
	dex
	bpl score_screen_memcpy93
	; LineNumber: 332
	; memcpyfast
	ldx #12
score_screen_memcpy94
	lda logo+ $27,x
	sta $8078,x
	dex
	bpl score_screen_memcpy94
	; LineNumber: 335
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
	; LineNumber: 336
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
	; LineNumber: 337
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
	; LineNumber: 338
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
	; LineNumber: 339
	jmp score_screen_while80
score_screen_elsedoneblock83
	; LineNumber: 341
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : sprite_xy
	;    Procedure type : User-defined procedure
	; LineNumber: 347
	; LineNumber: 345
spr_p	= $08
	; LineNumber: 343
spr_x	dc.b	0
	; LineNumber: 343
spr_y	dc.b	0
	; LineNumber: 343
source_str	= $16
	; LineNumber: 343
spr_len	dc.b	0
sprite_xy_block95
sprite_xy
	; LineNumber: 348
	; Assigning single variable : spr_p
	; Generic 16 bit op
	ldy #0
	lda spr_x
sprite_xy_rightvarInteger_var98 = $54
	sta sprite_xy_rightvarInteger_var98
	sty sprite_xy_rightvarInteger_var98+1
	; Generic 16 bit op
	lda #<level_strips
	ldy #>level_strips
sprite_xy_rightvarInteger_var101 = $56
	sta sprite_xy_rightvarInteger_var101
	sty sprite_xy_rightvarInteger_var101+1
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
	adc sprite_xy_rightvarInteger_var101
sprite_xy_wordAdd99
	sta sprite_xy_rightvarInteger_var101
	; High-bit binop
	tya
	adc sprite_xy_rightvarInteger_var101+1
	tay
	lda sprite_xy_rightvarInteger_var101
	; Low bit binop:
	clc
	adc sprite_xy_rightvarInteger_var98
sprite_xy_wordAdd96
	sta sprite_xy_rightvarInteger_var98
	; High-bit binop
	tya
	adc sprite_xy_rightvarInteger_var98+1
	tay
	lda sprite_xy_rightvarInteger_var98
	sta spr_p
	sty spr_p+1
	; LineNumber: 348
	; memcpyfast
	ldy spr_len
	dey
sprite_xy_memcpy102
	lda (source_str),y
	sta (spr_p),y
	dey
	bpl sprite_xy_memcpy102
	; LineNumber: 350
	; Assigning single variable : spr_p
	; Generic 16 bit op
	ldy #0
	lda #$28
sprite_xy_rightvarInteger_var105 = $54
	sta sprite_xy_rightvarInteger_var105
	sty sprite_xy_rightvarInteger_var105+1
	; Generic 16 bit op
	ldy #0
	lda spr_x
sprite_xy_rightvarInteger_var108 = $56
	sta sprite_xy_rightvarInteger_var108
	sty sprite_xy_rightvarInteger_var108+1
	; Generic 16 bit op
	lda #<level_strips
	ldy #>level_strips
sprite_xy_rightvarInteger_var111 = $58
	sta sprite_xy_rightvarInteger_var111
	sty sprite_xy_rightvarInteger_var111+1
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
	adc sprite_xy_rightvarInteger_var111
sprite_xy_wordAdd109
	sta sprite_xy_rightvarInteger_var111
	; High-bit binop
	tya
	adc sprite_xy_rightvarInteger_var111+1
	tay
	lda sprite_xy_rightvarInteger_var111
	; Low bit binop:
	clc
	adc sprite_xy_rightvarInteger_var108
sprite_xy_wordAdd106
	sta sprite_xy_rightvarInteger_var108
	; High-bit binop
	tya
	adc sprite_xy_rightvarInteger_var108+1
	tay
	lda sprite_xy_rightvarInteger_var108
	; Low bit binop:
	clc
	adc sprite_xy_rightvarInteger_var105
sprite_xy_wordAdd103
	sta sprite_xy_rightvarInteger_var105
	; High-bit binop
	tya
	adc sprite_xy_rightvarInteger_var105+1
	tay
	lda sprite_xy_rightvarInteger_var105
	sta spr_p
	sty spr_p+1
	; LineNumber: 350
	; memcpyfast
	ldy spr_len
	dey
sprite_xy_memcpy112
	lda (source_str),y
	sta (spr_p),y
	dey
	bpl sprite_xy_memcpy112
	; LineNumber: 352
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : init_vars
	;    Procedure type : User-defined procedure
	; LineNumber: 359
	; LineNumber: 356
this_row	= $08
	; LineNumber: 356
target_strip	= $16
	; LineNumber: 357
iteration	dc.b	0
	; LineNumber: 358
homeplate	dc.b	$d3
init_vars_block113
init_vars
	; LineNumber: 360
	jsr cls
	; LineNumber: 363
	
; // Init the playfield
	; Assigning single variable : screenmemory
	lda #$00
	ldx #$80
	sta screenmemory
	stx screenmemory+1
	; LineNumber: 364
	; Assigning single variable : petscii_pointer
	lda #<level2
	ldx #>level2
	sta petscii_pointer
	stx petscii_pointer+1
	; LineNumber: 365
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
init_vars_outer114
	ldy #0
init_vars_inner115
	lda ($4c),y
	sta ($4e),y
	dey
	bne init_vars_inner115
	inc $4c+1
	inc $4e+1
	dex
	bne init_vars_outer114
	ldy #0
init_vars_final116
	lda ($4c),y
	sta ($4e),y
	iny
	cpy #232
	bne init_vars_final116
	; LineNumber: 366
	; Assigning single variable : this_row
	lda petscii_pointer
	ldx petscii_pointer+1
	sta this_row
	stx this_row+1
	; LineNumber: 367
	; Assigning single variable : target_strip
	lda #<level_strips
	ldx #>level_strips
	sta target_strip
	stx target_strip+1
	; LineNumber: 381
	; Assigning single variable : iteration
	lda #$1
	; Calling storevariable
	sta iteration
init_vars_forloop117
	; LineNumber: 371
	; LineNumber: 373
	
; // Obstacle Blanks
; // Copy the source twice
	; memcpyfast
	ldy #39
init_vars_memcpy127
	lda (this_row),y
	sta (target_strip),y
	dey
	bpl init_vars_memcpy127
	; LineNumber: 374
	; Assigning single variable : target_strip
	lda target_strip
	clc
	adc #$28
	sta target_strip+0
	; Optimization : A := A op 8 bit - var and bvar are the same - perform inc
	bcc init_vars_WordAdd128
	inc target_strip+1
init_vars_WordAdd128
	; LineNumber: 375
	; memcpyfast
	ldy #39
init_vars_memcpy129
	lda (this_row),y
	sta (target_strip),y
	dey
	bpl init_vars_memcpy129
	; LineNumber: 376
	; Assigning single variable : target_strip
	lda target_strip
	clc
	adc #$28
	sta target_strip+0
	; Optimization : A := A op 8 bit - var and bvar are the same - perform inc
	bcc init_vars_WordAdd130
	inc target_strip+1
init_vars_WordAdd130
	; LineNumber: 379
	
; // Next row
	; Assigning single variable : this_row
	lda this_row
	clc
	adc #$28
	sta this_row+0
	; Optimization : A := A op 8 bit - var and bvar are the same - perform inc
	bcc init_vars_WordAdd131
	inc this_row+1
init_vars_WordAdd131
	; LineNumber: 380
init_vars_forloopcounter119
	; Compare is onpage
	inc iteration
	lda #$19
	cmp iteration ;keep
	bcs init_vars_forloop117
init_vars_loopdone132: ;keep
init_vars_forloopend118
	; LineNumber: 383
	
; // Init the "sprites"
	; memcpy
	ldx #0
init_vars_memcpy133
	lda arr_crockr+ $00,x
	sta str_crockr,x
	inx
	cpx #$9
	bne init_vars_memcpy133
	; LineNumber: 384
	; memcpy
	ldx #0
init_vars_memcpy134
	lda arr_crockl+ $00,x
	sta str_crockl,x
	inx
	cpx #$9
	bne init_vars_memcpy134
	; LineNumber: 385
	; memcpy
	ldx #0
init_vars_memcpy135
	lda arr_logl+ $00,x
	sta str_logl,x
	inx
	cpx #$5
	bne init_vars_memcpy135
	; LineNumber: 386
	; memcpy
	ldx #0
init_vars_memcpy136
	lda arr_logr+ $00,x
	sta str_logr,x
	inx
	cpx #$5
	bne init_vars_memcpy136
	; LineNumber: 387
	; memcpy
	ldx #0
init_vars_memcpy137
	lda arr_truckt_r+ $00,x
	sta str_truckt_r,x
	inx
	cpx #$8
	bne init_vars_memcpy137
	; LineNumber: 388
	; memcpy
	ldx #0
init_vars_memcpy138
	lda arr_truckb_r+ $00,x
	sta str_truckb_r,x
	inx
	cpx #$8
	bne init_vars_memcpy138
	; LineNumber: 389
	; memcpy
	ldx #0
init_vars_memcpy139
	lda arr_carl+ $00,x
	sta str_cart,x
	inx
	cpx #$4
	bne init_vars_memcpy139
	; LineNumber: 390
	; memcpy
	ldx #0
init_vars_memcpy140
	lda arr_carr+ $00,x
	sta str_carb,x
	inx
	cpx #$4
	bne init_vars_memcpy140
	; LineNumber: 394
	
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
	; LineNumber: 395
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
	; LineNumber: 396
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
	; LineNumber: 397
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
	; LineNumber: 398
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
	; LineNumber: 399
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
	; LineNumber: 400
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
	; LineNumber: 401
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
	; LineNumber: 402
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
	; LineNumber: 403
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
	; LineNumber: 404
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
	; LineNumber: 405
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
	; LineNumber: 408
	; Assigning single variable : frog_x
	lda #$14
	; Calling storevariable
	sta frog_x
	; LineNumber: 409
	; Assigning single variable : frog_y
	lda #$18
	; Calling storevariable
	sta frog_y
	; LineNumber: 411
	; Assigning single variable : KEYPRESS
	lda #$0
	; Calling storevariable
	sta KEYPRESS
	; LineNumber: 412
	; Assigning single variable : ALIVE
	lda #$1
	; Calling storevariable
	sta ALIVE
	; LineNumber: 413
	; Assigning single variable : WON_GAME
	lda #$0
	; Calling storevariable
	sta WON_GAME
	; LineNumber: 415
	; Assigning single variable : player_lives
	lda #$3
	; Calling storevariable
	sta player_lives
	; LineNumber: 416
	; Assigning single variable : player_score
	ldy #0
	lda #$0
	; Calling storevariable
	sta player_score
	sty player_score+1
	; LineNumber: 419
	
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
	; LineNumber: 420
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
	; LineNumber: 421
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
	; LineNumber: 422
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
	; LineNumber: 423
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
	; LineNumber: 424
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
	; LineNumber: 425
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : shit_delay
	;    Procedure type : User-defined procedure
	; LineNumber: 430
	; LineNumber: 429
temp_delay	dc.b	0
shit_delay_block141
shit_delay
	; LineNumber: 436
	; Assigning single variable : temp_delay
	lda #$1
	; Calling storevariable
	sta temp_delay
shit_delay_forloop142
	; LineNumber: 432
	; LineNumber: 433
shit_delay_while153
	; Binary clause Simplified: EQUALS
	lda ti
	; Compare with pure num / var optimization
	cmp oldti;keep
	bne shit_delay_elsedoneblock156
shit_delay_ConditionalTrueBlock154: ;Main true block ;keep 
	; LineNumber: 432
	; LineNumber: 433
	jmp shit_delay_while153
shit_delay_elsedoneblock156
	; LineNumber: 434
	; Assigning single variable : oldti
	lda ti
	; Calling storevariable
	sta oldti
	; LineNumber: 435
shit_delay_forloopcounter144
	; Compare is onpage
	inc temp_delay
	lda #$3
	cmp temp_delay ;keep
	bcs shit_delay_forloop142
shit_delay_loopdone159: ;keep
shit_delay_forloopend143
	; LineNumber: 436
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : show_obstacles
	;    Procedure type : User-defined procedure
	; LineNumber: 443
	; LineNumber: 441
strip_num	dc.b	0
	; LineNumber: 441
this_strip	dc.b	0
	; LineNumber: 442
this_source_offset	= $08
show_obstacles_block160
show_obstacles
	; LineNumber: 447
	
; // TRSE way of incrementing 
; // counter with loop back to 0
	inc obstacles_x_rl
	lda obstacles_x_rl
	cmp #$27 ; keep
	bne show_obstacles_incmax162
	lda #$0
	sta obstacles_x_rl
show_obstacles_incmax162
	; LineNumber: 448
	; Assigning single variable : obstacles_x_lr
	; 8 bit binop
	; Add/sub where right value is constant number
	lda #$28
	sec
	sbc obstacles_x_rl
	 ; end add / sub var with constant
	; Calling storevariable
	sta obstacles_x_lr
	; LineNumber: 468
	; Assigning single variable : strip_num
	lda #$0
	; Calling storevariable
	sta strip_num
show_obstacles_forloop163
	; LineNumber: 451
	; LineNumber: 452
	; Assigning single variable : this_strip
	; Load Byte array
	ldx strip_num
	lda obstacles_y,x
	; Calling storevariable
	sta this_strip
	; LineNumber: 453
	; Assigning single variable : screenmemory
	; Generic 16 bit op
	; Integer constant assigning
	ldy #$80
	lda #$00
show_obstacles_rightvarInteger_var189 = $54
	sta show_obstacles_rightvarInteger_var189
	sty show_obstacles_rightvarInteger_var189+1
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
	adc show_obstacles_rightvarInteger_var189
show_obstacles_wordAdd187
	sta show_obstacles_rightvarInteger_var189
	; High-bit binop
	tya
	adc show_obstacles_rightvarInteger_var189+1
	tay
	lda show_obstacles_rightvarInteger_var189
	sta screenmemory
	sty screenmemory+1
	; LineNumber: 455
	; Assigning single variable : this_source_offset
	; Generic 16 bit op
	lda #<level_strips
	ldy #>level_strips
show_obstacles_rightvarInteger_var192 = $54
	sta show_obstacles_rightvarInteger_var192
	sty show_obstacles_rightvarInteger_var192+1
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
	adc show_obstacles_rightvarInteger_var192
show_obstacles_wordAdd190
	sta show_obstacles_rightvarInteger_var192
	; High-bit binop
	tya
	adc show_obstacles_rightvarInteger_var192+1
	tay
	lda show_obstacles_rightvarInteger_var192
	sta this_source_offset
	sty this_source_offset+1
	; LineNumber: 457
	; Binary clause Simplified: EQUALS
	; Load Byte array
	ldx strip_num
	lda strip_direction,x
	; Compare with pure num / var optimization
	cmp #$1;keep
	bne show_obstacles_elseblock195
show_obstacles_ConditionalTrueBlock194: ;Main true block ;keep 
	; LineNumber: 458
	; LineNumber: 459
	; Assigning single variable : this_source_offset
	lda this_source_offset
	clc
	adc obstacles_x_rl
	sta this_source_offset+0
	; Optimization : A := A op 8 bit - var and bvar are the same - perform inc
	bcc show_obstacles_WordAdd202
	inc this_source_offset+1
show_obstacles_WordAdd202
	; LineNumber: 461
	jmp show_obstacles_elsedoneblock196
show_obstacles_elseblock195
	; LineNumber: 462
	; LineNumber: 463
	; Assigning single variable : this_source_offset
	lda this_source_offset
	clc
	adc obstacles_x_lr
	sta this_source_offset+0
	; Optimization : A := A op 8 bit - var and bvar are the same - perform inc
	bcc show_obstacles_WordAdd204
	inc this_source_offset+1
show_obstacles_WordAdd204
	; LineNumber: 464
show_obstacles_elsedoneblock196
	; LineNumber: 465
	; memcpyfast
	ldy #39
show_obstacles_memcpy205
	lda (this_source_offset),y
	sta (screenmemory),y
	dey
	bpl show_obstacles_memcpy205
	; LineNumber: 467
show_obstacles_forloopcounter165
	inc strip_num
	lda #$c
	cmp strip_num ;keep
	beq show_obstacles_loopdone206
show_obstacles_loopnotdone207
	jmp show_obstacles_forloop163
show_obstacles_loopdone206
show_obstacles_forloopend164
	; LineNumber: 470
	
; // RESET SCREEN MEMORY
	; Assigning single variable : screenmemory
	lda #$00
	ldx #$80
	sta screenmemory
	stx screenmemory+1
	; LineNumber: 472
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : kill_frog
	;    Procedure type : User-defined procedure
	; LineNumber: 475
kill_frog
	; LineNumber: 477
	; Assigning single variable : frog_x
	lda #$14
	; Calling storevariable
	sta frog_x
	; LineNumber: 478
	; Assigning single variable : frog_y
	lda #$18
	; Calling storevariable
	sta frog_y
	; LineNumber: 479
	; Assigning single variable : frog_old_x
	lda frog_x
	; Calling storevariable
	sta frog_old_x
	; LineNumber: 480
	; Assigning single variable : frog_old_y
	lda frog_y
	; Calling storevariable
	sta frog_old_y
	; LineNumber: 481
	jsr burp
	; LineNumber: 482
	dec player_lives
	; LineNumber: 483
	rts
	; NodeProcedureDecl -1
	; ***********  Defining procedure : check_collisions
	;    Procedure type : User-defined procedure
	; LineNumber: 488
	; LineNumber: 487
next_tile	dc.b	0
check_collisions_block210
check_collisions
	; LineNumber: 490
	
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
	; LineNumber: 496
	cmp #$66 ;keep
	bne check_collisions_casenext212
	; LineNumber: 499
	; LineNumber: 500
	; Binary clause Simplified: LESS
	lda frog_y
	; Compare with pure num / var optimization
	cmp #$18;keep
	bcs check_collisions_elsedoneblock217
check_collisions_ConditionalTrueBlock215: ;Main true block ;keep 
	; LineNumber: 501
	; LineNumber: 502
	
; // There is no function to search a string
; // or check an array, or return array size,
; // so we need to check each character individually
; // Scenery
	; Assigning single variable : frog_x
	lda frog_old_x
	; Calling storevariable
	sta frog_x
	; LineNumber: 503
	; Assigning single variable : frog_y
	lda frog_old_y
	; Calling storevariable
	sta frog_y
	; LineNumber: 504
check_collisions_elsedoneblock217
	; LineNumber: 505
	jmp check_collisions_caseend211
check_collisions_casenext212
	lda next_tile
	cmp #$68 ;keep
	bne check_collisions_casenext220
	; LineNumber: 508
	; LineNumber: 509
	; Assigning single variable : frog_x
	lda frog_old_x
	; Calling storevariable
	sta frog_x
	; LineNumber: 510
	; Assigning single variable : frog_y
	lda frog_old_y
	; Calling storevariable
	sta frog_y
	; LineNumber: 511
	jmp check_collisions_caseend211
check_collisions_casenext220
	lda next_tile
	cmp #$5c ;keep
	bne check_collisions_casenext222
	; LineNumber: 514
	; LineNumber: 515
	; Assigning single variable : frog_x
	lda frog_old_x
	; Calling storevariable
	sta frog_x
	; LineNumber: 516
	; Assigning single variable : frog_y
	lda frog_old_y
	; Calling storevariable
	sta frog_y
	; LineNumber: 517
	jmp check_collisions_caseend211
check_collisions_casenext222
	lda next_tile
	cmp #$f0 ;keep
	bne check_collisions_casenext224
	; LineNumber: 521
	; LineNumber: 522
	
; // Truck!
	jsr kill_frog
	; LineNumber: 523
	jmp check_collisions_caseend211
check_collisions_casenext224
	lda next_tile
	cmp #$ed ;keep
	bne check_collisions_casenext226
	; LineNumber: 526
	; LineNumber: 527
	jsr kill_frog
	; LineNumber: 529
	jmp check_collisions_caseend211
check_collisions_casenext226
	lda next_tile
	cmp #$ee ;keep
	bne check_collisions_casenext228
	; LineNumber: 531
	; LineNumber: 532
	jsr kill_frog
	; LineNumber: 534
	jmp check_collisions_caseend211
check_collisions_casenext228
	lda next_tile
	cmp #$fd ;keep
	bne check_collisions_casenext230
	; LineNumber: 537
	; LineNumber: 538
	jsr kill_frog
	; LineNumber: 540
	jmp check_collisions_caseend211
check_collisions_casenext230
	lda next_tile
	cmp #$c6 ;keep
	bne check_collisions_casenext232
	; LineNumber: 544
	; LineNumber: 545
	
; // Crock!
	jsr kill_frog
	; LineNumber: 547
	jmp check_collisions_caseend211
check_collisions_casenext232
	lda next_tile
	cmp #$a2 ;keep
	bne check_collisions_casenext234
	; LineNumber: 550
	; LineNumber: 551
	jsr kill_frog
	; LineNumber: 552
	jmp check_collisions_caseend211
check_collisions_casenext234
	lda next_tile
	cmp #$d6 ;keep
	bne check_collisions_casenext236
	; LineNumber: 557
	; LineNumber: 558
	
; // HOME
; // Occupied
	; Assigning single variable : frog_x
	lda frog_old_x
	; Calling storevariable
	sta frog_x
	; LineNumber: 559
	; Assigning single variable : frog_y
	lda frog_old_y
	; Calling storevariable
	sta frog_y
	; LineNumber: 560
	jmp check_collisions_caseend211
check_collisions_casenext236
	lda next_tile
	cmp #$d3 ;keep
	bne check_collisions_casenext238
	; LineNumber: 563
	; LineNumber: 564
	; Binary clause Simplified: NOTEQUALS
	lda frog_x
	; Compare with pure num / var optimization
	cmp frog_old_x;keep
	beq check_collisions_localfailed246
	jmp check_collisions_ConditionalTrueBlock241
check_collisions_localfailed246: ;keep
	; ; logical OR, second chance
	; Binary clause Simplified: NOTEQUALS
	lda frog_y
	; Compare with pure num / var optimization
	cmp frog_old_y;keep
	beq check_collisions_elsedoneblock243
check_collisions_ConditionalTrueBlock241: ;Main true block ;keep 
	; LineNumber: 565
	; LineNumber: 566
	
; // Success
	; Assigning single variable : player_score
	ldy #0
	lda player_score
	clc
	adc #$64
	sta player_score+0
	; Optimization : A := A op 8 bit - var and bvar are the same - perform inc
	bcc check_collisions_WordAdd248
	inc player_score+1
check_collisions_WordAdd248
	; LineNumber: 567
	; Assigning single variable : frog_x
	lda #$14
	; Calling storevariable
	sta frog_x
	; LineNumber: 568
	; Assigning single variable : frog_y
	lda #$18
	; Calling storevariable
	sta frog_y
	; LineNumber: 569
	; Assigning single variable : frog_old_x
	lda frog_x
	; Calling storevariable
	sta frog_old_x
	; LineNumber: 570
	; Assigning single variable : frog_old_y
	lda frog_y
	; Calling storevariable
	sta frog_old_y
	; LineNumber: 571
check_collisions_elsedoneblock243
	; LineNumber: 572
	jmp check_collisions_caseend211
check_collisions_casenext238
	; LineNumber: 576
	; LineNumber: 578
	; Binary clause Simplified: NOTEQUALS
	lda KEYPRESS
	; Compare with pure num / var optimization
	cmp #$ff;keep
	beq check_collisions_elsedoneblock253
check_collisions_ConditionalTrueBlock251: ;Main true block ;keep 
	; LineNumber: 579
	; LineNumber: 580
	
; // None of the cases were valid so go ahead
	inc player_score
	bne check_collisions_incdec257
	inc player_score +1
check_collisions_incdec257
	; LineNumber: 581
check_collisions_elsedoneblock253
	; LineNumber: 582
check_collisions_caseend211
	; LineNumber: 583
	rts
	; === main logic ============================================================================================ 
	; NodeProcedureDecl -1
	; ***********  Defining procedure : game_loop
	;    Procedure type : User-defined procedure
	; LineNumber: 593
game_loop
	; LineNumber: 596
game_loop_while259
	; Binary clause Simplified: EQUALS
	lda ALIVE
	; Compare with pure num / var optimization
	cmp #$1;keep
	bne game_loop_localfailed374
game_loop_localsuccess375: ;keep
	; ; logical AND, second requirement
	; Binary clause Simplified: EQUALS
	lda WON_GAME
	; Compare with pure num / var optimization
	cmp #$0;keep
	bne game_loop_localfailed374
	jmp game_loop_ConditionalTrueBlock260
game_loop_localfailed374
	jmp game_loop_elsedoneblock262
game_loop_ConditionalTrueBlock260: ;Main true block ;keep 
	; LineNumber: 597
	; LineNumber: 598
	; Assigning single variable : frog_old_x
	lda frog_x
	; Calling storevariable
	sta frog_old_x
	; LineNumber: 599
	; Assigning single variable : frog_old_y
	lda frog_y
	; Calling storevariable
	sta frog_old_y
	; LineNumber: 600
	; Assigning single variable : KEYPRESS
	jsr getkey
	; Calling storevariable
	sta KEYPRESS
	; LineNumber: 605
	; Binary clause Simplified: EQUALS
	; Compare with pure num / var optimization
	cmp #$b8;keep
	bne game_loop_elsedoneblock380
game_loop_ConditionalTrueBlock378: ;Main true block ;keep 
	; LineNumber: 606
	; LineNumber: 607
	; Binary clause Simplified: GREATEREQUAL
	lda frog_y
	; Compare with pure num / var optimization
	cmp #$2;keep
	bcc game_loop_elsedoneblock394
game_loop_ConditionalTrueBlock392: ;Main true block ;keep 
	; LineNumber: 608
	; LineNumber: 609
	
; // Uncomment to show key that was pressed
; // textat(30,20, #KEYPRESS,1);
	dec frog_y
	; LineNumber: 610
game_loop_elsedoneblock394
	; LineNumber: 611
game_loop_elsedoneblock380
	; LineNumber: 613
	; Binary clause Simplified: EQUALS
	lda KEYPRESS
	; Compare with pure num / var optimization
	cmp #$b6;keep
	bne game_loop_elsedoneblock402
game_loop_ConditionalTrueBlock400: ;Main true block ;keep 
	; LineNumber: 614
	; LineNumber: 615
	; Binary clause Simplified: LESS
	lda frog_x
	; Compare with pure num / var optimization
	cmp #$27;keep
	bcs game_loop_elsedoneblock416
game_loop_ConditionalTrueBlock414: ;Main true block ;keep 
	; LineNumber: 616
	; LineNumber: 617
	inc frog_x
	; LineNumber: 618
game_loop_elsedoneblock416
	; LineNumber: 619
game_loop_elsedoneblock402
	; LineNumber: 621
	; Binary clause Simplified: EQUALS
	lda KEYPRESS
	; Compare with pure num / var optimization
	cmp #$b2;keep
	bne game_loop_localfailed434
	jmp game_loop_ConditionalTrueBlock422
game_loop_localfailed434: ;keep
	; ; logical OR, second chance
	; Binary clause Simplified: EQUALS
	lda KEYPRESS
	; Compare with pure num / var optimization
	cmp #$b5;keep
	bne game_loop_elsedoneblock424
game_loop_ConditionalTrueBlock422: ;Main true block ;keep 
	; LineNumber: 622
	; LineNumber: 623
	; Binary clause Simplified: LESS
	lda frog_y
	; Compare with pure num / var optimization
	cmp #$18;keep
	bcs game_loop_elsedoneblock439
game_loop_ConditionalTrueBlock437: ;Main true block ;keep 
	; LineNumber: 624
	; LineNumber: 625
	inc frog_y
	; LineNumber: 626
game_loop_elsedoneblock439
	; LineNumber: 627
game_loop_elsedoneblock424
	; LineNumber: 629
	; Binary clause Simplified: EQUALS
	lda KEYPRESS
	; Compare with pure num / var optimization
	cmp #$b4;keep
	bne game_loop_elsedoneblock447
game_loop_ConditionalTrueBlock445: ;Main true block ;keep 
	; LineNumber: 630
	; LineNumber: 631
	; Binary clause Simplified: GREATEREQUAL
	lda frog_x
	; Compare with pure num / var optimization
	cmp #$1;keep
	bcc game_loop_elsedoneblock461
game_loop_ConditionalTrueBlock459: ;Main true block ;keep 
	; LineNumber: 632
	; LineNumber: 633
	dec frog_x
	; LineNumber: 634
game_loop_elsedoneblock461
	; LineNumber: 635
game_loop_elsedoneblock447
	; LineNumber: 638
	
; // Show the obstacles in new positions
	jsr show_obstacles
	; LineNumber: 641
	
; // "Collision detection"
	jsr check_collisions
	; LineNumber: 644
	; Binary clause Simplified: LESS
	lda player_lives
	; Compare with pure num / var optimization
	cmp #$1;keep
	bcs game_loop_elsedoneblock469
game_loop_ConditionalTrueBlock467: ;Main true block ;keep 
	; LineNumber: 645
	; LineNumber: 647
	
; // Still alive?
; // Dead and didn't win :(
	; Assigning single variable : ALIVE
	lda #$0
	; Calling storevariable
	sta ALIVE
	; LineNumber: 649
game_loop_elsedoneblock469
	; LineNumber: 654
	; Binary clause Simplified: NOTEQUALS
	lda frog_x
	; Compare with pure num / var optimization
	cmp frog_old_x;keep
	beq game_loop_localfailed477
	jmp game_loop_ConditionalTrueBlock473
game_loop_localfailed477: ;keep
	; ; logical OR, second chance
	; Binary clause Simplified: NOTEQUALS
	lda frog_y
	; Compare with pure num / var optimization
	cmp frog_old_y;keep
	beq game_loop_elsedoneblock475
game_loop_ConditionalTrueBlock473: ;Main true block ;keep 
	; LineNumber: 655
	; LineNumber: 656
	
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
	; LineNumber: 657
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
	; LineNumber: 658
game_loop_elsedoneblock475
	; LineNumber: 661
	; Binary clause Simplified: GREATEREQUAL
	lda frog_y
	; Compare with pure num / var optimization
	cmp #$b;keep
	bcc game_loop_elseblock481
game_loop_ConditionalTrueBlock480: ;Main true block ;keep 
	; LineNumber: 662
	; LineNumber: 663
	
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
	; LineNumber: 665
	jmp game_loop_elsedoneblock482
game_loop_elseblock481
	; LineNumber: 666
	; LineNumber: 667
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
	; LineNumber: 668
game_loop_elsedoneblock482
	; LineNumber: 673
	
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
	; LineNumber: 674
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
	; LineNumber: 677
	
; // Crappy delay
	jsr shit_delay
	; LineNumber: 678
	jmp game_loop_while259
game_loop_elsedoneblock262
	; LineNumber: 680
	rts
block1
	; LineNumber: 682
	; LineNumber: 685
MainProgram_while487
	; Binary clause Simplified: NOTEQUALS
	lda #$1
	; Compare with pure num / var optimization
	cmp #$0;keep
	beq MainProgram_elsedoneblock490
MainProgram_ConditionalTrueBlock488: ;Main true block ;keep 
	; LineNumber: 686
	; LineNumber: 687
	jsr title_screen
	; LineNumber: 688
	jsr init_vars
	; LineNumber: 689
	jsr game_loop
	; LineNumber: 690
	jsr score_screen
	; LineNumber: 691
	jmp MainProgram_while487
MainProgram_elsedoneblock490
	; LineNumber: 695
	; End of program
	; Ending memory block
EndBlock410
