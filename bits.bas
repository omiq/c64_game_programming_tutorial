fun get_flag!(fl!, fpos!)

  return rshift!(fl!, fpos!) & 1
   
endfun


fun flip_flag!(fl!, fpos!)

  return fl! ^ lshift!(1, fpos!)

endfun

fun set_flag!(fl!, fpos!)

  return fl! | lshift!(1, fpos!)

endfun

fun unset_flag!(fl!, fpos!)

  if get_flag!(fl!, fpos!) = 1 then
    return flip_flag!(fl!, fpos!)
  else
    return fl!
  endif

endfun

proc show_bts(fl!)

  for i = 7 to 0 step -1
  
    print get_flag!(fl!, i);
    
  next i
  print ""
  
endproc
