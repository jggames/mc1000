5 GOSUB 1000: HOME : GOSUB 500: GOTO 100
10 S = Q
20 IF Q < > A(Q) THEN Q = A(Q): GOTO 20
30 O = A(S):A(S) = Q:S = O: IF O < > Q THEN 30
40 RETURN
50 IF W < V THEN Y = INT (W / (N - 1)):X = W - Y * (N - 1): PLOT X * 3 + 3,Y * 2 + 1: RETURN
60 Q = W - V:Y = INT (Q / N):X = Q - Y * N: PLOT X * 3 + 1,Y * 2 + 2: PLOT X * 3 + 2,Y * 2 + 2: RETURN
70 IF W > = V THEN 90
80 A = W + INT (W / (N - 1)):B = A + 1: RETURN
90 A = W - V:B = W - V + N: RETURN
100 U = T: COLOR = C
110 FOR D = 1 TO R - 1
120 G = INT ( RND (1) * U + 1) + R - 1:W = A(G):A(G) = A(R + U - 1):U = U - 1
130 GOSUB 70
140 Q = A: GOSUB 10:P = Q
150 Q = B: GOSUB 10
160 IF P = Q THEN 120
170 A(Q) = P
180 GOSUB 50
190 NEXT D
200 PLOT 1,0: PLOT 2,0
210 PLOT 3 * N - 1,2 * M: PLOT 3 * N - 2,2 * M
220 POKE 284,0
230 IF PEEK (284) = 0 THEN 230
240 RUN
500 PRINT "INITIALIZING...";
510 R = M * N:V = M * (N - 1):H = (M - 1) * N:T = 2 * M * N - M - N
515 DIM A(T + R)
520 FOR I = 0 TO R - 1:A(I) = I: NEXT I
530 FOR I = 0 TO T - 1:A(I + R) = I: NEXT I
540 GR : COLOR = C
550 FOR Y = 1 TO 2 * M STEP 2: PLOT 1,Y TO 3 * N,Y: NEXT Y
560 COLOR = G
570 FOR X = 0 TO 3 * N STEP 3: PLOT X,0 TO X,2 * M: NEXT X
580 FOR Y = 0 TO 2 * M STEP 2: PLOT 0,Y TO 3 * N,Y: NEXT Y
590 RETURN
1000 E = 0:C = 2:G = 1: COLOR = G
1005 HOME
1010 PRINT TAB( 4);"* * * MAZE MAKER * * *"
1015 PRINT : PRINT
1020 ON E GOSUB 1110,1120,1130,1140
1030 PRINT "ENTER MAZE SIZE (WIDTH,HEIGHT)"
1040 PRINT "THE MAXIMUM SIZE IS 42,20"
1050 INPUT N,M
1060 IF N < 2 THEN E = 1: GOTO 1005
1070 IF N > 42 THEN E = 2: GOTO 1005
1080 IF M < 2 THEN E = 3: GOTO 1005
1090 IF M > 20 THEN E = 4: GOTO 1005
1100 RETURN
1110 PRINT "WIDTH MUST BE AT LEAST 2": RETURN
1120 PRINT "WIDTH CAN BE AT MOST 42": RETURN
1130 PRINT "HEIGHT MUST BE AT LEAST 2": RETURN
1140 PRINT "HEIGHT CAN BE AT MOST 20": RETURN
2000 REM THE MAZE IS CREATED BY STARTING WITH NXM ROOMS
2001 REM AND NO BROKEN WALLS. EACH ROOM IS ISOLATED,
2002 REM CONNECTED ONLY TO ITSELF. THE LOOP AT LINE 105
2003 REM REMOVES A WALL AT RANDOM IF THE WALL JOINS TWO
2004 REM ISOLATED AREAS. THE MAZE IS DONE WHEN NXM-1
2005 REM WALLS HAVE BEEN REMOVED. THIS IS BECAUSE THE
2006 REM FINISHED MAZE FORMS A SPANNING TREE. THE
2007 REM ALGORITHM USED IS BASED ON DIJKSTRA'S ALGORITHM
2008 REM FOR MINIMAL WEIGHT SPANNING TREES.
2010 REM ENTRY POINTS
2011 REM GOSUB 10 - GIVEN ROOM Q, RETURN Q AS THE REGION
2012 REM GOSUB 50 - ERASE WALL W
2013 REM GOSUB 70 - GIVEN WALL W, THE TWO ROOMS IT
2014 REM CONNECTS AS A,B
2015 REM 100-190 - CREATE MAZE BY RANDOMLY REMOVING WALLS
2016 REM GOSUB 500 - INITIALIZE A() AND DRAW ROOMS
2017 REM GOSUB 1000 - PROMPT FOR DIMENSIONS OF MAZE
2020 REM DATA STRUCTURE
2021 REM MAZE DIMENSIONS ARE N,M
2022 REM A(0 .. N*M-1) IS THE CONNECTION REGION MAP
2023 REM A( N*M-1 ) IS THE LIST OF UNTRIED WALLS
2024 REM BY PETER PHILLIPS, JANUARY 2001
