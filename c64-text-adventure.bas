include "bits.bas"

;;
;;  TO DO
;;
;;  
;;  - EXAMINE
;;  - trigger events (eg. spring traps)
;;  - on room entry events (eg. open bathroom door and all water floods out, next time floor is wet)
;;  - container objects (how to handle location? just visibility?)
;;  - remember rooms been in?
;;  - reset after temporary change
;;  


proc initialise
  let \_debug!=1            ; for outputting debug code - future add teleport etc commands
  let \_moves=0             ; move counter - integer because in theory a game could be > 255
  let \won_the_game! = 0    ; did they win?
  let \is_alive! = 1        ; are they dead?
  
  ; movement and location
  let \current_room = 1
  let \room_has_visible_door = 0
  let \door_max = 10

  ; string buffers
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
  ;                  0  1            2        3             4        5         6        7
  data \objects$[] = "","brass key", "mouse", "3d glasses", "knife", "string", "match", "bone key"
  data \object_descriptions$[] = "", ~
  "it's a key. made out of brass.", ~
  "a small, off-white coloured mouse. he says 'get off me you oaf!'", ~
  "a pair of red-blue 3d glasses{13}the kind given out for old movies", ~
  "a pocket knife with a cheap, plastic grip", ~
  "some frayed string", ~
  "one small safety match", ~
  "a key with a bone motif. probably not{13}actual bone, but i couldn't be sure.", ~
  ""
  
  ; OBJECT FLAG BIT POSITIONS
  const \fl_OBJECT_is_used = 7
  const \fl_OBJECT_is_consumable = 6
  const \fl_OBJECT_is_weapon = 5
  const \fl_OBJECT_is_moveable = 4
  const \fl_OBJECT_is_container = 3
  const \fl_OBJECT_is_key = 2
  const \fl_OBJECT_gives_light = 1
  const \fl_OBJECT_is_hidden = 0

  data \original_object_properties![] = 0,%00010100,0,0,0,0,%01010010,%00010100  
  data \object_properties![] = 0,%00010100,0,0,0,0,%01010010,%00010100

  
  data \original_object_locations[] = 0,1,5,1,3,3,2,4
  dim \object_locations[\num_objects]
  
  ; reset on restart
  for obj! = 0 to cast!(\num_objects)
    let \object_locations[obj!]=\original_object_locations[obj!]
    let \object_properties![obj!]=\original_object_properties![obj!]
  next obj!

 
  ; ROOM DEFINITIONS
  data \rooms$[] =  "                 ", ~
                    "main room", ~
                    "small closet", ~
                    "east wing", ~
                    "loft", ~
                    "lobby"
  
    ; ROOM FLAG BIT POSITIONS
  const \fl_ROOM_is_hidden = 0
  const \fl_ROOM_is_dark = 1
  const \fl_ROOM_been_visited = 2
  
  data \room_original_properties![]=0,0,0,0,0,%00000010,0,0,0,0,0
  data \room_properties![]=0,0,0,0,0,%00000010,0,0,0,0,0
  
  for rm! = 0 to cast!(\num_rooms)
    let \room_properties![rm!]=\room_original_properties![rm!]
  next rm!
  
  data \room_descriptions$[] = "", ~
                  "this is the main room of the house", ~
                  "off the main room,{13}a little storage cupboard", ~
                  "a whole other wing", ~
                  "the smelly, dusty loft", ~
                  "grand entrance";, ~
                  ;"", ~
                  ;"", ~
                  ;"", ~
                  


  rem            rm    n    s    e    w    u    d
  rem            ------------------------------------
  data \map$[] ="00", "0", "0", "0", "0", "0", "0", ~
                "01","D5","D2","D3","-0","-0","-0", ~
                "02","-1","-0","-0","-0","-0","-0", ~
                "03","-0","-0","-0","-1","-4","-0", ~
                "04","-0","-0","-0","-0","-0","-3", ~
                "05","-0","-1","-0","-0","-0","-0", ~
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

  print "{REV_ON}{GRAY}press a key to continue{LIGHT_GRAY}{REV_OFF}"
  loop:
    let key! = inkey!()
    if key! = 0 then goto loop
  
endproc

proc start_screen

  print "{CLR}";
  print "an adventure game"
  print "by chris garrett"
  print ""
  print "you're welcome!"
  print ""
  call wait_key
  
endproc

proc end_screen

  print "{CLR}";
  if \won_the_game! = 1 then
    print "yay - you won!"
  else
    print "oop - you failed. try again?"
  endif
  print "{13}total moves this game: ", \_moves
  print ""
  call wait_key
  
endproc


