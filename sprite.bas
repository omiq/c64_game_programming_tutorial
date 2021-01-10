; Sprite routines
include "xcb-ext-sprite.bas"
CONST \RASTER_LINE  = $d012
CONST SHAPES_START = $2000

let \x! = 150
let \y! = 150
let \xdir = 1
let \ydir = 1

; add sprite data to sprite memory
data _sprite![]= incbin "sprite.bin"
memcpy  @_sprite!,SHAPES_START,64

; set up the sprite
call spr_setshape(0, SHAPES_START/64)
call spr_setdblheight(0)
call spr_setdblwidth(0)
call spr_setcolor(0, 4)
spr_multicolor1! = 1
spr_multicolor2! = 4
call spr_setmulti(0)
call spr_overbg(0)

rem -- Enable multicolor bitmap mode
rem poke $d011, peek!($d011) | %00100000
rem poke $d016, peek!($d016) | %00010000

rem -- Set background color
poke $d021, 0

; set border to black
poke $D020,0  ;border

; fast way to fill the screen memory with space
memset 1024, 1000, 32

; fast way to fill the color memory with color
memset 55296, 1000, 0

rem -- Show the sprite
call spr_enable(0)


; Waits for keypress
proc bounce_loop

loop:
  let key! = inkey!()
  
  ; Wait virtical blank
  for j! = 1 to 2
    watch \RASTER_LINE, 250
  next j!
  
  ; At left or right border?
  if \x! >= 160 and \xdir = 1 then
    let \xdir = -1
  endif  
  
  if \x! <= 10 and \xdir = -1 then 
    let \xdir = 1 
  endif  
  
  ; Move sprite horizontal
  let \x! = \x! + \xdir

  ; At bottom or top?
  if \y! >= 200 and \ydir = 1 then 
    let \ydir = -1
  endif  
  
  if \y! <= 10 and \ydir = -1 then 
    let \ydir = 1
  endif  
  
  ; Move sprite vertical
  let \y! = \y! + \ydir
  
  ; Set sprite locations
  call spr_setpos(0, \x!, \y!)
  
  ; Keep going until keypress
  if key! = 0 then goto loop

endproc  

call bounce_loop



