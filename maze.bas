'  ==========================================
'   3D MAZE FOR XC-BASIC (C64) 
'   BY CHRIS GARRETT
'   RETROGAMECODERS 2025
'  ==========================================

BACKGROUND 0
BORDER 0
PRINT CHR$(155)

'  ==========================================
'  CONFIG
'  ==========================================

CONST DIR_NORTH = 0
CONST DIR_EAST  = 1
CONST DIR_SOUTH = 2
CONST DIR_WEST  = 3

'  ===== Global Arrays =====

DIM carve_dx(4) AS BYTE
DIM carve_dy(4) AS BYTE
DIM stack_x(400) AS BYTE
DIM stack_y(400) AS BYTE
DIM dirs(4) AS BYTE

DIM map_cx AS BYTE
DIM map_cy AS BYTE

DIM start_x AS BYTE
DIM start_y AS BYTE

DIM maze(20,20) AS BYTE

DIM player_x  AS BYTE
DIM player_y  AS BYTE
DIM player_dir AS BYTE

DIM forward_x(4) AS BYTE
DIM forward_y(4) AS BYTE
DIM left_x(4)    AS BYTE
DIM left_y(4)    AS BYTE
DIM right_x(4)   AS BYTE
DIM right_y(4)   AS BYTE

DIM depth AS BYTE
DIM key$ AS STRING * 1

DIM sp AS INT     '  GLOBAL STACK POINTER (CRITICAL FIX)


'  ==========================================
'  SETUP DIRECTION LOOKUP TABLES
'  ==========================================

SUB init_direction_tables()

  forward_x(DIR_NORTH)=0 : forward_y(DIR_NORTH)=-1
  left_x(DIR_NORTH)=-1  : left_y(DIR_NORTH)=0
  right_x(DIR_NORTH)=1  : right_y(DIR_NORTH)=0

  forward_x(DIR_EAST)=1 : forward_y(DIR_EAST)=0
  left_x(DIR_EAST)=0    : left_y(DIR_EAST)=-1
  right_x(DIR_EAST)=0   : right_y(DIR_EAST)=1

  forward_x(DIR_SOUTH)=0 : forward_y(DIR_SOUTH)=1
  left_x(DIR_SOUTH)=1    : left_y(DIR_SOUTH)=0
  right_x(DIR_SOUTH)=-1  : right_y(DIR_SOUTH)=0

  forward_x(DIR_WEST)=-1 : forward_y(DIR_WEST)=0
  left_x(DIR_WEST)=0     : left_y(DIR_WEST)=1
  right_x(DIR_WEST)=0    : right_y(DIR_WEST)=-1

END SUB



'  ==========================================
'  DRAW WALL SEGMENTS (3D VIEW)
'  ==========================================

SUB draw_full_wall(d AS BYTE)
  FOR x AS BYTE = d*2 TO 21-(d*2)
    CHARAT x, d*2, 100
  NEXT x

  FOR y AS BYTE = d*2 TO 19-(d*2)
    FOR x AS BYTE = d*2 TO 21-(d*2)
      CHARAT x, y, 160
    NEXT x
  NEXT y

  FOR x AS BYTE = d*2 TO 21-(d*2)
    CHARAT x, 19-(d*2), 232
  NEXT x
END SUB


SUB draw_left_wall(d AS BYTE)
  DIM x AS BYTE : x=d*2
  CHARAT x,d*2,223
  FOR y AS BYTE=d*2+1 TO 19-(d*2)-1: CHARAT x,y,160: NEXT y
  CHARAT x,19-(d*2),105

  x=x+1
  CHARAT x,d*2+1,223
  FOR y AS BYTE=d*2+2 TO 19-(d*2)-2: CHARAT x,y,160: NEXT y
  CHARAT x,19-(d*2)-1,105
END SUB


SUB draw_right_wall(d AS BYTE)
  DIM x AS BYTE : x=21-(d*2)
  CHARAT x,d*2,233
  FOR y AS BYTE=d*2+1 TO 19-(d*2): CHARAT x,y,160: NEXT y
  CHARAT x,19-(d*2),95

  x=x-1
  CHARAT x,d*2+1,233
  FOR y AS BYTE=d*2+2 TO 19-(d*2)-1: CHARAT x,y,160: NEXT y
  CHARAT x,19-(d*2)-1,95
