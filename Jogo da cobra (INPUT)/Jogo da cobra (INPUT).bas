0  REM--------10--------20--------30--------40--------50--------60--------70
1  DATA 33,230,3,34,33,1
2  DATA 62,195,50,32,1,201,221,229,221,33,255,255,221,35,221,57
3  DATA 62,93,221,190,16,32,18,62,221,221,190,17,32,11,229,33
4  DATA 12,4,221,117,10,221,116,11,225,221,225,201,193,209,51,51
5  DATA 50,29,1,183,58,27,1,50,28,1,196,223,221,195,97,221
6  FOR I = 0 TO 69: READ B: POKE 986 + I,B: NEXT I
7  CALL 986
10 M = 512: DIM B(M)
11 VR = 32768: REM ENDERECO DE INICIO DA VRAM
12 AT$ =  CHR$ (27) + "=": REM POSICIONAMENTO DO CURSOR
13 K0 = 283: REM KEY0 CONTEM CODIGO DA ULTIMA TECLA PRESSIONADA
14 K2 = K0 + 2: REM KEY0+2 INDICA SE A TECLA ESTA PRESSIONADA NO MOMENTO
20  GOSUB 600
30  GOTO 500
100  IF  PEEK (K2) THEN K$ =  CHR$ ( PEEK (K0)): IF K$ = "S" OR K$ = "X" OR K$ = "Z" OR K$ = "C" THEN 110
105 K$ = L$
110 NP = B(H) - 32 *  ABS (K$ = "S") + 32 *  ABS (K$ = "X") -  ABS (K$ = "Z") +  ABS (K$ = "C")
120 TE =  PEEK (NP)
130  IF TE = FG OR TE = HC OR TE = BC OR NP < VR + 32 THEN  POKE NP,HC:E = 1
140 L$ = K$: RETURN
200 R =  INT ( RND (1) * 9) + 1:RX =  INT ( RND (1) * 13) + 2:RY =  INT ( RND (1) * 29) + 2:RP = RX * 32 + RY
210  OUT 128,0: IF  PEEK (VR + RP) <  > BG THEN 200
220  POKE VR + RP, ASC ("0") + R:P = 1: RETURN
250 R = R - 1: IF R = 0 THEN  POKE VR + RP,BG:P = 0: RETURN
255  OUT 128,0: POKE VR + RP, ASC ("0") + R: RETURN
300 SC = SC + R: PRINT AT$; CHR$ (0); CHR$ (32 + 21);: INVERSE : PRINT SC: NORMAL :P = 0
310 SL = SL + 1: OUT 128,0: POKE NP,BC
320 H = H - 1: IF H = 0 THEN H = M
330 B(H) = NP
340  FOR J = 1 TO R
350 R$ = "PLAY L255CEF"
360  GOSUB 100: IF E = 1 THEN 800
370 H = H - 1: IF H = 0 THEN H = M
380 B(H) = NP: POKE NP,BC
390  NEXT
400  POKE NP,HC: RETURN
500  IF P = 0 THEN  GOSUB 200: GOTO 510
505  IF  INT ( RND (1) * 159) + 1 < SL THEN  GOSUB 250
510  GOSUB 100: IF E = 1 THEN 800
520  IF TE =  ASC ("0") + R THEN  POKE B(H),BC: GOSUB 300
530  POKE B(H),BC: POKE B(T),BG
540 H = H - 1: IF H = 0 THEN H = M
550 T = T - 1: IF T = 0 THEN T = M
560 B(H) = NP: POKE NP,HC
570  GOTO 500
600 BG = 32:FG = 128 + 32:L$ = "S":P = 0:SC = 0:SL = 1:E = 0
620  HOME
630  POKE 304,201: REM CURSOR SEM PISCAR
640  POKE 247,202: POKE 248,192: POKE 249,202: POKE 250,192: CALL 52013: REM CURSOR INVISIVEL
650  OUT 128,0: FOR J = VR TO VR + 31:R$ = "PLAY T255L255O4AG": POKE J,FG: POKE J + 480,FG: NEXT : FOR J = VR + 32 TO VR + 32 * 14 STEP 32:R$ = "PLAY O2DA": POKE J,FG: POKE J + 31,FG: NEXT
660  PRINT AT$; CHR$ (0); CHR$ (32 + 3);: INVERSE : PRINT "RECORDE=";HS: NORMAL : PRINT AT$; CHR$ (0); CHR$ (32 + 15);: INVERSE : PRINT "SCORE= 0": NORMAL
670 HC =  ASC ("*") + 128:BC =  ASC ("#") + 128:T = 3:H = 1
680 B(1) = VR + 239: POKE B(1),HC
690 B(2) = VR + 271: POKE B(2),BC
700 B(3) = VR + 303: POKE B(3),BC
710  RETURN
800  TEXT : HOME :R$ = "PLAY O1ACDEFGACDEFG": FOR K = 1 TO 408: PRINT " FORA!! ";: NEXT :R$ = "PLAY O4ABCDEFGO3ABCDEFGO2ABCDEFG"
810  IF HS < SC THEN HS = SC
820  HOME : PRINT AT$; CHR$ (2); CHR$ (32 + 9);"SCORE   =";SC: PRINT AT$; CHR$ (7); CHR$ (32 + 0);"   RECORDE =";HS
830  PRINT AT$; CHR$ (14); CHR$ (32 + 0);"PRESSIONE QUALQUER TECLA PARA   RECOMECAR.";
840  IF  PEEK (K2) = 0 THEN 840
850  GOTO 20
