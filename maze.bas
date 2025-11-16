REM ==========================================
REM CONFIG
REM ==========================================

CONST DIR_NORTH = 0
CONST DIR_EAST  = 1
CONST DIR_SOUTH = 2
CONST DIR_WEST  = 3

REM ===== Carver Arrays Must Be Global (avoid large stack frame) =====

DIM carve_dx(4) AS BYTE
DIM carve_dy(4) AS BYTE
DIM stack_x(400) AS BYTE
DIM stack_y(400) AS BYTE
DIM dirs(4) AS BYTE

DIM map_cx AS BYTE
DIM map_cy AS BYTE

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


REM ==========================================
REM SETUP DIRECTION LOOKUP TABLES
REM ==========================================

SUB init_direction_tables()

  REM ---- NORTH ----
  forward_x(DIR_NORTH) = 0
  forward_y(DIR_NORTH) = -1
  left_x(DIR_NORTH)    = -1
  left_y(DIR_NORTH)    =  0
  right_x(DIR_NORTH)   = 1
  right_y(DIR_NORTH)   = 0

  REM ---- EAST ----
  forward_x(DIR_EAST) = 1
  forward_y(DIR_EAST) = 0
  left_x(DIR_EAST)    = 0
  left_y(DIR_EAST)    = -1
  right_x(DIR_EAST)   = 0
  right_y(DIR_EAST)   = 1

  REM ---- SOUTH ----
  forward_x(DIR_SOUTH) = 0
  forward_y(DIR_SOUTH) = 1
  left_x(DIR_SOUTH)    = 1
  left_y(DIR_SOUTH)    = 0
  right_x(DIR_SOUTH)   = -1
  right_y(DIR_SOUTH)   = 0

  REM ---- WEST ----
  forward_x(DIR_WEST) = -1
  forward_y(DIR_WEST) = 0
  left_x(DIR_WEST)    = 0
  left_y(DIR_WEST)    = 1
  right_x(DIR_WEST)   = 0
  right_y(DIR_WEST)   = -1

END SUB





REM ==========================================
REM DRAW WALL SEGMENTS
REM Characters:
REM 160 = wall fill
REM 233 = left corner
REM 223 = right corner
REM 100 = top line
REM 232 = bottom line
REM ==========================================

SUB draw_full_wall(d AS BYTE)

  REM front wall at depth d
  FOR x AS BYTE = d*2 TO 21 - (d*2)
    CHARAT x, d*2, 100
  NEXT x

  FOR y AS BYTE = d*2 TO 19 - (d*2)
    FOR x AS BYTE = d*2 TO 21 - (d*2)
      CHARAT x, y, 160
    NEXT x
  NEXT y

  FOR x AS BYTE = d*2 TO 21 - (d*2)
    CHARAT x, 19 - (d*2), 232
  NEXT x

END SUB


SUB draw_left_wall(d AS BYTE)

  DIM x AS BYTE
  x = d*2

  CHARAT x, d*2, 223
  FOR y AS BYTE = d*2+1 TO 19-(d*2)-1
    CHARAT x, y, 160
  NEXT y
  CHARAT x, 19-(d*2), 105

  x = x + 1
  CHARAT x, d*2+1, 223
  FOR y AS BYTE = d*2+2 TO 19-(d*2)-2
    CHARAT x, y, 160
  NEXT y
  CHARAT x, 19-(d*2)-1, 105

END SUB


SUB draw_right_wall(d AS BYTE)

  DIM x AS BYTE
  x = 21-(d*2)

  CHARAT x, d*2, 233
  FOR y AS BYTE = d*2+1 TO 19-(d*2)
    CHARAT x, y, 160
  NEXT y
  CHARAT x, 19-(d*2), 95

  x = x - 1
  CHARAT x, d*2+1, 233
  FOR y AS BYTE = d*2+2 TO 19-(d*2)-1
    CHARAT x, y, 160
  NEXT y
  CHARAT x, 19-(d*2)-1, 95

END SUB


