
rem x$="{home}{right*39}":y$="{down*24}"


10 rem print an x at line 20, column 4 
20 sys 58692  : rem clear the screen
30 rem set a,x,y
40 a=0  
50 x=20
60 y=4
70 gosub 100  : rem call the cursor sub
80 print "hello world!"
90 end
100 rem set cursor row and column
110 poke 780,a : rem set the a register 
120 poke 781,x : rem set the x register (row)
130 poke 782,y : rem set the y register (col)
140 poke 783,0 : rem set the status register
150 sys 65520  : rem set the cursor
160 return

rem open 1,8,15,"s:__FILE TO DELETE__":close1





