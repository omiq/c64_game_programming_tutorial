; Sprite routines
include "xcb-ext-sprite.bas"
CONST \RASTER_LINE  = $d012
CONST SHAPES_START = $2000

dim \_ball_x! fast
dim \_ball_y! fast
dim \_ball_xdir fast
dim \_ball_ydir fast
dim \x! fast
dim \y! fast

; add sprite data to sprite memory
data _ball_sprite![]= incbin "ball.bin"
data _bat_sprite![]= incbin "bat.bin"
memcpy  @_ball_sprite!,SHAPES_START,64
memcpy  @_bat_sprite!,SHAPES_START+64,64

; set up the sprite
call spr_setshape(0, SHAPES_START/64)
call spr_setshape(1, (SHAPES_START+64)/64)
call spr_setcolor(0, 4)
call spr_setcolor(1, 4)
call spr_setmulti(0)
call spr_setmulti(1)
spr_multicolor1! = $0c
spr_multicolor2! = $0f
call spr_overbg(0)
call spr_overbg(1)

rem -- Show the sprite
call spr_enable(0)
call spr_enable(1)

rem -- Set background color
poke $d021, 0

; set border
poke $D020,14  ;border

proc _init

  let \_ball_x! = 0
  let \_ball_y! = 0
  let \_ball_xdir = 1
  let \_ball_ydir = 1

  let \x! = 150
  let \y! = 200

  ; SPEED
  let \speed = 1

  ; LIVES
  let \lives = 3


  ; fast way to fill the color memory with color
  memset 55296, 1000, 11

  ; fast way to fill the screen memory with space
  memset 1024, 1000, 32

  ; right-border line
  for r = 0 to 24
    let _m = 24+ 1024 + (r*40)
    poke _m,66

  next r

  ; Score table
  textat 26,2,"lives:    "


  
endproc

; Waits for keypress
proc bounce_loop

  let key! = 0
  while key! <> 3 and \lives > 0 
  
     ; Wait virtical blank
    watch \RASTER_LINE, 250
    
    let key! = inkey!()
    
    if key! = 73 and \y! >= 42 then \y! = \y! - 8
    if key! = 74 and \x! >= 32 then \x! = \x! - 8
    if key! = 75 and \y! <= 220 then \y! = \y! + 8
    if key! = 76 and \x! <= 182 then \x! = \x! + 8
    
    ; At left or right border?
    if \_ball_x! = 200 then let \_ball_xdir = -1 * \speed
    if \_ball_x! = 20 then let \_ball_xdir = \speed 
   
    ; At bottom or top?
    if \_ball_y! = 240 then 
      let \_ball_ydir = -1 * \speed
      dec \lives
    endif
    
    if \_ball_y! = 44 then let \_ball_ydir = \speed

    
    ; Move sprite horizontal
    let \_ball_x! = \_ball_x! + \_ball_xdir
    
    ; Move sprite vertical
    let \_ball_y! = \_ball_y! + \_ball_ydir  

   
    ; Set sprite locations
    call spr_setpos(0, \_ball_x!, \_ball_y!)
    call spr_setpos(1, \x!, \y!)
    
      
    ; COLLISIONS??
    if spr_spr_collision!(0) = 1 and \_ball_ydir = (1 * \speed) then let \_ball_ydir = -1 * \speed
    
    textat 33,2, \lives
  
  endwhile
  
endproc  

while 1=1
  
  call _init
  call bounce_loop
  
endwhile

