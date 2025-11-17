' LABYRINTH – XC-BASIC 3 PORT

' M(0..3) = movement offsets (E,S,W,N)
' M(4..7) = 3D window corners TL,BL,TR,BR
' W(0..3) = wall primes (E,S,W,N)

REM -------------------------------------------------------------------
REM VARIABLES / ARRAYS
REM -------------------------------------------------------------------
DIM ADDRESS AS INT
DIM TARPOS AS INT
DIM TOTAL AS INT
DIM DIR AS INT
DIM Y AS INT
DIM X AS INT
DIM LD AS INT

DIM M(8) AS INT
DIM W(4) AS INT
DIM MAZE(101) AS INT

DIM TR AS INT
DIM TC AS INT
DIM U AS INT
DIM LL AS INT
DIM DC AS INT
DIM N AS INT
DIM CD AS INT
DIM DW AS INT
DIM B AS INT
DIM BC AS INT
DIM T1 AS BYTE
DIM B1 AS BYTE
DIM SW AS BYTE
DIM TL AS INT
DIM BL AS INT
DIM BR AS INT
DIM TW AS BYTE
DIM BW AS BYTE

DIM QV AS INT
DIM DV AS INT
DIM MQ AS INT
DIM NP AS INT
DIM CE AS INT
DIM I1 AS INT
DIM I2 AS INT
DIM P2 AS INT
DIM QT AS INT
DIM EC AS INT

DIM OL AS INT
DIM TT AS INT
DIM RM AS INT
DIM MC AS INT
DIM SM AS INT
DIM EM AS INT
DIM W1 AS BYTE
DIM W2 AS BYTE
DIM W3 AS BYTE
DIM W4 AS BYTE

DIM OP AS INT
DIM ML AS INT
DIM MR AS INT
DIM R AS INT
DIM V AS INT
DIM WIDTH AS INT
DIM A AS INT
DIM C AS INT
DIM D AS INT
DIM G AS INT
DIM F AS INT
DIM H AS INT
DIM L AS INT
DIM OX AS INT
DIM P AS INT
DIM T AS INT

DIM Q AS INT
DIM Z AS INT
DIM LM AS INT
DIM NM AS INT

DIM KEY$ AS STRING * 1

DIM VIS(101) AS INT
DIM STK(101) AS INT
DIM NEI(4) AS INT
DIM DIRL(4) AS INT




FOR c = 0 TO 100 : maze(c) = 0 : NEXT

POKE 53280,0
POKE 53281,0
POKE 198,0

' --------------------------------------------------------------------
' TITLE / HELP
' --------------------------------------------------------------------
SCREEN:
PRINT CHR$(147);"    maze";CHR$(13)
PRINT"[l] left"
PRINT"[r] right"
PRINT"[f] fwd"
PRINT"[m] map"
PRINT""
GOSUB WAITKEY

PRINT CHR$(147);"generating maze..."
GOTO MAZEGEN

' --------------------------------------------------------------------
' DRAW A SINGLE WALL SEGMENT BETWEEN TC AND BC
' --------------------------------------------------------------------
DRAWWALL:
y = PEEK(tc - u)
z = PEEK(tc - u + ll)
IF ABS(u)=1 OR dc=0 THEN GOTO DRAWWALLSEG
IF y<>32 THEN IF z<>32 THEN GOTO DRAWWALLSEG

i1 = tc - u + ll
i2 = bc - v - ll
FOR address = i1 TO i2 STEP ll
    POKE address, w3
NEXT

DRAWWALLSEG:
POKE tc, tw
POKE bc, bw
b = b + 1
IF b < dw THEN
    tc = tc + u
    bc = bc + v
    GOTO DRAWWALLSEG
END IF

IF ABS(u)=1 THEN POKE tc, t1
POKE bc, b1

IF tc = bc - ll THEN RETURN

FOR b = tc + ll TO bc - ll STEP ll
    POKE b, sw
NEXT
RETURN

' --------------------------------------------------------------------
' 3D VIEW GENERATION FROM CURRENT CELL P AND DIRECTION DIR
' --------------------------------------------------------------------
GENWALLS:
f  = ml
u  = ll + 1
v  = 1 - ll
t1 = 80
b1 = 122
sw = 103

FOR x = 4 TO 6 STEP 2
    tw = 77
    bw = 78
    b  = 0

    IF x <> 4 THEN
        f  = mr
        u  = ll - 1
        v  = -ll - 1
        sw = 101
        t1 = 79
        b1 = 76
        tw = 78
        bw = 77
    END IF

