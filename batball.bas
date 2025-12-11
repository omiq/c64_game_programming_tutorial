CONST RASTER_LINE  = $d012
CONST W = 64770 ' scan code
CONST A = 64772 ' scan code
CONST S = 64800 ' scan code
CONST D = 64260 ' scan code
CONST ESC = 32640 ' scan code
DIM a$ AS STRING * 1
DIM x,y AS BYTE FAST
DIM ballx,bally AS BYTE FAST
DIM xdir,ydir AS INT FAST
DIM cx,cy AS BYTE

BACKGROUND 0
BORDER 0

PRINT CHR$(147)

SUB curpos(row AS BYTE, col AS BYTE) STATIC
  POKE 214, row: POKE 211, col: SYS 58732
END SUB

' Wall/HUD
FOR cy = 0 TO 24
  FOR cx = 30 TO 39
    TEXTAT cx, cy, CHR$(230), 5
  NEXT cx
NEXT cy

REM store sprite shapes in safe VIC-visible RAM
CONST SHAPES_START = $3000        : REM 12288

memcpy @ballsprite, SHAPES_START, 64
memcpy @batsprite,  SHAPES_START+64, 64



REM compiler multicolor flags
SPRITE MULTICOLOR 1, 1

REM multicolor settings from your editor
POKE $D025, 12        : REM multicolor #1
POKE $D026, 11        : REM multicolor #2
'POKE $D021, 6         : REM background color

SPRITE 0 COLOR 15 MULTI ON BACKGROUND
SPRITE 1 COLOR 15 MULTI ON BACKGROUND

REM hardware multicolor enable (sprites 0 and 1)
POKE $D01C, %00000011

POKE 650,128

call curpos(10,10)
PRINT "bat and ball demo"

REM set sprite pointers for $3000 and $3000+64
POKE 2040, SHAPES_START/64        : REM = 192
POKE 2041, (SHAPES_START+64)/64   : REM = 193

x=100
y=110
ballx=70
bally=70
xdir=-1
ydir=-1
SPRITE 1 ON AT x,y
SPRITE 0 ON AT 120,120
SPRITE CLEAR HIT

' Keyboard control and game loop
DO WHILE NOT KEY(ESC)

  IF KEY(A) THEN x=x-1
  IF KEY(D) THEN x=x+1
  IF KEY(W) THEN y=y-1
  IF KEY(S) THEN y=y+1

  WAIT 53265, 128
  SPRITE 1 AT x,y
  SPRITE 0 AT ballx,bally

  IF (bally - 10) = y AND (ballx + 10) = x THEN 
      ydir=-ydir
      
  ELSE
    IF ballx=240 THEN xdir=-xdir
    IF ballx=0 THEN xdir=-xdir
    IF bally=240 THEN ydir=-ydir
    IF bally=40 THEN ydir=-ydir
  END IF
  
  ballx=ballx+xdir
  bally=bally+ydir

LOOP
END


ballsprite:
DATA AS BYTE _
0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,21,0, _
0,85,64, 1,105,80, 1,169,80, 5,169,84, _
5,165,244, 5,85,244, 5,87,244, 1,87,208, _
1,223,80, 0,125,64, 0,21,0, _
0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0,0

batsprite:
DATA AS BYTE _
0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0,0, _
0,0,0, 0,0,0, _
5,85,80, _
26,170,164, _
105,85,91, _
101,85,87, _
85,85,87, _
101,221,223, _
87,119,127, _
63,255,252, _
15,255,240, _
0,0,0, 0,0,0, 0,0,0, 0,0,0, 0,0,0, _
0   : REM final padding byte so total = 64