SUB draw_left_gap(d AS BYTE)

  DIM x AS BYTE
  x = d*2

  CHARAT x, d*2+1, 100
  FOR y AS BYTE = d*2+2 TO 19-(d*2)-2
    CHARAT x, y, 32
  NEXT y
  CHARAT x, 19-(d*2)-1, 232

  x = x + 1
  CHARAT x, d*2+1, 100
  FOR y AS BYTE = d*2+2 TO 19-(d*2)-2
    CHARAT x, y, 32
  NEXT y
  CHARAT x, 19-(d*2)-1, 232

END SUB


SUB draw_right_gap(d AS BYTE)

  DIM x AS BYTE
  x = 21-(d*2)

  CHARAT x, d*2+1, 100
  FOR y AS BYTE = d*2+2 TO 19-(d*2)-2
    CHARAT x, y, 32
  NEXT y
  CHARAT x, 19-(d*2)-1, 232

  x = x - 1
  CHARAT x, d*2+1, 100
  FOR y AS BYTE = d*2+2 TO 19-(d*2)-2
    CHARAT x, y, 32
  NEXT y
  CHARAT x, 19-(d*2)-1, 232

END SUB



REM ==========================================
REM RENDER 3D VIEW BASED ON FACING DIRECTION
REM ==========================================

SUB render_view()

  PRINT CHR$(147)

  REM background floor
  FOR y AS BYTE = 10 TO 19
    FOR x AS BYTE = 0 TO 21
      CHARAT x, y, 230
    NEXT x
  NEXT y

  REM === DEPTH 0–4 ===
  FOR d AS BYTE = 0 TO 4

    DIM ahead_x AS BYTE
    DIM ahead_y AS BYTE

    ahead_x = player_x + forward_x(player_dir) * d
    ahead_y = player_y + forward_y(player_dir) * d

    REM if forward cell is a wall, draw the full front wall and stop
    IF maze(ahead_x, ahead_y) = 1 THEN
      call draw_full_wall(d)
      RETURN
    END IF

    REM otherwise draw left/right walls or gaps for this depth
    DIM lx AS BYTE
    DIM ly AS BYTE
    DIM rx AS BYTE
    DIM ry AS BYTE

    lx = ahead_x + left_x(player_dir)
    ly = ahead_y + left_y(player_dir)
    rx = ahead_x + right_x(player_dir)
    ry = ahead_y + right_y(player_dir)

    IF maze(lx,ly) = 1 THEN
      call draw_left_wall(d)
    ELSE
      call draw_left_gap(d)
    END IF

    IF maze(rx,ry) = 1 THEN
      call draw_right_wall(d)
    ELSE
      call draw_right_gap(d)
    END IF

  NEXT d

END SUB



REM ==========================================
REM PLAYER MOVEMENT
REM ==========================================

SUB move_forward()

  DIM nx AS BYTE
  DIM ny AS BYTE

  nx = player_x + forward_x(player_dir)
  ny = player_y + forward_y(player_dir)

  IF maze(nx,ny) = 0 THEN
    player_x = nx
    player_y = ny
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
REM SHOW MAP (PRESS M, ANY KEY TO CLOSE)
REM ==========================================

SUB show_map()

  PRINT CHR$(147)

  PRINT " overhead map view"

  FOR y AS BYTE = 0 TO 19
    FOR x AS BYTE = 0 TO 19

      IF x = player_x AND y = player_y THEN
        PRINT CHR$(146);"@";
      ELSE
        IF maze(x,y) = 1 THEN
          PRINT CHR$(18);CHR$(186);
        ELSE
          PRINT CHR$(146);CHR$(166);
        END IF
      END IF

    NEXT x
    PRINT ""
  NEXT y

  PRINT "press a key to continue..."

  key$ = ""
  do while key$ = ""
    GET key$
  loop

END SUB

REM ==========================================
REM MAZE CARVING (DEPTH-FIRST SEARCH / BACKTRACKING)
REM Produces a perfect maze inside maze(20,20)
REM Wall = 1, Floor = 0
REM ==========================================

