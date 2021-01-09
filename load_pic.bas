; rem the picture data
data _pic![] = incbin "retro.koa"
  
; switch to bitmap mode 
rem -- Configure VIC to bank 0,
rem -- bitmap address at $2000
poke $dd00, peek!($dd00) | %00000011
poke $d018, peek!($d018) | %00001000

; set border to black
poke $D020,0  ;border

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

; Waits for keypress
proc wait_key
    ;print "{REV_ON}press a key to continue{REV_OFF}"
loop:
  let key! = inkey!()
  if key! = 0 then goto loop

endproc  

call wait_key

;==========================
; ^^^^ Bitmap vvv Text
;==========================


rem -- reset the screen
sys $FF81 : rem Initialize VIC, restore default input/output to keyboard/screen, clear screen, set PAL/NTSC switch and interrupt timer

poke $0286,1    ;text
poke $D020 ,14  ;border
poke $D021,14 ;changes the background color.
;sys $E544

curpos 0,0 
for i! = 0 to 255
  let _ths! = i!
  poke 1024+i!, _ths!
next i!


curpos 0, 12
print "this text will be upper case"
print "{DARK_GRAY}{REVERSE ON}grey{REVERSE OFF}"

charat 10,10,65
textat 10,16,"cool huh?"

rem -- set colors
memset $d800, 500, 0

call wait_key
end

