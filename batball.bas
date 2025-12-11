CONST RASTER_LINE  = $d012
DIM a$ AS STRING * 1

SUB curpos(row AS BYTE, col AS BYTE) STATIC
  POKE 214, row: POKE 211, col: SYS 58732
END SUB

REM store sprite shapes in safe VIC-visible RAM
CONST SHAPES_START = $3000        : REM 12288

memcpy @ballsprite, SHAPES_START, 64
memcpy @batsprite,  SHAPES_START+64, 64

PRINT CHR$(147)

REM compiler multicolor flags
SPRITE MULTICOLOR 1, 1

REM multicolor settings from your editor
POKE $D025, 12        : REM multicolor #1
POKE $D026, 11        : REM multicolor #2
POKE $D021, 6         : REM background color

SPRITE 0 COLOR 15 MULTI ON BACKGROUND
SPRITE 1 COLOR 15 MULTI ON BACKGROUND

REM hardware multicolor enable (sprites 0 and 1)
POKE $D01C, %00000011

call curpos(10,10)
PRINT "bat and ball demo"

REM set sprite pointers for $3000 and $3000+64
POKE 2040, SHAPES_START/64        : REM = 192
POKE 2041, (SHAPES_START+64)/64   : REM = 193

SPRITE 0 ON AT 100,110
SPRITE 1 ON AT 120,120

GET a$
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
