0  GOTO 100: REM "TUG-A-WAR" - COMPUTE! - ABRIL DE 1986 - ADAPTADO EM FORMATO TEXTO PARA MC-1000 POR ENSJO ABRIL DE 2014
1  POKE 910,0: PRINT  CHR$ (27);"="; CHR$ (Y); CHR$ (X + 32);: RETURN 
2 Y = 7:X = P * 3: GOSUB 1: PRINT "()";: RETURN 
3 Y = 7:X = P * 3: GOSUB 1: PRINT "  ";: RETURN 
4 Y = 8:X = I * 3: GOSUB 1: INVERSE : PRINT M$(A(I));: NORMAL : RETURN 
5  POKE 283,0
6 I =  PEEK (283): IF I THEN T$ =  CHR$ (I): RETURN 
7  GOTO 6
8  TEXT : HOME : INVERSE : PRINT "TUG-A-WAR  (COMPUTE! ABRIL 1986)";: NORMAL : PRINT "      VERSAO PARA MC-1000": INVERSE : PRINT " POR EMERSON COSTA (ABRIL 2014) ";: NORMAL : RETURN 
9  FOR I = 1 TO 1000: NEXT : RETURN 
100  REM INICIALIZACAO
110 P = 5:J = 1:V = 0
120  DIM A(10): FOR I = 0 TO 10:A(I) =  INT ( RND (1) * 4): NEXT I
130  DIM M$(3):M$(0) = "<2":M$(1) = "<1":M$(2) = "1>":M$(3) = "2>"
140  DIM M(3):M(0) =  - 2:M(1) =  - 1:M(2) =  + 1:M(3) =  + 2
200  REM TELA
210  GOSUB 8
220  GOSUB 2
230  FOR I = 0 TO 10: GOSUB 4: NEXT I
300  REM RECEBE SELECAO DO JOGADOR
310 Y = 12:X = 0: GOSUB 1: PRINT "JOGADOR";J;".";
320 Y = 9:X = 0: GOSUB 1
330  IF J = 1 THEN  PRINT "1  2  3  4  5  6  7  8  9  0  A";
340  IF J = 2 THEN  PRINT "A  0  9  8  7  6  5  4  3  2  1";
350 Y = 14:X = 0: GOSUB 1: PRINT "SELECIONE A CASA ATE A QUAL DE-": PRINT "SEJA ALTERAR OS VALORES.";
360  GOSUB 5: IF  NOT (T$ >  = "0" AND T$ <  = "9" OR T$ = "A") THEN 360
370 M =  VAL (T$) - 1
380  IF T$ = "0" THEN M = 9
390  IF T$ = "A" THEN M = 10
400  IF J = 2 THEN M = 10 - M
410 Y = 10:X = M * 3: GOSUB 1: PRINT "^";
420 Y = 14:X = 0: GOSUB 1: PRINT  SPC( 63);
500  REM ALTERA CASAS SELECIONADAS
510  IF J = 1 THEN P1 = 0:P2 = M:S = 1
520  IF J = 2 THEN P1 = 10:P2 = M:S =  - 1
530  FOR I = P1 TO P2 STEP S:A(I) = (A(I) + 1) AND 3: GOSUB 4: NEXT I
540  IF J = 1 THEN  IF M < P THEN 700
550  IF J = 2 THEN  IF M > P THEN 700
560  REM MOVE BOLA
570 Y = 14:X = 0: GOSUB 1: PRINT "A CASA DA BOLA FOI ALTERADA.": PRINT "ELA SE MOVE (" + M$(A(P)) + ").";
580  GOSUB 3
590 P = P + M(A(P))
600  IF P < 0 OR P > 10 THEN V = J
610  IF V = 0 THEN  GOSUB 2
620  GOSUB 9
630 Y = 14:X = 0: GOSUB 1: PRINT  SPC( 63);
640  IF V THEN 800
700  REM PROXIMO JOGADOR
710 Y = 10:X = M * 3: GOSUB 1: PRINT " ";
720 J = J + 1: IF J = 3 THEN J = 1
730  GOTO 300
800  REM VITORIA
810 Y = 14:X = 0: GOSUB 1: PRINT "CONSEGUISTE TRAZER A BOLA PARA": PRINT "TEU LADO. VITORIA!!!";
820  GOSUB 9
830 Y = 3:X = 0: GOSUB 1: END 
