10  REM ******
20  REM * BOMBER
30  REM * WM V R SMITH
40  REM * ARTSCI INC
50  REM ******
51  REM * ADAPTADO PARA MC-1000
52  REM * POR EMERSON COSTA
53  REM * ABRIL 2014
54  REM ******
60  GOSUB 820: TEMPO 150,2,1: GR : COLOR  = 2
70 PX = 2
80  PLOT 0,30 TO 110,30
89  POKE 283,0
90  GOSUB 180
100  GOSUB 360
110  IF BA = 1 THEN  GOSUB 520: GOTO 90
120  IF  PEEK (283) = 0 THEN 90
130 BX = PX:BY = U + 3
140 B = B + 1
150  GOSUB 520
160 BA = 1
170  GOTO 90
180 PX = PX - 2
190  IF PX < 2 THEN 270
200  UNPLOT PX + 7,U TO PX + 7,U + 2
210  UNPLOT PX + 6,U TO PX + 6,U + 2
220  PLOT PX + 5,U TO PX + 5,U + 2
230  PLOT PX,U + 2
240  PLOT PX + 1,U + 2
250  PLOT PX + 4,U + 1
260  RETURN 
270  UNPLOT PX,U + 2 TO PX + 7,U + 2
280  UNPLOT PX,U + 1 TO PX + 7,U + 1
290  UNPLOT PX + 7,U
300 PX = 100
310 U =  INT (( RND (1) * 50) / 3)
320  IF U > 23 THEN U = 23
330  PLOT PX,U + 2 TO PX + 5,U + 2
340  PLOT PX + 4,U + 1
350  GOTO 180
360 TX = TX + 1
370  IF TX > 100 THEN 460
380  UNPLOT TX,27 TO TX,29
390  UNPLOT TX + 1,27: UNPLOT TX + 1,29
400  UNPLOT TX + 3,29
410  PLOT TX + 1,29
420  PLOT TX + 5,28
430  PLOT TX + 4,27
440  PLOT TX + 4,29
450  RETURN 
460  FOR S = 27 TO 29
470  UNPLOT TX,S TO TX + 6,S
480  NEXT 
490 TX = 1
500  GOTO 360
510  RETURN 
520  UNPLOT BX,BY TO BX + 1,BY
530 BY = BY + 1
540 BX = BX - ( INT ((30 - BY) / 10))
550  PLOT BX,BY TO BX + 1,BY
560 S =  INT (BY / 3)
570  IF S <  > OS THEN  SOUND 96 + S,10,1
580 OS = S
590  IF BY = 28 THEN 610
600  RETURN 
610  FOR S = 1 TO 3
620  FOR Q = 1 TO 0 STEP  - 1: COLOR  = Q
630  PLOT BX,29 TO BX - 3,24
640  PLOT BX,29 TO BX,24
650  PLOT BX,29 TO BX + 3,24
660  NEXT Q
670  NEXT S
675  COLOR  = 2
680 BA = 0
690 E = TX + 3:E =  ABS (E - BX)
700  IF E > 5 THEN 730
710  SOUND 64 + 5,5,1
720 H = H + 1
730  SOUND 0,0,1
740 X$ =  STR$ (H) + "/" +  STR$ (B): GOSUB 1000
750  FOR T = 1 TO 10
760  GOSUB 180
770  GOSUB 370
780  NEXT T
790  FOR S = 0 TO 4: UNPLOT 0,32 + S TO 110,32 + S: NEXT S
795  POKE 283,0
800  RETURN 
820  TEXT : HOME 
830  PRINT "PATRULHA AEREA": PRINT 
840  PRINT "TU ES UM PILOTO"
850  PRINT "DE CACA.";
859  POKE 283,0
860  IF  PEEK (283) = 0 THEN 860
870  HOME 
880  PRINT "TUA MISSAO:"
890  PRINT "BOMBARDEAR TANQUES!!"
900  PRINT "USA QUALQUER TECLA"
910  PRINT "PARA DISPARAR.";
919  POKE 283,0
920  IF  PEEK (283) = 0 THEN 920
930  RETURN 
1000 X = 0:Y = 32
1010  FOR S = 1 TO  LEN (X$)
1020 C$ =  MID$ (X$,S,1)
1030  IF C$ = "/" THEN  SET X,Y + 4: DRAW 2, - 4:X = X + 4: GOTO 1050
1040  IF C$ >  = "0" THEN  ON  VAL (C$) + 1 GOSUB 1070,1080,1090,1100,1110,1120,1130,1140,1150,1160
1050  NEXT S
1060  RETURN 
1070  SET X,Y: DRAW 0,4: DRAW 2,0: DRAW 0, - 4: DRAW  - 1,0:X = X + 4: RETURN 
1080  SET X,Y: DRAW 0,4: DRAW 1,0: UNDRAW 1, - 4:X = X + 2: RETURN 
1090  SET X,Y: DRAW 2,0: DRAW 0,2: DRAW  - 2,0: DRAW 0,2: DRAW 2,0:X = X + 4: RETURN 
1100  SET X,Y: DRAW 2,0: DRAW 0,4: DRAW  - 2,0: SET X,Y + 2: DRAW 1,0:X = X + 4: RETURN 
1110  SET X,Y: DRAW 0,2: DRAW 1,0: SET X + 2,Y: DRAW 0,4:X = X + 4: RETURN 
1120  SET X + 2,Y: DRAW  - 2,0: DRAW 0,2: DRAW 2,0: DRAW 0,2: DRAW  - 2,0:X = X + 4: RETURN 
1130  SET X + 2,Y: DRAW  - 2,0: DRAW 0,4: DRAW 2,0: DRAW 0, - 2: DRAW  - 1,0:X = X + 4: RETURN 
1140  SET X,Y: DRAW 2,0: DRAW 0,4:X = X + 4: RETURN 
1150  SET X,Y: DRAW 0,4: DRAW 2,0: DRAW 0, - 4: DRAW  - 1,0: PLOT X + 1,Y + 2:X = X + 4: RETURN 
1160  SET X,Y + 4: DRAW 2,0: DRAW 0, - 4: DRAW  - 2,0: DRAW 0,2: DRAW 1,0:X = X + 4: RETURN 