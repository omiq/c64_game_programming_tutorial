fun get_flag!(fl!, fpos!)

  if fpos! > 0 then
    return rshift!(fl!, fpos!) & 1
  else
    return fl! & 1
  endif
    
endfun


fun set_flag!(fl!, fpos!)

  if fpos! > 0 then
    return fl! ^ lshift!(1, fpos!)
  else
    return fl! ^ 1
  endif

endfun

proc show_bts(fl!)

  for i! = 0 to 7
  
    print get_flag!(fl!, i!);
    
  next i!
  print ""
  
endproc
