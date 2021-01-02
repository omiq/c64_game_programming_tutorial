include "bits.bas"

let a! = 0
a! = set_flag!(a!,0)
a! = set_flag!(a!,1)
a! = set_flag!(a!,2)
a! = set_flag!(a!,3)
a! = set_flag!(a!,4)

show_bts(a!)
print a!


rem binary test
let a! = 128
show_bts(a!)
print get_flag!(a!,7)
print a!

a! = set_flag!(a!,6)
show_bts(a!)
print a!

a! = unset_flag!(a!,6)
show_bts(a!)
print a!

a! = flip_flag!(a!,5)
show_bts(a!)
print a!

a! = flip_flag!(a!,5)
show_bts(a!)
print a!

a! = flip_flag!(a!,5)
show_bts(a!)
print a!