SUB carve_maze()

  REM direction vectors
  carve_dx(0)=0  : carve_dy(0)=-1   :REM north
  carve_dx(1)=1  : carve_dy(1)=0    :REM east
  carve_dx(2)=0  : carve_dy(2)=1    :REM south
  carve_dx(3)=-1 : carve_dy(3)=0    :REM west

  DIM sp AS BYTE
  DIM cx AS BYTE
  DIM cy AS BYTE
  DIM nx AS BYTE
  DIM ny AS BYTE
  DIM wx AS BYTE
  DIM wy AS BYTE
  DIM dir AS BYTE
  DIM tmp AS BYTE

  REM -------------------------------------------------------
  REM 1. Fill entire grid with WALLS
  REM -------------------------------------------------------
  FOR map_cy = 0 TO 19
    FOR map_cx = 0 TO 19
      maze(map_cx,map_cy) = 1
    NEXT map_cx
  NEXT map_cy

  REM -------------------------------------------------------
  REM 2. Choose a starting cell on odd coordinates
  REM -------------------------------------------------------
  cx = (CINT(RND()*9)*2)+1
  cy = (CINT(RND()*9)*2)+1

  maze(cx,cy)=0

  sp=0
  stack_x(sp)=cx
  stack_y(sp)=cy

carve_loop:

  IF sp > 200 THEN RETURN
  cx = stack_x(sp)
  cy = stack_y(sp)

  REM build direction list
  dirs(0)=0 : dirs(1)=1 : dirs(2)=2 : dirs(3)=3

  REM shuffle direction list (Fisher-Yates)
  FOR loop_i as byte = 0 TO 3
     loop_j = loop_i + CINT(RND()*(3-loop_i))
     tmp=dirs(loop_i)
     dirs(loop_i)=dirs(loop_j)
     dirs(loop_j)=tmp
  NEXT loop_i

  REM -------------------------------------------------------
  REM 3. Try directions
  REM -------------------------------------------------------
  FOR try_i as byte = 0 TO 3

    dir = dirs(try_i)

    REM target two cells away
    nx = cx + carve_dx(dir)*2
    ny = cy + carve_dy(dir)*2

    REM bounds check
    IF nx > 19 THEN GOTO next_try
    IF ny > 19 THEN GOTO next_try
    IF nx < 0 THEN GOTO next_try
    IF ny < 0 THEN GOTO next_try

    REM if target is untouched wall, carve to it
    IF maze(nx,ny) = 1 THEN

      REM carve cell in between
      wx = cx + carve_dx(dir)
      wy = cy + carve_dy(dir)
      maze(wx,wy)=0

      REM carve target
      maze(nx,ny)=0

      REM push new cell
      sp = sp + 1
      stack_x(sp)=nx
      stack_y(sp)=ny

      GOTO carve_loop
    END IF

next_try:
  NEXT try_i

  REM -------------------------------------------------------
  REM 4. Backtrack
  REM -------------------------------------------------------
  IF sp = 0 THEN RETURN

  sp = sp - 1
  GOTO carve_loop

END SUB


REM ==========================================
REM INITIALISE MAZE
REM 1 = wall, 0 = empty
REM ==========================================

SUB init_maze()

  CALL carve_maze()

END SUB

REM ==========================================
REM MAIN LOOP
REM ==========================================

SUB main()

  CALL init_direction_tables()
  CALL init_maze()

  player_x = 10
  player_y = 8
  player_dir = DIR_NORTH

  CALL render_view()

game_loop:

  GET key$

  IF key$ = "" THEN GOTO game_loop

  IF key$ = "m" THEN
    CALL show_map()
    CALL render_view()
    GOTO game_loop
  END IF

  IF key$ = "f" THEN CALL move_forward()
  IF key$ = "l" THEN CALL turn_left()
  IF key$ = "r" THEN CALL turn_right()

  CALL render_view()

  GOTO game_loop


END SUB


CALL main()
