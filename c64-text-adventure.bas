include "bits.bas"

;;
;;  TO DO
;;
;;  - doors (can be open, closed, locked, unlocked, need specific key, lead to a room, hidden?)
;;  - use _object_
;;  - EXAMINE
;;  - trigger events (eg. spring traps)
;;  - on room entry events (eg. open bathroom door and all water floods out, next time floor is wet)
;;  - object properties (eg. can be moved/not)
;;  - room properties (eg. light/dark)
;;  - container objects (how to handle location? just visibility?)
;;  - remember rooms been in?
;;
;;  look up array counting to avoid 1 to _6_



proc initialise

  let \is_alive = 1
  let \current_room = 1
  let \room_has_visible_door = 0
  let \current_key_needed = 0
  dim \buff![21]
  \instr$ = @\buff!
  let \n = 0
  let \e = 0
  let \s = 0
  let \w = 0
  let \u = 0
  let \d = 0

  ; CONSTANTS
  const \num_objects = 8
  const \num_rooms = 10
  
  
  ; OBJECT FLAG BIT POSITIONS
  const \fl_OBJECT_is_hidden = 0
  const \fl_OBJECT_gives_light = 1
  const \fl_OBJECT_is_key = 2
  const \fl_OBJECT_is_container = 3
  const \fl_OBJECT_is_moveable = 4
  const \fl_OBJECT_is_weapon = 5
  const \fl_OBJECT_is_consumable = 6
  const \fl_OBJECT_is_used = 7

  ; ROOM FLAG BIT POSITIONS
  const \fl_ROOM_is_hidden = 0
  const \fl_ROOM_is_lit = 1
  const \fl_ROOM_been_visited = 2
  
  ; DOOR FLAG BIT POSITIONS
  const \fl_DOOR_is_hidden = 7
  const \fl_DOOR_is_locked = 6
  const \fl_DOOR_is_open = 5
  ; Lower 31 specifies key IDs: 255-224
  dim \doors![255]
  dim \key_to_doors![255]
  
  let \doors![8] = 1 ; brass key needed, visible locked closed    
  let \key_to_doors![1] = 8
  
  let \doors![8] = unset_flag!(\doors![8],\fl_DOOR_is_hidden)
  let \doors![8] = set_flag!(\doors![8],\fl_DOOR_is_locked)  
  let \doors![8] = unset_flag!(\doors![8],\fl_DOOR_is_open)
  
  let \doors![9] = 7 ; bone key hidden and locked  
  let \key_to_doors![7] = 9
  
  let \doors![9] = set_flag!(\doors![9],\fl_DOOR_is_hidden)
  let \doors![9] = set_flag!(\doors![9],\fl_DOOR_is_locked)  
  let \doors![9] = unset_flag!(\doors![9],\fl_DOOR_is_open)

  let \doors![10] = 0 ; no key, unlocked and open 
  let \doors![10] = set_flag!(\doors![10],\fl_DOOR_is_hidden)
  let \doors![10] = unset_flag!(\doors![10],\fl_DOOR_is_locked)  
  let \doors![10] = set_flag!(\doors![10],\fl_DOOR_is_open)

  
  ; OBJECT DEFINITIONS
  data \objects$[] = "","brass key", "mouse", "3d glasses", "knife", "string", "match", "bone key"
  dim \object_properties$[\num_objects]
  
  
  data \original_object_locations[] = 0,1,1,1,3,3,2,4
  dim \object_locations[\num_objects]
  for obj = 0 to \num_objects
    let \object_locations[obj]=\original_object_locations[obj]
  next obj


  
  ; ROOM DEFINITIONS
  data \rooms$[] = "nowhere", "main room", "small closet", "east wing", "loft", "lobby"
  data \room_descriptions$[] = "", ~
                  "this is the main room of the house", ~
                  "off the main room, a little storage cupboard", ~
                  "a whole other wing", ~
                  "the dark, dusty loft", ~
                  "grand entrance";, ~
                  ;"", ~
                  ;"", ~
                  ;"", ~
                  


  rem            rm    n    s    e    w    u    d

  data \map$[] ="00", "0", "0", "0", "0", "0", "0", ~
                "01","D5","D2","D3","-0","-0","-0", ~
                "02","-1","-0","-0","-0","-0","-0", ~
                "03","-0","-0","-0","-1","-4","-0", ~
                "04","-0","-0","-0","-0","-0","-3", ~
                "05","-0","D1","-0","-0","-0","-0", ~
                "06","-0","-0","-0","-0","-0","-0", ~
                "07","-0","-0","-0","-0","-0","-0", ~
                "08","-0","-0","-0","-0","-0","-0", ~
                "09","-0","-0","-0","-0","-0","-0", ~
                "10","-0","-0","-0","-0","-0","-0", ~
                "11","0","0","0","0","0","0", ~
                "12","0","0","0","0","0","0", ~
                "13","0","0","0","0","0","0", ~
                "14","0","0","0","0","0","0", ~
                "15","0","0","0","0","0","0", ~
                "16","0","0","0","0","0","0"
endproc