END SUB


SUB draw_left_gap(d AS BYTE)
  DIM x AS BYTE : x=d*2
  CHARAT x,d*2+1,100
  FOR y AS BYTE=d*2+2 TO 19-(d*2)-2: CHARAT x,y,32: NEXT y
  CHARAT x,19-(d*2)-1,232

  x=x+1
  CHARAT x,d*2+1,100
  FOR y AS BYTE=d*2+2 TO 19-(d*2)-2: CHARAT x,y,32: NEXT y
  CHARAT x,19-(d*2)-1,232
END SUB


SUB draw_right_gap(d AS BYTE)
  DIM x AS BYTE : x=21-(d*2)
  CHARAT x,d*2+1,100
  FOR y AS BYTE=d*2+2 TO 19-(d*2)-2: CHARAT x,y,32: NEXT y
  CHARAT x,19-(d*2)-1,232

  x=x-1
  CHARAT x,d*2+1,100
  FOR y AS BYTE=d*2+2 TO 19-(d*2)-2: CHARAT x,y,32: NEXT y
  CHARAT x,19-(d*2)-1,232
END SUB



'  ==========================================
'  RENDER 3D
'  ==========================================

SUB render_view()

  ' clear screen
  MEMSET 1024, 400, 32
  MEMSET 1424, 22, 230
  MEMSET 1464, 22, 230
  MEMSET 1504, 22, 230
  MEMSET 1544, 22, 230
  MEMSET 1584, 22, 230
  MEMSET 1624, 22, 230
  MEMSET 1664, 22, 230
  MEMSET 1704, 22, 230
  MEMSET 1744, 22, 230
  MEMSET 1784, 22, 230


  FOR d AS BYTE = 0 TO 4

    DIM ax AS BYTE
    DIM ay AS BYTE

    ax = player_x + forward_x(player_dir)*d
    ay = player_y + forward_y(player_dir)*d

    IF maze(ax,ay)=1 THEN
      CALL draw_full_wall(d)
      RETURN
    END IF

    DIM lx AS BYTE : lx = ax + left_x(player_dir)
    DIM ly AS BYTE : ly = ay + left_y(player_dir)
    DIM rx AS BYTE : rx = ax + right_x(player_dir)
    DIM ry AS BYTE : ry = ay + right_y(player_dir)

    IF maze(lx,ly)=1 THEN CALL draw_left_wall(d) ELSE CALL draw_left_gap(d)
    IF maze(rx,ry)=1 THEN CALL draw_right_wall(d) ELSE CALL draw_right_gap(d)

  NEXT d

END SUB



'  ==========================================
'  MOVEMENT
'  ==========================================

SUB move_forward()
  DIM nx AS BYTE : nx = player_x + forward_x(player_dir)
  DIM ny AS BYTE : ny = player_y + forward_y(player_dir)

  IF maze(nx,ny)=0 THEN
    player_x=nx: player_y=ny
  END IF
END SUB

SUB turn_left()
  player_dir = player_dir - 1
  IF player_dir > 3 THEN player_dir = DIR_WEST
END SUB

SUB turn_right()
  player_dir = player_dir + 1
  IF player_dir > DIR_WEST THEN player_dir = DIR_NORTH
END SUB



'  ==========================================
'  SHOW MAP
'  ==========================================

SUB show_map()

  PRINT CHR$(147)
  PRINT " overhead map view"

  FOR map_cy = 0 TO 18
    FOR map_cx = 0 TO 18

      IF map_cx=player_x AND map_cy=player_y THEN
        PRINT CHR$(146);"@";
      ELSE
        IF maze(map_cx,map_cy)=1 THEN PRINT CHR$(18);CHR$(186); ELSE PRINT CHR$(146);CHR$(166);
      END IF

    NEXT map_cx
    PRINT ""
  NEXT map_cy

  PRINT "press a key to continue..."

  key$=""
  DO WHILE key$=""
    GET key$
  LOOP

END SUB



'  ==========================================
'  MAZE CARVING 
'  ==========================================