proc check_room_for_objects

  print ""
  if get_flag!(\room_properties![\current_room],\fl_ROOM_is_dark) = 0 then
    print "room contents:"
    let anything_in_here = 0
    for i = 0 to \num_objects
      if \object_locations[i]=\current_room then 
        print "{209}",\objects$[i]
        anything_in_here = 1
      endif
    next i

    if anything_in_here = 0 then print "this room contains no objects of note"
  else
      print "the room is dark.{13}you can't see if there are objects."
  endif
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

fun key_fit(door_id!)
  ; given door (9), return the ID for the key ("bone key")
  current_key_needed = \doors![door_id!] & %00011111
  if \_debug!=1 then print "{13}door: ",door_id!," key_fit:",current_key_needed, " door data ", \doors![door_id!]
  return current_key_needed
  
endfun

proc process_door(door_id!, direction$, _pointer)

   if door_is_hidden!(door_id!) = 1 then
      poke _pointer, 0
    else
      let \room_has_visible_door = 1
    endif
    
    if door_is_hidden!(door_id!) = 0 and door_is_locked!(door_id!) = 1 then
      print "{13}there is a locked door ",direction$, "{13}- you will need a key"   
      poke _pointer, 0
    endif
    
    if door_is_hidden!(door_id!) = 0 and door_is_locked!(door_id!) = 0 then
      print "{13}there is an open door ",direction$
    endif

endproc
            
