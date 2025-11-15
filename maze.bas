dim maze(20,20) as byte
dim x,y as byte
dim player_x, player_y as byte
dim depth as int

player_x = 10
player_y = 8



sub init_maze()

  for y as int = 0 to 19
    for x as int = 0 to 19
      maze(x,y) = 1
    next x
  next y

    x=player_x
    y=player_y
    maze(x+1,y) = 1
    maze(x-1,y) = 1
    maze(x+1,y+1) = 1
    maze(x-1,y+1) = 1
    maze(x+1,y-1) = 0
    maze(x-1,y-1) = 0
    maze(x+1,y-2) = 1
    maze(x-1,y-2) = 1
    maze(x+1,y-3) = 0
    maze(x-1,y-3) = 0
    maze(x+1,y-4) = 1
    maze(x-1,y-4) = 1

    maze(x,y-1) = 0
    maze(x,y-2) = 0
    maze(x,y-3) = 0
    maze(x,y-4) = 1


end sub

sub print_maze()
  for y as int = 0 to 19
    for x as int = 0 to 19
      if x=player_x and y=player_y then
        CHARAT x, y,  0
      else
        if maze(x,y) = 1 then CHARAT x, y,  229
        if maze(x,y) = 0 then CHARAT x, y,  102
      end if
    next x

  next y
end sub

sub draw_rgap(depth as int)
  x=21-(depth*2)
  CHARAT x, (depth*2)+1, 100
  for y as int = (depth*2)+2 to 20-(depth*2)-2
    CHARAT x, y, 32
  next y
CHARAT x, 19-(depth*2)-1, 232
  x=21-((depth*2)+1)
  CHARAT x, (depth*2)+1, 100
  for y as int = (depth*2)+2 to 20-(depth*2)-2
    CHARAT x, y, 32
  next y
CHARAT x, 19-(depth*2)-1, 232
  
end sub

sub draw_lgap(depth as int)
  x=0+(depth*2)
  CHARAT x, (depth*2)+1, 100
  for y as int = (depth*2)+2 to 19-(depth*2)-2
    CHARAT x, y, 32
  next y
CHARAT x, 19-(depth*2)-1, 232

  x=0+(depth*2)+1
  CHARAT x, (depth*2)+1, 100
  for y as int = (depth*2)+2 to 19-(depth*2)-2
    CHARAT x, y, 32
  next y
 CHARAT x, 19-(depth*2)-1, 232
end sub

sub draw_rwall(depth as int)

  x=21-(depth*2)
  CHARAT x, (depth*2), 233
  for y as int = (depth*2)+1 to 18-(depth*2)
    CHARAT x, y, 160
  next y
  charat x, 19-(depth*2), 95

  x=x-1
  CHARAT x, (depth*2)+1, 233
  for y as int = (depth*2)+2 to 17-(depth*2)
    CHARAT x, y, 160
  next y
  charat x, 18-(depth*2), 95
end sub

sub draw_lwall(depth as int)
  x=0+(depth*2)
  CHARAT x, (depth*2), 223
  for y as int = (depth*2)+1 to (20-(depth*2))-1
    CHARAT x, y, 160
  next y
 charat x, 20-((depth*2))-1, 105
  x=0+(depth*2)+1
  CHARAT x, (depth*2)+1, 223
  for y as int = (depth*2)+2 to (20-(depth*2))-2
    CHARAT x, y, 160
  next y
 charat x, 20-((depth*2))-2, 105
end sub

sub draw_wall(depth as int)

    x=0:y=0
    for x as int = (depth*2) to 21-(depth*2)
        CHARAT x, (depth*2)-1, 100
    next x
    for y as int = 0+(depth*2) to 19-(depth*2)
    for x as int = 0+(depth*2) to 21-(depth*2)
    CHARAT x, y, 160
    next x
    next y
    
    for x as int = 0+(depth*2) to 21-(depth*2)
    CHARAT x, y, 232
    next x
end sub

sub render_maze()

  print chr$(147)
  for y as int = 10 to 19
  for x as int = 0 to 19
    CHARAT x, y, 230
  next x
  next y

    if maze(player_x+1,player_y) = 1 then call draw_rwall(0) else call draw_rgap(0)
    if maze(player_x-1,player_y) = 1 then call draw_lwall(0) else call draw_lgap(0)
    if maze(player_x+1,player_y-1) = 1 then call draw_rwall(1) else call draw_rgap(1)
    if maze(player_x-1,player_y-1) = 1 then call draw_lwall(1) else call draw_lgap(1)
    if maze(player_x+1,player_y-2) = 1 then call draw_rwall(2) else call draw_rgap(2)
    if maze(player_x-1,player_y-2) = 1 then call draw_lwall(2) else call draw_lgap(2)
    if maze(player_x+1,player_y-3) = 1 then call draw_rwall(3) else call draw_rgap(3)
    if maze(player_x-1,player_y-3) = 1 then call draw_lwall(3) else call draw_lgap(3)
    if maze(player_x+1,player_y-4) = 1 then call draw_rwall(4) else call draw_rgap(4)
    if maze(player_x-1,player_y-4) = 1 then call draw_lwall(4) else call draw_lgap(4)

    if maze(player_x,player_y-4) = 1 then depth=4 
    if maze(player_x,player_y-3) = 1 then depth=3  
    if maze(player_x,player_y-2) = 1 then depth=2
    if maze(player_x,player_y-1) = 1 then depth=1
    if depth > 0 then call draw_wall(depth)


end sub

sub main()
  call init_maze()
  'call print_maze()
  call render_maze()
  'call draw_wall(3)

  loop:
  goto loop
end sub

call main()