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
  dim \buff![21]
  \instr$ = @\buff!
  let \n = 0
  let \e = 0
  let \s = 0
  let \w = 0
  let \u = 0
  let \d = 0

  const \num_objects = 7
  data \objects$[] = "key", "mouse", "hat", "knife", "string", "match"
  
  data \original_object_locations[] = 1,1,1,3,3,2
  dim \object_locations[\num_objects]
  for obj = 0 to \num_objects
    let \object_locations[obj]=\original_object_locations[obj]
  next obj
  
  data \rooms$[] = "nowhere", "main room", "small closet", "east wing", "loft"
  data \room_descriptions$[] = "", ~
                  "this is the main room of the house", ~
                  "off the main room, a little storage cupboard", ~
                  "a whole other wing", ~
                  "the dark, dusty loft";, ~
                  ;"", ~
                  ;"", ~
                  ;"", ~
                  ;"", ~
                  


  rem            rm   n   s   e   w   u   d

  data \map$[] ="00","0","0","0","0","0","0", ~
                "01","0","2","3","0","0","0", ~
                "02","1","0","0","0","0","0", ~
                "03","0","0","0","1","4","0", ~
                "04","0","0","0","0","0","3", ~
                "05","0","0","0","0","0","0", ~
                "06","0","0","0","0","0","0", ~
                "07","0","0","0","0","0","0", ~
                "08","0","0","0","0","0","0", ~
                "09","0","0","0","0","0","0", ~
                "10","0","0","0","0","0","0", ~
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
            
proc show_location

  print "{CLEAR}"
  print "{REV_ON}",\rooms$[\current_room],"{REV_OFF}"
  print \room_descriptions$[\current_room]
  
  call check_room_for_objects
  
  print ""
  print "available exits: ";
  
  let current_exits = \current_room * 7
  \n = val!(\map$[current_exits+1])
  \s = val!(\map$[current_exits+2])
  \e = val!(\map$[current_exits+3])
  \w = val!(\map$[current_exits+4])
  \u = val!(\map$[current_exits+5])
  \d = val!(\map$[current_exits+6])

  if \n > 0 then print " {LIGHT_GRAY}n{LIGHT_BLUE}orth";
  if \e > 0 then print " {LIGHT_GRAY}e{LIGHT_BLUE}ast";
  if \s > 0 then print " {LIGHT_GRAY}s{LIGHT_BLUE}outh";
  if \w > 0 then print " {LIGHT_GRAY}w{LIGHT_BLUE}est";
  if \u > 0 then print " {LIGHT_GRAY}u{LIGHT_BLUE}p";
  if \d > 0 then print " {LIGHT_GRAY}d{LIGHT_BLUE}own";
  
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
      for i = 0 to \num_objects
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