SUB carve_maze()

  PRINT CHR$(147);"generating maze..."

  '  directional vectors
  carve_dx(0)=0  : carve_dy(0)=-1   ' north
  carve_dx(1)=1  : carve_dy(1)=0    ' east
  carve_dx(2)=0  : carve_dy(2)=1    ' south
  carve_dx(3)=-1 : carve_dy(3)=0    ' west

  '  working variables
  DIM cell_x AS BYTE
  DIM cell_y AS BYTE
  DIM next_cell_x AS BYTE
  DIM next_cell_y AS BYTE
  DIM wall_x AS BYTE
  DIM wall_y AS BYTE
  DIM direction_index AS BYTE
  DIM temp AS BYTE

  '  ------------------------------------
  '  1. fill maze with walls (1)
  '  ------------------------------------
  FOR map_cy = 0 TO 19
    FOR map_cx = 0 TO 19
      maze(map_cx,map_cy) = 1
    NEXT map_cx
  NEXT map_cy

  '  ------------------------------------
  '  2. choose odd starting cell
  '  ------------------------------------
  cell_x = ((CINT(RND()*8))*2)+1
  cell_y = ((CINT(RND()*8))*2)+1

  maze(cell_x,cell_y)=0
  start_x = cell_x
  start_y = cell_y

  sp = 0
  stack_x(0) = cell_x
  stack_y(0) = cell_y

carve_loop:

  '  load current cell from stack
  cell_x = stack_x(sp)
  cell_y = stack_y(sp)

  '  ------------------------------------
  '  build shuffled direction list
  '  ------------------------------------
  dirs(0)=0 : dirs(1)=1 : dirs(2)=2 : dirs(3)=3

  FOR shuffle_i AS BYTE = 0 TO 3
    DIM shuffle_j AS BYTE
    shuffle_j = shuffle_i + CINT(RND()*(3-shuffle_i))
    temp = dirs(shuffle_i)
    dirs(shuffle_i)=dirs(shuffle_j)
    dirs(shuffle_j)=temp
  NEXT shuffle_i

  '  ------------------------------------
  '  attempt each direction
  '  ------------------------------------
  FOR try_direction AS BYTE = 0 TO 3

    direction_index = dirs(try_direction)

    next_cell_x = cell_x + carve_dx(direction_index)*2
    next_cell_y = cell_y + carve_dy(direction_index)*2

    '  boundary protection (keep 1-cell border)
    IF next_cell_x<1 OR next_cell_y<1 OR next_cell_x>18 OR next_cell_y>18 THEN GOTO no_go

    '  can we carve?
    IF maze(next_cell_x,next_cell_y)=1 THEN

      '  carve the wall between the cells
      wall_x = cell_x + carve_dx(direction_index)
      wall_y = cell_y + carve_dy(direction_index)
      maze(wall_x,wall_y)=0

      '  carve the destination cell
      maze(next_cell_x,next_cell_y)=0

      '  push next cell onto stack
      sp = sp + 1
      stack_x(sp)=next_cell_x
      stack_y(sp)=next_cell_y

      GOTO carve_loop
    END IF

    '  --- optional side opening ---
    IF RND() < 0.25 THEN
      DIM side_dir AS BYTE
      DIM side_x AS BYTE
      DIM side_y AS BYTE
      side_dir = (direction_index + 1 + CINT(RND()*1)*2) AND 3
      side_x = cell_x + carve_dx(side_dir)
      side_y = cell_y + carve_dy(side_dir)
      IF side_x>1 AND side_x<18 AND side_y>1 AND side_y<18 THEN
        maze(side_x,side_y)=0
      END IF
    END IF

no_go:
  NEXT try_direction

  '  backtrack
  sp = sp - 1
  IF sp<0 THEN RETURN
  GOTO carve_loop

END SUB




'  ==========================================
'  INITIALISE MAZE
'  ==========================================
SUB init_maze()
  CALL carve_maze()
END SUB



'  ==========================================
'  MAIN LOOP
'  ==========================================

SUB main()

  RANDOMIZE TI()

  CALL init_direction_tables()
  CALL init_maze()

  player_x = start_x
  player_y = start_y
  player_dir = DIR_NORTH

  CALL render_view()

game_loop:

  GET key$
  IF key$="" THEN GOTO game_loop

  IF key$="m" THEN
    CALL show_map()
    CALL render_view()
    GOTO game_loop
  END IF

  IF key$="f" THEN CALL move_forward()
  IF key$="l" THEN CALL turn_left()
  IF key$="r" THEN CALL turn_right()

  CALL render_view()
  GOTO game_loop

END SUB


CALL main()
