REM ==========================================
REM CONFIG
REM ==========================================

CONST DIR_NORTH = 0
CONST DIR_EAST  = 1
CONST DIR_SOUTH = 2
CONST DIR_WEST  = 3

REM ===== Global Arrays =====

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

DIM sp AS INT     :REM GLOBAL STACK POINTER (CRITICAL FIX)


REM ==========================================
REM SETUP DIRECTION LOOKUP TABLES
REM ==========================================

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



REM ==========================================
REM DRAW WALL SEGMENTS (3D VIEW)
REM ==========================================

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



REM ==========================================
REM RENDER 3D
REM ==========================================

SUB render_view()

  PRINT CHR$(147)

  FOR y AS BYTE = 10 TO 19
    FOR x AS BYTE = 0 TO 21
      CHARAT x,y,230
    NEXT x
  NEXT y

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



REM ==========================================
REM MOVEMENT
REM ==========================================

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



REM ==========================================
REM SHOW MAP
REM ==========================================

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



REM ==========================================
REM MAZE CARVING — CORRECTED VERSION
REM ==========================================

SUB carve_maze()

  carve_dx(0)=0 : carve_dy(0)=-1
  carve_dx(1)=1 : carve_dy(1)=0
  carve_dx(2)=0 : carve_dy(2)=1
  carve_dx(3)=-1: carve_dy(3)=0

  DIM cx AS BYTE
  DIM cy AS BYTE
  DIM nx AS BYTE
  DIM ny AS BYTE
  DIM wx AS BYTE
  DIM wy AS BYTE
  DIM dir AS BYTE
  DIM tmp AS BYTE

  FOR map_cy = 0 TO 19
    FOR map_cx = 0 TO 19
      maze(map_cx,map_cy)=1
    NEXT map_cx
  NEXT map_cy

  cx = ((CINT(RND()*8))*2)+1
  cy = ((CINT(RND()*8))*2)+1

  maze(cx,cy)=0
  start_x=cx : start_y=cy

  sp=0
  stack_x(0)=cx
  stack_y(0)=cy

carve_loop:

  cx = stack_x(sp)
  cy = stack_y(sp)

  dirs(0)=0 : dirs(1)=1 : dirs(2)=2 : dirs(3)=3

  FOR loop_i AS BYTE = 0 TO 3
    DIM loop_j AS BYTE
    loop_j = loop_i + CINT(RND()*(3-loop_i))
    tmp = dirs(loop_i)
    dirs(loop_i)=dirs(loop_j)
    dirs(loop_j)=tmp
  NEXT loop_i

  FOR try_i AS BYTE = 0 TO 3

    dir = dirs(try_i)

    nx = cx + carve_dx(dir)*2
    ny = cy + carve_dy(dir)*2

    IF nx<1 OR ny<1 OR nx>18 OR ny>18 THEN GOTO cant

    IF maze(nx,ny)=1 THEN
      wx=cx+carve_dx(dir)
      wy=cy+carve_dy(dir)
      maze(wx,wy)=0
      maze(nx,ny)=0

      sp=sp+1
      stack_x(sp)=nx
      stack_y(sp)=ny
      GOTO carve_loop
    END IF

    REM --- chance to add a side opening ---
    IF RND() < 0.25 THEN
        DIM side AS BYTE
        side = (dir + 1 + CINT(RND()*1)*2) AND 3
        DIM sx AS BYTE
        DIM sy AS BYTE
        sx = cx + carve_dx(side)
        sy = cy + carve_dy(side)
        IF sx>1 AND sx<18 AND sy>1 AND sy<18 THEN
            maze(sx,sy) = 0
        END IF
    END IF


cant:
  NEXT try_i

  sp = sp - 1
  IF sp<0 THEN RETURN
  GOTO carve_loop

END SUB



REM ==========================================
REM INITIALISE MAZE
REM ==========================================
SUB init_maze()
  CALL carve_maze()
END SUB



REM ==========================================
REM MAIN LOOP
REM ==========================================

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
