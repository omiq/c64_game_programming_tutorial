10 rem Put PETSCII text at screen coords
20 print "{clear}{home}{right*4}{down*12}{cyan}press keys: q,a,o,p{white}"
30 rem init vars + set initial position
40 let col=20 : let row=10 : let a=0
45 rem                                                the screen 'map' 
50 ?"" 
51 ?"  ###-##########################"
52 ?"  #      #                     #"
53 ?"  #      #                     #"
54 ?"  #      ####                  #"
55 ?"  #                            #"
56 ?"  #                            #"
57 ?"  #                      #######"
58 ?"  #                            i"
59 ?"  #             #              #"
60 ?"  #             #              #"
61 ?"  i         ########           #"
62 ?"  #             #              #"
63 ?"  #             #              #"
64 ?"  #      #                     #"
65 ?"  #      #                     #"
66 ?"  #      ###                   #"
67 ?"  #                  ###########"
68 ?"  #                  #         #"
69 ?"  #                            #"
70 ?"  #                  #         #"
71 ?"  ########################-#####"
500 gosub 3000 : rem start running
510 rem                                  
1000 rem start of loop
1010 ox=col : oy=row
1020 gosub 2000 : rem get keyboard input
1030 if row<>oy OR col<>ox then print "{left} "
1040 gosub 3000 : rem set the char pos
1050 print "@";
1060 poke 2021,131 : rem C
1070 poke 2022,54  : rem 6
1080 poke 2023,52  : rem 4
1090 goto 1000 : rem go back to loop
1110 rem                                 
2000 rem get keyboard input
2010 get p$ : rem peek(197) also works
2020 rem print asc(p$) to work out keys
2030 if p$="o" then col=col-1 : rem <
2040 if p$="p" then col=col+1 : rem >
2050 if p$="q" then row=row-1 : rem ^ 
2060 if p$="a" then row=row+1 : rem v
2070 if col < 0 then col=0
2080 if col > 39 then col=39
2090 if row < 0 then row=0
2100 if row > 23 then row=23
2110 return
2120 rem                                 
3000 rem set cursor row and column
3010 x=row : y=col
3020 poke 780,a : rem set a register 
3030 poke 781,x : rem set x reg (row)
3040 poke 782,y : rem set y reg (col)
3050 poke 783,0 : rem set status reg
3060 sys 65520  : rem set the cursor
3070 return






 