GETDIR:
    lm = m(f)
    ld = w(f)

    IF f = 3 AND op = ec THEN GOTO UPDATEBOUNDS
    IF ld = 0 THEN ld = 2

    ' side wall at this depth?
    qv = q : dv = ld : GOSUB FASTMOD
    IF mq = 0 THEN
        tc = m(x)   : bc = m(x+1)
        GOSUB DRAWWALL
        GOTO RESTOREVEC
    END IF

    ' forward wall one depth step away?
    tw = 99 : bw = 100
    u  = u - ll
    v  = v + ll
    n  = maze(op + lm)
    qv = n : dv = d : GOSUB FASTMOD
    IF mq = 0 THEN
        tc = m(x) + dw * ll
        bc = m(x+1) - dw * ll
        GOSUB DRAWWALL
    END IF

RESTOREVEC:
    IF ABS(u)=1 THEN u = u + ll
    v = v - ll

UPDATEBOUNDS:
    m(x)   = m(x)   + dw * u
    m(x+1) = m(x+1) + dw * v
NEXT

IF f = 3 AND op = ec THEN RETURN

' if this cell is a wall, stop drawing further
qv = q : dv = d : GOSUB FASTMOD
IF mq = 0 THEN RETURN

op = op + m(f)
q = maze(op)
dc = dc + 1
IF dc < cd THEN GOTO GENWALLS
RETURN

' --------------------------------------------------------------------
' MAIN GAME LOOP
' --------------------------------------------------------------------
LOOP:
PRINT "air :";ox;"l"

GETINPUT:
GET key$
IF key$="" THEN GOTO GETINPUT

np = p
q  = maze(p)

IF key$="f" OR key$="F" THEN np = p + m(dir)
IF np = p THEN GOTO ROTATE

IF np = ec THEN
    PRINT"exit!"
    GOSUB WAITKEY
    GOTO SCREEN
END IF

IF d = 2 THEN
    mq = q AND 1
    GOTO CHECKMOD
END IF

qv = q : dv = d : GOSUB FASTMOD

CHECKMOD:
IF mq <> 0 THEN
    p = np
    GOTO UPDIRS
END IF

PRINT"ouch! hit a wall!"
for delay as LONG=1 to 100000: next delay
GOTO DECOX

ROTATE:
nm = dir
IF key$="r" OR key$="R" THEN nm = dir + 1
IF key$="m" OR key$="M" THEN GOSUB SHOWMAP
IF key$="l" OR key$="L" THEN nm = dir + 3

IF nm = dir THEN GOTO LOOP
IF nm > 3 THEN nm = nm - 4 * CINT(nm/4)

dir = nm
GOTO UPDIRS

UPDIRS:
d  = w(dir)
q  = maze(p)
op = p
ml = dir - 1 : IF ml < 0 THEN ml = 3
mr = dir + 1 : IF mr > 3 THEN mr = 0

DECOX:
ox = ox - ol
IF ox < 0 THEN
    PRINT"out of air!"
    GOSUB WAITKEY
    GOTO SCREEN
END IF

t  = t + 1
tt = 1
IF tt = 1 THEN dc = 0

PRINT CHR$(147)

' reset window box then draw 3D view
m(4) = tl : m(5) = bl : m(6) = tr : m(7) = br

GOSUB GENWALLS

IF p = mc AND rm = 0 THEN rm = 1
GOTO LOOP

' --------------------------------------------------------------------
' MAZE / VIEW INITIALISATION
' --------------------------------------------------------------------
MAZEGEN:
tl = 1144
bl = 1904
tr = tl + 25
br = bl + 25
ll = 40
dw = 3
cd = 3

w1 = 99   ' top horizontal
w2 = 100  ' bottom horizontal
w3 = 160  ' thick vertical
w4 = 88   ' player marker on map

w(0) = 5  ' east
w(1) = 7  ' south
w(2) = 3  ' west
w(3) = 2  ' north

' maze size (rows=l, cols=width)
l     = CINT(RND()*5) + 6
width = CINT(RND()*5) + 6
PRINT "rows=";l;" cols=";width

m(0) = 1
m(1) = width
m(2) = -1
m(3) = -width
m(4) = tl : m(5) = bl : m(6) = tr : m(7) = br

