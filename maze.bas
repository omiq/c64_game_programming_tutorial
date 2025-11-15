dim maze(20,20) as byte
dim x,y as byte
dim player_x, player_y as byte

player_x = 10
player_y = 10



sub init_maze()

  for y as int = 0 to 19
    for x as int = 0 to 19
      maze(x,y) = 0
    next x
  next y

    x=player_x
    y=player_y
    maze(x+1,y) = 1
    maze(x-1,y) = 1
    maze(x+1,y+1) = 1
    maze(x-1,y+1) = 1
    maze(x+1,y-1) = 0
    maze(x-1,y-1) = 1
    maze(x+1,y-2) = 1
    maze(x-1,y-2) = 1
    maze(x+1,y-3) = 1
    maze(x-1,y-3) = 0
    maze(x+1,y-4) = 0
    maze(x-1,y-4) = 1
    maze(x+1,y-5) = 1
    maze(x-1,y-5) = 1
    maze(x+1,y-6) = 1
    maze(x-1,y-6) = 1

end sub

sub print_maze()
  for y as int = 0 to 19
    for x as int = 0 to 19
      if x=player_x and y=player_y then
        print "@";
      else
        if maze(x,y) = 1 then CHARAT x, y, 102 
        if maze(x,y) = 0 then CHARAT x, y, 32 
      end if
    next x
    print ""
  next y
end sub

sub draw_rgap(depth as int)
  x=20-(depth*2)
  
  for y as int = (depth*2) to 19-(depth*2)
    CHARAT x, y, 32
  next y

  x=20-((depth*2)+1)
  
  for y as int = (depth*2) to 19-(depth*2)
    CHARAT x, y, 32
  next y

  
end sub

sub draw_lgap(depth as int)
  x=0+(depth*2)
  
  for y as int = (depth*2) to 19-(depth*2)-1
    CHARAT x, y, 32
  next y


  x=0+(depth*2)+1
  
  for y as int = (depth*2) to 19-(depth*2)-1
    CHARAT x, y, 32
  next y
 
end sub

sub draw_rwall(depth as int)

  x=20-(depth*2)
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
  for y as int = (depth*2)+1 to (19-(depth*2))-1
    CHARAT x, y, 160
  next y
 charat x, 19-((depth*2))-1, 105
  x=0+(depth*2)+1
  CHARAT x, (depth*2)+1, 223
  for y as int = (depth*2)+2 to (19-(depth*2))-2
    CHARAT x, y, 160
  next y
 charat x, 19-((depth*2))-2, 105
end sub

sub render_maze()

  print chr$(147)
  for y as int = 10 to 19
  for x as int = 0 to 19
    CHARAT x, y, 102
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
    ' if maze(x+1,y-1) = 1 then
    ' if maze(x-1,y-1) = 1 then
    ' if maze(x+1,y-2) = 1 then
    ' if maze(x-1,y-2) = 1 then
    ' if maze(x+1,y-3) = 1 then
    ' if maze(x-1,y-3) = 1 then
    ' if maze(x+1,y-4) = 1 then
    ' if maze(x-1,y-4) = 1 then
    ' if maze(x+1,y-5) = 1 then
    ' if maze(x-1,y-5) = 1 then
    ' if maze(x+1,y-6) = 1 then
    ' if maze(x-1,y-6) = 1 then

end sub

sub main()
  call init_maze()
  'call print_maze()
  call render_maze()

  loop:
  goto loop
end sub

call main()