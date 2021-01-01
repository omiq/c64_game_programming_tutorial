include "bits.bas"

rem binary test
let a! = 128

print a!
a! = set_flag!(a!,1)
print a!
print get_flag!(a!,1)

a! = set_flag!(a!,1)
print a!
print get_flag!(a!,1)


a! = set_flag!(a!,0)
print a!
print get_flag!(a!,0)

a! = set_flag!(a!,0)
print a!
print get_flag!(a!,0)

let a! = 0
show_bts(a!)
a! = set_flag!(a!,0)
show_bts(a!)
a! = set_flag!(a!,1)
show_bts(a!)
a! = set_flag!(a!,2)
show_bts(a!)
a! = set_flag!(a!,3)
show_bts(a!)
a! = set_flag!(a!,4)
show_bts(a!)
a! = set_flag!(a!,5)
show_bts(a!)
a! = set_flag!(a!,6)
show_bts(a!)
a! = set_flag!(a!,7)
show_bts(a!)