total = l*width - 1
em    = total
sm    = 0
g     = width - 1

GOSUB BUILDMAZE

' pick start, exit, map centre
p  = CINT(RND()*(total+1))
ec = CINT(RND()*(total+1))
mc = CINT(RND()*(total+1))

ox = CINT(total/3) + 1
IF p < ox THEN ox = -ox
ox = ox + total
ol = 1
tt = CINT(RND()*total/8) + 1

dir = 0
np  = p
ce  = maze(ec)
ce  = ce / w(3)
maze(ec) = ce

GOTO UPDIRS

' --------------------------------------------------------------------
' DEPTH–FIRST MAZE CARVING INTO MAZE()
' --------------------------------------------------------------------
BUILDMAZE:
FOR a = 0 TO total
    maze(a) = 2*3*5*7    ' all four walls present
    vis(a)  = 0
NEXT

c = 0
p = CINT(RND()*(total+1))
stk(0) = p
vis(p) = 1

MAZELOOP:
IF c < 0 THEN RETURN

p = stk(c)

' collect unvisited neighbours
h = 0
y = CINT(p / width)
x = p - y*width

FOR f = 0 TO 3
    tarpos = p

    IF f=0 THEN
        IF x < width-1 THEN tarpos = p+1 ELSE GOTO NXT
    END IF

    IF f=1 THEN
        IF y < l-1 THEN tarpos = p+width ELSE GOTO NXT
    END IF

    IF f=2 THEN
        IF x > 0 THEN tarpos = p-1 ELSE GOTO NXT
    END IF

    IF f=3 THEN
        IF y > 0 THEN tarpos = p-width ELSE GOTO NXT
    END IF

    IF vis(tarpos)=0 THEN
        nei(h)  = tarpos
        dirl(h) = f
        h = h + 1
    END IF
NXT:
NEXT

IF h = 0 THEN
    c = c - 1
    GOTO MAZELOOP
END IF

' choose random neighbour
q      = CINT(RND()*h)
tarpos = nei(q)
f      = dirl(q)

v = f + 2
IF v > 3 THEN v = v - 4

' knock down walls by dividing by primes
maze(p)      = maze(p)      / w(f)
maze(tarpos) = maze(tarpos) / w(v)

c = c + 1
stk(c) = tarpos
vis(tarpos) = 1
GOTO MAZELOOP

' --------------------------------------------------------------------
' FAST MODULO (QV MOD DV) INTO MQ
' --------------------------------------------------------------------
FASTMOD:
IF dv = 2 THEN
    mq = qv AND 1
    RETURN
END IF

qt = qv
FASTMODLOOP:
IF qt < dv THEN
    mq = qt
    RETURN
END IF
qt = qt - dv
GOTO FASTMODLOOP

' --------------------------------------------------------------------
' WAIT FOR ANY KEY
' --------------------------------------------------------------------
WAITKEY:
PRINT " press a key..."
WAITKEYL:
key$ = ""
POKE 198,0
WAIT 198,1
GET key$
IF key$="" THEN GOTO WAITKEYL
RETURN

' --------------------------------------------------------------------
' TOP-DOWN MAP VIEW (M KEY)
' --------------------------------------------------------------------
SHOWMAP:
PRINT CHR$(147)

address = tl + ll + 1
ms      = address
dc      = 0
dd      = width - 1

FOR h = 0 TO l-1
    a = ms
    FOR b = dc TO dd
        x = maze(b)

        IF b = p THEN POKE a, w4

        IF x - w(0)*CINT(x/w(0)) < 1 THEN
            p2 = a+1 : POKE p2, w3 : POKE p2+ll, w3 : POKE p2-ll, w3
        END IF
        IF x - w(1)*CINT(x/w(1)) < 1 THEN
            p2 = a+ll : POKE p2, w3 : POKE p2+1, w3 : POKE p2-1, w3
        END IF
        IF x - w(2)*CINT(x/w(2)) < 1 THEN
            p2 = a-1 : POKE p2, w3 : POKE p2-ll, w3 : POKE p2+ll, w3
        END IF
        IF x - w(3)*CINT(x/w(3)) < 1 THEN
            p2 = a-ll : POKE p2, w3 : POKE p2-1, w3 : POKE p2+1, w3
        END IF

        a = a + 2
    NEXT

    dc = dc + width
    dd = dd + width
    ms = ms + (2*ll)
NEXT
RETURN