proc wait_key

  print "{REV_ON}press a key to continue{REV_OFF}"
  loop:
    let key! = inkey!()
    if key! = 0 then goto loop
  
endproc

proc check_room_for_objects

  print ""
  print "room contents:"
  let anything_in_here = 0
  for i = 0 to \num_objects
    if \object_locations[i]=\current_room then 
      print "{209}",\objects$[i]
      anything_in_here = 1
    endif
  next i

  if anything_in_here = 0 then print "this room contains no objects of note"
  print ""
  
endproc

fun door_is_hidden!(door!)

  return get_flag!(\doors![door!],\fl_DOOR_is_hidden) 

endfun

fun door_is_locked!(door!)

  return get_flag!(\doors![door!],\fl_DOOR_is_locked)

endfun

fun door_is_open!(door!)

  return get_flag!(\doors![door!],\fl_DOOR_is_open) 

endfun

proc door_infos(door!)
  
  print door!
  show_bts(\doors![door!])

  if door_is_hidden!(door!) = 1 then 
    print "the door is hidden."
  else
    print "the door is visible."
  endif
    
    
  if door_is_locked!(door!) = 1 then 
    print "the door is locked."
  else
    print "the door is unlocked."
  endif
    
  if door_is_open!(door!) = 1 then 
    print "the door is open."
  else
    print "the door is closed."
  endif
    
endproc

proc process_door(door_id!, direction$, _pointer)

   if door_is_hidden!(door_id!) = 1 then
      poke _pointer, 0
    else
      let \room_has_visible_door = 1
    endif
    
    if door_is_hidden!(door_id!) = 0 and door_is_locked!(door_id!) = 1 then
      print "there is a locked door ",direction$, " - you will need a key"
      \current_key_needed = lshift!(\doors![door_id!],3)-7
      ;call show_bts(\current_key_needed)
      ;print \current_key_needed      
      poke _pointer, 0
    endif
    
    if door_is_hidden!(door_id!) = 0 and door_is_locked!(door_id!) = 0 then
      print "there is an open door ",direction$
    endif

endproc
            
proc show_location

  ; NO DOORS SPOTTED YET
  let \room_has_visible_door = 0
  
  print "{CLEAR}"
  print "{REV_ON}",\rooms$[\current_room],"{REV_OFF}"
  print \room_descriptions$[\current_room]
  
  call check_room_for_objects
  
  print ""
  
  let current_exits = \current_room * 7
  let n$ = \map$[current_exits+1]
  let s$ = \map$[current_exits+2]
  let e$ = \map$[current_exits+3]
  let w$ = \map$[current_exits+4]
  let u$ = \map$[current_exits+5]
  let d$ = \map$[current_exits+6]
  
    
  ; GET VALUE OF NUMERIC PART
  \n = val!(n$+1)
  \s = val!(s$+1) 
  \e = val!(e$+1)
  \w = val!(w$+1)
  \u = val!(u$+1)
  \d = val!(d$+1)
  

  ; DOOR CHECK
  ; D = Regular door

  if strpos!(n$, "D") = 0 then 

    door_id! = (\current_room * 7) + 1
    call process_door(door_id!, "north", @\n)
  
  endif

  if strpos!(s$, "D") = 0 then 
   
   door_id! = (\current_room * 7) + 2
    call process_door(door_id!, "south", @\s)
    
  endif  

  if strpos!(e$, "D") = 0 then 

   door_id! =  (\current_room * 7) + 3
    call process_door(door_id!, "east", @\e)
    
  endif  
  
  if strpos!(w$, "D") = 0 then 
  
    door_id! =  (\current_room * 7) + 4
    call process_door(door_id!, "west", @\w)
       
  endif  
  
  if strpos!(u$, "D") = 0  then 

    door_id! =  (\current_room * 7) + 5
    call process_door(door_id!, "above", @\u)
    
  endif  
  
  if strpos!(d$, "D") = 0 then 

    door_id! =  (\current_room * 7) + 6
    call process_door(door_id!, "below", @\d)
       
  endif  
  
  
  if \n+\e+\s+\w+\u+\d > 0 then
  
    print ""
    print "available exits: ";


    if \n > 0 then print " {LIGHT_GRAY}n{LIGHT_BLUE}orth";
    if \e > 0 then print " {LIGHT_GRAY}e{LIGHT_BLUE}ast";
    if \s > 0 then print " {LIGHT_GRAY}s{LIGHT_BLUE}outh";
    if \w > 0 then print " {LIGHT_GRAY}w{LIGHT_BLUE}est";
    if \u > 0 then print " {LIGHT_GRAY}u{LIGHT_BLUE}p";
    if \d > 0 then print " {LIGHT_GRAY}d{LIGHT_BLUE}own";
  
  else
    print ""
    print "no available exits that you can see!"
  endif
  print ""
  
endproc