proc show_location

  ; NO DOORS SPOTTED YET
  let \room_has_visible_door = 0
  
  print "{CLEAR}"
  print "{LIGHT_GRAY}{REV_ON}",\rooms$[\current_room],"{REV_OFF}{LIGHT_BLUE}"
  print \room_descriptions$[\current_room]
  
  call check_room_for_objects
  
  ;print ""
  
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
  let old_current_room = \current_room
  
  if strpos!(\instr$, "go ") = 0 then 
    \instr$ = \instr$ + 3
  endif

  if strcmp(\instr$, "north") = 0 then \instr$ = "n"
  if strcmp(\instr$, "east" ) = 0 then \instr$ = "e"
  if strcmp(\instr$, "south") = 0 then \instr$ = "s"
  if strcmp(\instr$, "west" ) = 0 then \instr$ = "w"
  if strcmp(\instr$, "up"   ) = 0 then \instr$ = "u"
  if strcmp(\instr$, "down" ) = 0 then \instr$ = "d"


  ; Check to see if we are talking about an object in your possession? 
  let first_space = strpos!(\instr$," ")+1
  let _ob_instr$=\instr$+first_space
  let in_possession = 0

  ; check the object list for this name
  for i = 0 to \num_objects
  
    ; Do you have the object in your possession?
    if strcmp(_ob_instr$, \objects$[i])=0 and \object_locations[i]=0 then
      object_id = i
      in_possession = 1
    endif
    
  next i
  


  ; DEBUG MAGICS
  if \_debug!=1 then
    
    ; MAGICALLY GET ALL THE THINGS
    if strpos!(\instr$,"accio")=0 then
  
        for i = 1 to \num_objects
            print "{218} got ",\objects$[i]
             \object_locations[i]=0
        next i
        
        instruction_ok = 1
        call wait_key
        
    endif
    
    ; MAGICALLY TELEPORT
    if strpos!(\instr$,"apparate")=0 then
    
        let first_space = strpos!(\instr$," ")+1
        \instr$=\instr$+first_space
        
        let old_current_room = \current_room
        for rm = 1 to \num_rooms
          if strcmp(\instr$,\rooms$[rm])=0 then 
            \current_room = rm
          endif
        next rm
        
        if old_current_room = \current_room then
          print "{13}",\instr$," not found"
        else
          print "{13}disapparating from ",\rooms$[old_current_room], " to ",\rooms$[\current_room]
        endif
        instruction_ok = 1
        call wait_key
        
    endif

  endif


 
  ; things you can only do if there is light
  let _its_dark = 0
  if get_flag!(\room_properties![\current_room],\fl_ROOM_is_dark) = 1 then 
  
    let _its_dark = 1

  else
      ; pick something up?
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
      
      ; Examine X
      if strpos!(\instr$,"ex")=0 then
      
          ; you have it in your possession
          if in_possession = 0 then 
              print "{13}{LIGHT_RED}difficult to see{LIGHT_BLUE}{13}pick it up, get a closer look?"
              print "use 'get ",_ob_instr$,"'"
              print ""
              call wait_key
              instruction_ok = 1
          else  
      
            ; Pull up the description
            print "{13}{REV_ON}",\objects$[object_id],"{REV_OFF}"
            print \object_descriptions$[object_id];
            if get_flag!(\object_properties![object_id],\fl_OBJECT_is_used)=1 then print " (used)"
            print ""
            call wait_key
            instruction_ok = 1
            
          endif
      
      endif
      
      
  endif   
       


  ; USE OR WEAR
  if strpos!(\instr$,"use")=0 or strpos!(\instr$,"wear")=0 then
  
      ; you have it in your possession
      if in_possession = 0 then  
          print "{13}you could, if that was something you possessed"
      else  
      
      
        ; Use a key ...
        let first_space = strpos!(\instr$," ")+1
        \instr$=\instr$+first_space
        if strpos!(\instr$, " key") < 255 then
        
          let correct_key = 0
          for r = 1 to 6
          
              ; the door will match the position in the table of n,s,e,w,u,d
              let door_id! = (\current_room * 7) + r
              
              ; find the key that is required for this door
              let current_key_needed = key_fit(door_id!)
              
              if \_debug!=1 then print "room: ", \current_room," need: ",current_key_needed, " for door ", door_id!, " got: ", object_id  
              
              ; well we have a match but can we SEE the door?
              if current_key_needed = object_id and get_flag!(\doors![door_id!],\fl_DOOR_is_hidden)=0 then 
                let correct_key = 1   
                let \doors![door_id!] = unset_flag!(\doors![door_id!],\fl_DOOR_is_locked)
              endif
          next r

          if correct_key = 1 then
            print "trying ", \objects$[object_id], " in door was successful"

          else
            print "{13}seems ", \objects$[object_id], " doesn't fit,{13}try another door "

          endif
          
          instruction_ok = 1
          call wait_key
        endif

        ; Use 3d glasses
        if strpos!(\instr$, "3d glasses") < 255 and _its_dark = 0 then
          
          let door_now_visible = 0
          for this_direction = 1 to 6
            let this_door = (\current_room * 7) + this_direction
            if get_flag!(\doors![this_door],\fl_DOOR_is_hidden) = 1 then
              let \doors![this_door] = unset_flag!(\doors![this_door],\fl_DOOR_is_hidden) 
              door_now_visible = 1
            endif
          next this_direction
          
          if door_now_visible = 1 then print "{13}a previously hidden door has appeared!{13}"
          instruction_ok = 1
          call wait_key
       
        endif   


        ; MAKE LIGHT
        if get_flag!(\object_properties![object_id],\fl_OBJECT_gives_light)=1 and get_flag!(\object_properties![object_id],\fl_OBJECT_is_used)=0 then 
            
          ; Use lighting device when it is already light?
          if _its_dark = 0 then
          
              print "{13}wait until it is dark?"
              instruction_ok = 1
          
          else  
            ; matches get one use only! this means you still possess it but it doesn't give off light
            if get_flag!(\object_properties![object_id],\fl_OBJECT_is_consumable)=1 then 
              let \object_properties![object_id] = unset_flag!(\object_properties![object_id],\fl_OBJECT_gives_light)
              let \object_properties![object_id] = set_flag!(\object_properties![object_id],\fl_OBJECT_is_used)
            endif

            print "{13}the ", \objects$[object_id], " lights up the room"
            let \room_properties![\current_room] = unset_flag!(\room_properties![\current_room],\fl_ROOM_is_dark)
            instruction_ok = 1
          endif
          
          ; done
          call wait_key
        endif

      ; end of in-possession 
      endif  

      print ""

  endif
  
  

  ; drop an object
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
    
  ; help
  if strcmp(\instr$,"help")=0 then
  
      instruction_ok = 1
      print "instructions"
      call wait_key
  
  endif

  ; inventory
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
  
  ; quit the game
  if strcmp(\instr$,"quit")=0 then

      \won_the_game! = 0      
      instruction_ok = 1
      \is_alive! = 0
      
  endif

  ; directions
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

  
  ; are we moving?
  if old_current_room <> \current_room and get_flag!(\room_original_properties![old_current_room],\fl_ROOM_is_dark) = 1 then
    
    ; turn the light off
    let \room_properties![old_current_room] = set_flag!(\room_properties![old_current_room],\fl_ROOM_is_dark)
    
  endif
  
  
  
  if instruction_ok = 0 then
    print ""
    print "{LIGHT_RED}oops, can't do that!{LIGHT_BLUE}"
    print ""
    call wait_key
  endif
  
  \instr$ = "                  "
  
_instructions_done:
  
endproc

proc get_instruction

  print "{13}{LIGHT_GRAY}your instruction?{LIGHT_BLUE}"
  print ""
  input \instr$, 20
  print ""
  
 
endproc


rem main game_loop
proc main

  while 1=1
  
    call start_screen
  
    call initialise
    
    while \is_alive! = 1 
    
      call show_location
      call get_instruction
      call process_instruction
      inc \_moves
      
    endwhile
    
    call end_screen
    
  endwhile
  
endproc

call main
