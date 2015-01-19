0  REM --------10--------20--------30--------40--------50--------60--------70
1  DATA 33,230,3,34,33,1
2  DATA 62,195,50,32,1,201,221,229,221,33,255,255,221,35,221,57
3  DATA 62,93,221,190,16,32,18,62,221,221,190,17,32,11,229,33
4  DATA 12,4,221,117,10,221,116,11,225,221,225,201,193,209,51,51
5  DATA 50,29,1,183,58,27,1,50,28,1,196,223,221,195,97,221
6  FOR I = 0 TO 69: READ B: POKE 986 + I,B: NEXT I
7  CALL 986
9  CLEAR 512,15535: GOSUB 65000
10  REM INICIALIZA
20 Y = 277:X = 278: REM ENDERECO DAS VARIAVEIS YCORD E XCORD
25 K0 = 283: POKE K0,0: REM ENDERECO DA VARIAVEL KEY0 (INKEY$)
30 A$ =  CHR$ (96):M$ =  CHR$ (97): REM SPRITES
40 MF = 0
50 FU = 100
60 SH = 0
100  REM DESENHA TELA
110  HGR
120  POKE Y,0: POKE X,0: INVERSE :N =  USR (" COMBUSTIVEL "): NORMAL
130  POKE Y,10: POKE X,15:N =  USR ("4 1"): POKE Y,12: POKE X,15:N =  USR ("3 2")
140  SET 132,68: DRAW 25,25: DRAW  - 25,25: DRAW  - 25, - 25: DRAW 25, - 25
150  SET 107,93: DRAW 50,0: SET 132,118: DRAW 0, - 50
200  REM POSICIONA ALIENIGENA
210 AX =  INT ( RND (1) * 32)
220 AY =  INT ( RND (1) * 21) + 1
230  IF AX > 11 THEN  IF AX < 21 THEN  IF AY > 6 THEN  IF AY < 16 THEN 210
240  POKE Y,AY: POKE X,AX:N =  USR (A$)
300  REM DISPARA MISSIL
310  IF MF THEN 400
320  IF  RND (1) < .9 THEN 500
330 MF =  - 1:MY = AY:MX = AX:FY = 11 - MY:FX = 16 - MX
340 B = ( ABS (FY) >  ABS (FX))
350  IF B THEN SY =  SGN (FY):SX =  SGN (FX) *  ABS (FX / FY)
360  IF  NOT B THEN SX =  SGN (FX):SY =  SGN (FY) *  ABS (FY / FX)
400  REM MOVE MISSIL
410  POKE Y,MY: POKE X,MX:N =  USR (" ")
420 MY = MY + SY:MX = MX + SX
430  POKE Y,MY: POKE X,MX:N =  USR (M$)
440  IF MY > 10 THEN  IF MY < 12 THEN  IF MX > 15 THEN  IF MX < 17 THEN 900
500  REM MOVE ALIENIGENA
510 XX = AX:YY = AY:M =  INT ( RND (1) * 4)
520  IF M = 0 THEN  IF AX < 31 THEN XX = AX + 1
522  IF M = 1 THEN  IF AX > 0 THEN XX = AX - 1
524  IF M = 2 THEN  IF AY < 21 THEN YY = AY + 1
526  IF M = 3 THEN  IF AY > 1 THEN YY = AY - 1
530  IF XX > 11 THEN  IF XX < 21 THEN  IF YY > 6 THEN  IF YY < 16 THEN 600
540  POKE Y,AY: POKE X,AX:N =  USR (" ")
550 AY = YY:AX = XX
560  POKE Y,AY: POKE X,AX:N =  USR (A$)
600  REM ACAO DO ESCUDO
610 SS = SH:SH = 0: IF FU THEN I =  PEEK (K0): IF I THEN  POKE K0,0:SH =  VAL ( CHR$ (I)): IF SH > 4 THEN SH = 0
620  IF SH = SS THEN 650
630  IF SH = 1 THEN  SET 132,53: DRAW 40,40
632  IF SH = 2 THEN  SET 172,93: DRAW  - 40,40
634  IF SH = 3 THEN  SET 132,133: DRAW  - 40, - 40
636  IF SH = 4 THEN  SET 92,93: DRAW 40, - 40
640  IF SS = 1 THEN  SET 132,53: UNDRAW 40,40
642  IF SS = 2 THEN  SET 172,93: UNDRAW  - 40,40
644  IF SS = 3 THEN  SET 132,133: UNDRAW  - 40, - 40
646  IF SS = 4 THEN  SET 92,93: UNDRAW 40, - 40
650  IF SH THEN FU = FU - 1: POKE Y,0: POKE X,13: INVERSE :N =  USR ( STR$ (FU) + " "): NORMAL
700  REM APAGA MISSIL INTERCEPTADO
710  IF SH = 0 OR  NOT MF THEN 800
720 B =  ABS (11 -  INT (MY)) +  ABS (16 -  INT (MX)): IF B < 5 OR B > 6 THEN 800
730  IF SH = 1 THEN  IF SX < 0 THEN  IF SY > 0 THEN 750
732  IF SH = 2 THEN  IF SX < 0 THEN  IF SY < 0 THEN 750
734  IF SH = 3 THEN  IF SX > 0 THEN  IF SY < 0 THEN 750
736  IF SH = 4 THEN  IF SX > 0 THEN  IF SY > 0 THEN 750
740  GOTO 800
750 MF = 0: POKE Y,MY: POKE X,MX:N =  USR (" ")
800  REM TELEPORTE DO ALIENIGENA
810  IF  RND (1) > .9 THEN  POKE Y,AY: POKE X,AX:N =  USR (" "): GOTO 200
820  GOTO 300
900  REM FIM DE JOGO
910  HGR : POKE Y,10: POKE X,1: INVERSE :N =  USR ("BANG!  VOCE ESTA SEM PROTECAO!"): NORMAL
64999  END
65000  REM INSTALADOR
65010  TEXT : PRINT "INSTALANDO HGRPRINT. AGUARDE..."
65020  RESTORE 65000
65030  READ E: IF E =  - 1 THEN  RETURN
65040  READ B: IF B =  - 1 THEN 65030
65050  POKE E,B:E = E + 1: GOTO 65040
65100  REM CONFIGURA USR()
65110  DATA 771
65120  DATA 195,176,60,-1
65130  REM ROTINA DE IMPRESSAO EM HGR
65140  DATA 15536
65150  DATA 205,161,232,200,71,35,35,78,35,102,105,229,33,21,1,86,35,94,33,,128,25,235,225,205,134,200,126,214,32,56,41
65160  DATA 229,213,197,38,,111,41,41,41,1,,61,9,58,82,3,214,1,159,47,79,6,8,126,169,18,35,123,198,32,95,122
65170  DATA 206,,87,16,242,193,209,225,19,35,16,207,195,121,200,-1
65180  REM TABELA DE CARACTERES
65190  DATA 15616
65200  DATA ,,,,,,,,16,16,16,16,16,,16,,40,40,40,,,,,,40,40,124,40,124,40,40,
65210  DATA 16,60,80,56,20,120,16,,96,100,8,16,32,76,12,,32,80,80,32,84,72,52,,16,16,16,,,,,
65220  DATA 8,16,32,32,32,16,8,,32,16,8,8,8,16,32,,16,84,56,16,56,84,16,,,16,16,124,16,16,,
65230  DATA ,,,,16,16,32,,,,,124,,,,,,,,,,,16,,,4,8,16,32,64,,
65240  DATA 56,68,76,84,100,68,56,,16,48,16,16,16,16,56,,56,68,4,24,32,64,124,,124,4,8,24,4,68,56,
65250  DATA 8,24,40,72,124,8,8,,124,64,120,4,4,68,56,,28,32,64,120,68,68,56,,124,4,8,16,32,32,32,
65260  DATA 56,68,68,56,68,68,56,,56,68,68,60,4,8,112,,,,16,,16,,,,,,16,,16,16,32,
65270  DATA 8,16,32,64,32,16,8,,,,124,,124,,,,32,16,8,4,8,16,32,,56,68,8,16,16,,16,
65280  DATA 56,68,84,92,88,64,60,,16,40,68,68,124,68,68,,120,68,68,120,68,68,120,,56,68,64,64,64,68,56,
65290  DATA 120,68,68,68,68,68,120,,124,64,64,120,64,64,124,,124,64,64,120,64,64,64,,60,64,64,64,76,68,60,
65300  DATA 68,68,68,124,68,68,68,,56,16,16,16,16,16,56,,4,4,4,4,4,68,56,,68,72,80,96,80,72,68,
65310  DATA 64,64,64,64,64,64,124,,68,108,84,84,68,68,68,,68,68,100,84,76,68,68,,56,68,68,68,68,68,56,
65320  DATA 120,68,68,120,64,64,64,,56,68,68,68,84,72,52,,120,68,68,120,80,72,68,,56,68,64,56,4,68,56,
65330  DATA 124,16,16,16,16,16,16,,68,68,68,68,68,68,56,,68,68,68,68,68,40,16,,68,68,68,84,84,108,68,
65340  DATA 68,68,40,16,40,68,68,,68,68,40,16,16,16,16,,124,4,8,16,32,64,124,,124,96,96,96,96,96,124,
65350  DATA ,64,32,16,8,4,,,124,12,12,12,12,12,124,,,,16,40,68,,,,,,,,,,,127
65360  REM SPRITE DO ALIENIGENA
65361  DATA 60,126,219,219,126,60,90,153
65370  REM SPRITE DO MISSIL
65371  DATA ,,24,60,60,24,,
65535  DATA -1,-1
