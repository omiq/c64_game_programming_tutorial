; Waits for keypress
proc wait_key
    print "{REV_ON}press a key to continue{REV_OFF}"
loop:
  let key! = inkey!()
  if key! = 0 then goto loop

endproc  
  
; load defaults (but doesn't seem to work')
let DEF_A = peek!($d011) 
let DEF_B = peek!($d016) 
let DEF_C = peek!($dd00)
let DEF_D = peek!($d018)

; switch to bitmap mode 
rem -- Configure VIC to bank 0,
rem -- bitmap address at $2000
poke $dd00, peek!($dd00) | %00000011
poke $d018, peek!($d018) | %00001000

rem -- Enable multicolor bitmap mode
poke $d011, peek!($d011) | %00100000
poke $d016, peek!($d016) | %00010000

rem -- Set background color
poke $d021, peek!(@_pic!+10000+2)

;$6000 - $7F3F	Bitmap
;$7F40 - $8327	Screen RAM
;$8328 - $870F	Color RAM
;$8710	Background
memshift @_pic!+2, $6000, 10000

rem -- Set background color
poke $d021, peek!($8710)

rem -- Copy bitmap
memcpy $6000, $2000, 8000

rem -- Copy screen
memcpy $7f40, $0400, 1000

rem -- Copy colors
memcpy $8328, $d800, 1000

call wait_key

rem -- reset the screen
poke $d011, DEF_A
poke $d016, DEF_B
poke $dd00, DEF_C
poke $d018, DEF_D

print "{CLEAR}{DARK_GRAY}Done"
call wait_key
end



; rem the picture data
data _pic![] = incbin "christmas-night.koa"