proc process_instruction

  let instruction_ok = 0
  
  if strpos!(\instr$, "go ") = 0 then 
    \instr$ = \instr$ + 3
  endif

  if strcmp(\instr$, "north") = 0 then \instr$ = "n"
  if strcmp(\instr$, "east" ) = 0 then \instr$ = "e"
  if strcmp(\instr$, "south") = 0 then \instr$ = "s"
  if strcmp(\instr$, "west" ) = 0 then \instr$ = "w"
  if strcmp(\instr$, "up"   ) = 0 then \instr$ = "u"
  if strcmp(\instr$, "down" ) = 0 then \instr$ = "d"

  
  
  if strpos!(\instr$,"use")=0 then
  
      let first_space = strpos!(\instr$," ")+1
      \instr$=\instr$+first_space
      
      for i = 0 to \num_objects
      
        ; You have the object in your possession
        if strcmp(\instr$, \objects$[i])=0 and \object_locations[i]=0 then
        
          ; Use a key ...
          if strpos!(\instr$, " key") < 255 then
            if \current_key_needed = i then print \objects$[i], " will unlock the door " rem, \key_to_doors![i]
            let \doors![\key_to_doors![i]] = unset_flag!(\doors![\key_to_doors![i]],\fl_DOOR_is_locked)  
            instruction_ok = 1
            call wait_key
          endif

          ; Use 3d glasses
          if strpos!(\instr$, "3d glasses") < 255 then
            
            let door_now_visible = 0
            for this_direction = 1 to 6
              let this_door = (\current_room * 7) + this_direction
              if get_flag!(\doors![this_door],\fl_DOOR_is_hidden) = 1 then
                let \doors![this_door] = unset_flag!(\doors![this_door],\fl_DOOR_is_hidden) 
                door_now_visible = 1
              endif
            next this_direction
            
            if door_now_visible = 1 then print "A previously hidden door has appeared!"
            instruction_ok = 1
            call wait_key
          endif

          
          
        endif
      next i
      print ""

  endif
  

  if strpos!(\instr$,"get")=0 or strpos!(\instr$,"take")=0 then
  
      let first_space = strpos!(\instr$," ")+1
      \instr$=\instr$+first_space
      
      for i = 0 to \num_objects
        if strcmp(\instr$, \objects$[i])=0 and \object_locations[i]=\current_room then 
          print "{218} got ",\objects$[i]
          print ""
           \object_locations[i]=0
          instruction_ok = 1
          call wait_key
        endif
      next i
      
  endif

  if strpos!(\instr$,"drop")=0 or strpos!(\instr$,"give")=0 then
  
      let first_space = strpos!(\instr$," ")+1
      \instr$=\instr$+first_space
      
      for i = 0 to \num_objects
        if strcmp(\instr$, \objects$[i])=0 and \object_locations[i]=0 then 
          print "{218} dropped ",\objects$[i]
          print ""
           \object_locations[i]=\current_room
          instruction_ok = 1
          call wait_key
        endif
      next i
      
  endif
    
  
  if strcmp(\instr$,"help")=0 then
  
      instruction_ok = 1
      print "instructions"
      call wait_key
  
  endif
  
  if strcmp(\instr$,"inventory")=0 or strcmp(\instr$,"i")=0 then
  
      instruction_ok = 1
      print ""
      print "inventory:"
      
      let carrying_anything = 0
      for i = 1 to \num_objects
        if \object_locations[i]=0 then 
          print "{209}",\objects$[i]
          carrying_anything = 1
        endif
      next i

      if carrying_anything = 0 then print "you are carrying no objects of note"
      print ""
      
      call wait_key
  
  endif
  
  if strcmp(\instr$,"quit")=0 then
  
      instruction_ok = 1
      print "ok, bye!"
      call wait_key
      \is_alive = 0
  endif
  
  if strcmp(\instr$,"n")=0 then
    if \n > 0 then 
      instruction_ok = 1
      \current_room = \n
    else
      instruction_ok = 0
    endif    
  endif
  
  if strcmp(\instr$,"e")=0 then
    if \e > 0 then 
      instruction_ok = 1
      \current_room = \e
    else
      instruction_ok = 0
    endif    
  endif
  
  if strcmp(\instr$,"s")=0 then
    if \s > 0 then 
      instruction_ok = 1
      \current_room = \s
    else
      instruction_ok = 0
    endif    
  endif
  
  if strcmp(\instr$,"w")=0 then
    if \w > 0 then 
      instruction_ok = 1
      \current_room = \w
    else
      instruction_ok = 0
    endif    
  endif
  
  if strcmp(\instr$,"u")=0 then
    if \u > 0 then 
      instruction_ok = 1
      \current_room = \u
    else
      instruction_ok = 0
    endif    
  endif
  
  if strcmp(\instr$,"d")=0 then
    if \d > 0 then 
      instruction_ok = 1
      \current_room = \d
    else
      instruction_ok = 0
    endif    
  endif

  
  if instruction_ok = 0 then
    print ""
    print "{LIGHT_RED}oops, can't do that!{LIGHT_BLUE}"
    print ""
    call wait_key
  endif
  
  \instr$ = "                  "
  
endproc

proc get_instruction

  print ""
  print "your instruction?"
  print ""
  input \instr$, 20
  print ""
  
 
endproc


rem main game_loop
proc main
  while 1=1
    call initialise
    
    while \is_alive = 1
      call show_location
      call get_instruction
      call process_instruction
    endwhile
  endwhile
endproc

call main
