10  DIM D(5),K1(8),K2(8),K3(8),S(8,8),Q(8,10),D$(5)
20 Q$ = ".EKB*"
30 D$(0) = "MOTORES DE DOBRA"
40 D$(1) = "SENSORES DE CURTO ALCANCE"
50 D$(2) = "SENSORES DE LONGO ALCANCE"
60 D$(3) = "PHASERS"
70 D$(4) = "TORPEDOS DE FOTON":D$(5) = "REGISTROS GALATICOS"
80 I =  RND ( - ( PEEK (263) +  PEEK (264) * 256) * 2 ^  - 24): REM RANDOMIZE
90  PRINT "INICIALIZANDO..."
100  DEF  FN D(N) =  SQR ((K1(I) - S1) ^ 2 + (K2(I) - S2) ^ 2)
110  GOSUB 610: GOSUB 450:Q1 = X:Q2 = Y:X = 8:Y = 1:X1 = .2075:Y1 = 6.28:X2 = 3.28
120 Y2 = 1.8:A = .96:C = 100:W = 10:K9 = 0:B9 = 0:S9 = 400:T9 = 3451: GOTO 140
130 K = K + (N < X2) + (N < Y2) + (N < .28) + (N < .08) + (N < .03) + (N < .01):K9 = K9 - K: GOTO 160
140 T0 = 3421:T = T0:E0 = 4000:E = E0:P0 = 10:P = P0: FOR I = 0 TO 7
150  FOR J = 0 TO 7:K = 0:N =  RND (Y): IF N < X1 THEN N = N * 64:K = (N < Y1) - Y: GOTO 130
160 B = ( RND (Y) > A):B9 = B9 - B:Q(I,J) = K * C + B * W -  INT ( RND (Y) * X + Y): NEXT J: NEXT I
170  IF K9 > (T9 - T0) THEN T9 = T0 + K9
180  IF B9 > 0 THEN 200
190  GOSUB 450:Q(X,Y) = Q(X,Y) - 10:B9 = 1
200  PRINT  LEFT$ ("STARTREK ADAPTED BY L.E.COCHRAN 2/29/76",8):K0 = K9
210  PRINT "OBJETIVO:"
215  PRINT "DESTRUIR";K9;"BELONAVES KLINGON": PRINT "QUE INVADIRAM A GALAXIA, ANTES": PRINT "QUE CONSIGAM ATACAR O QUARTEL-": PRINT "-GENERAL DA FEDERACAO NA DATA": PRINT "ESTELAR";T9;"."
220  PRINT "ISTO LHE DA'";T9 - T0;"ANOS."
225  PRINT "NA GALAXIA HA'";B9;"BASES ESTELA-": PRINT "RES PARA REABASTECER SUA NAVE."
230 A = 0: IF Q1 < 0 OR Q1 > 7 OR Q2 < 0 OR Q2 > 7 THEN N = 0:S = 0:K = 0: GOTO 250
240 N =  ABS (Q(Q1,Q2)):Q(Q1,Q2) = N:S = N -  INT (N / 10) * 10:K =  INT (N / 100)
250 B =  INT (N / 10 - K * 10): GOSUB 450:S1 = X:S2 = Y
260  FOR I = 0 TO 7: FOR J = 0 TO 7:S(I,J) = 1: NEXT J: NEXT I:S(S1,S2) = 2
270  FOR I = 0 TO 7:K3(I) = 0:X = 8: IF I < K THEN  GOSUB 460:S(X,Y) = 3:K3(I) = S9
280 K1(I) = X:K2(I) = Y: NEXT :I = S
290  IF B > 0 THEN  GOSUB 460:S(X,Y) = 4
300  IF I > 0 THEN  GOSUB 460:S(X,Y) = 5:I = I - 1: GOTO 300
310  GOSUB 550: IF A = 0 THEN  GOSUB 480
320  IF E <  = 0 THEN 1370
330 I = 1: IF D(I) > 0 THEN 620
340  FOR I = 0 TO 7: FOR J = 0 TO 7: PRINT  MID$ (Q$,S(I,J),1);" ";: NEXT J
350  ON I GOTO 380,390,400,410,420,430,440
360  PRINT "ANOS     :";T9 - T
370  NEXT : GOTO 650
380  PRINT "DATA EST.:"; INT (T); CHR$ (8); CHR$ (8): GOTO 370
390  PRINT "CONDICAO :";: INVERSE : PRINT C$; CHR$ (8): NORMAL : GOTO 370
400  PRINT "QUADRANTE:";Q1 + 1; CHR$ (8); - (Q2 + 1); CHR$ (8); CHR$ (8): GOTO 370
410  PRINT "SETOR    :";S1 + 1; CHR$ (8); - (S2 + 1); CHR$ (8); CHR$ (8): GOTO 370
420  PRINT "ENERGIA  :"; INT (E); CHR$ (8); CHR$ (8): GOTO 370
430  PRINT "TORPEDOS :";P; CHR$ (8); CHR$ (8): GOTO 370
440  PRINT "KLINGONS :";K9; CHR$ (8); CHR$ (8): GOTO 370
450 X =  INT ( RND (1) * 8):Y =  INT ( RND (1) * 8): RETURN
460  GOSUB 450: IF S(X,Y) > 1 THEN 460
470  RETURN
480  IF K < 1 THEN  RETURN
490  IF C$ = "ATRAC." THEN  PRINT "A BASE ESTELAR PROTEGE A ENTER-": PRINT "PRISE.": RETURN
500  FOR I = 0 TO 7: IF K3(I) <  = 0 THEN  NEXT : RETURN
510 H = K3(I) * .4 *  RND (1):K3(I) = K3(I) - H:H = H / ( FN D(0) ^ .4):E = E - H
520 E$ = "ENTERPRISE DE":N = E: GOSUB 530: NEXT : RETURN
530  PRINT "DANO DE";H;"UNIDADES EM ";E$;" SETOR";K1(I) + 1; CHR$ (8); - (K2(I) + 1);
540  PRINT "(";N;"RESTANTES)": RETURN
550  FOR I = S1 - 1 TO S1 + 1: FOR J = S2 - 1 TO S2 + 1
560  IF I < 0 OR I > 7 OR J < 0 OR J > 7 THEN 580
570  IF S(I,J) = 4 THEN C$ = "ATRAC.":E = E0:P = P0: GOSUB 610: RETURN
580  NEXT J: NEXT I: IF K > 0 THEN C$ = "VERM.": POKE 245,3: RETURN
590  POKE 245,1: IF E < E0 * .1 THEN C$ = "AMAR.": RETURN
600 C$ = "VERDE": RETURN
610  FOR N = 0 TO 5:D(N) = 0: NEXT : RETURN
620  PRINT D$(I);" DANIFICADOS."
630  PRINT "CONSERTO ESTIMADO EM";D(I);"ANOS."
640  IF A = 1 THEN  RETURN
650  INPUT "COMANDO ";A
660  IF A < 1 OR A > 6 THEN 680
670  ON A GOTO 710,310,1250,1140,690,1300
680  FOR I = 0 TO 5: PRINT I + 1;"= ";D$(I): NEXT : GOTO 650
690  IF D(4) > 0 THEN  PRINT "SUJEIRA ESPACIAL BLOQUEANDO OS": PRINT "TUBOS DE DISPARO.":I = 4: GOTO 630
700 N = 15: IF P < 1 THEN  PRINT "NAO HA MAIS TORPEDOS": GOTO 650
710  PRINT "CURSO";: IF A = 5 THEN  PRINT " DO TORPEDO";
720  INPUT " (1-8.9) ";C: IF C < 1 THEN 650
730  IF C >  = 9 THEN 710
740  IF A = 5 THEN P = P - 1: PRINT "TRAJETO:";: GOTO 900
750  INPUT "DOBRA (0-12) ";W: IF W <  = 0 OR W > 12 THEN 710
760  IF W <  = .2 OR D(0) <  = 0 THEN 780
770 I = 0: PRINT D$(I);" DANIFICADOS,": PRINT "A MAXIMA DOBRA POSSIVEL E' 0.2.": GOSUB 630: GOTO 750
780  GOSUB 480: IF E <  = 0 THEN 1370
790  IF  RND (1) > .25 THEN 870
800 X =  INT ( RND (1) * 6): IF  RND (1) > .5 THEN 830
810 D(X) = D(X) +  INT (6 -  RND (1) * 5): PRINT "**TEMPESTADE ESPACIAL DANIFICOU"
820  PRINT D$(X);"**":I = X: GOSUB 630:D(X) = D(X) + 1: GOTO 870
830  FOR I = X TO 5: IF D(I) > 0 THEN 860
840  NEXT
850  FOR I = 0 TO X: IF D(I) <  = 0 THEN  NEXT : GOTO 870
860 D(I) = .5: PRINT "**SPOCK UTILIZOU UMA NOVA TEC-": PRINT "NICA DE CONSERTO**"
870  FOR I = 0 TO 5: IF D(I) = 0 THEN 890
880 D(I) = D(I) - 1: IF D(I) <  = 0 THEN D(I) = 0: PRINT D$(I);" ESTAO CONSERTADOS!"
890  NEXT :N =  INT (W * 8):E = E - N - N + .5:T = T + 1:S(S1,S2) = 1
900 Y1 = S1 + .5:X1 = S2 + .5: IF T > T9 THEN 1370
910 Y = (C - 1) * .785398:X =  COS (Y):Y =  -  SIN (Y)
920  FOR I = 1 TO N:Y1 = Y1 + Y:X1 = X1 + X:Y2 =  INT (Y1):X2 =  INT (X1)
930  IF X2 < 0 OR X2 > 7 OR Y2 < 0 OR Y2 > 7 THEN 1110
940  IF A = 5 THEN  PRINT Y2 + 1; CHR$ (8); - (X2 + 1);
950  IF S(Y2,X2) = 1 THEN  NEXT : GOTO 1060
960  PRINT : IF A = 1 THEN  PRINT "BLOQUEADA POR ";
970  ON S(Y2,X2) - 3 GOTO 1040,1020
980  PRINT "KLINGON ";: IF A = 1 THEN 1050
990  FOR I = 0 TO 7: IF Y2 <  > K1(I) THEN 1010
1000  IF X2 = K2(I) THEN K3(I) = 0
1010  NEXT :K = K - 1:K9 = K9 - 1: GOTO 1070
1020  PRINT "ESTRELA ";: IF A = 5 THEN S = S - 1: GOTO 1070
1030  GOTO 1050
1040  PRINT "BASE ESTELAR ";: IF A = 5 THEN B = 2: GOTO 1070
1050  PRINT " NO SETOR ";Y2 + 1; CHR$ (8); - (X2 + 1):Y2 =  INT (Y1 - Y):X2 =  INT (X1 - X)
1060 S1 = Y2:S2 = X2:S(S1,S2) = 2:A = 2: GOTO 310
1070  PRINT " DESTRUIDO!";: IF B = 2 THEN B = 0: PRINT ". . .BOM TRABALHO!";
1080  PRINT :S(Y2,X2) = 1:Q(Q1,Q2) = K * 100 + B * 10 + S: IF K9 < 1 THEN 1400
1090  GOSUB 480: IF E <  = 0 THEN 1370
1100  GOSUB 550: GOTO 650
1110  IF A = 5 THEN  PRINT "ERROU!": GOTO 1090
1120 Q1 =  INT (Q1 + W * Y + (S1 + .5) / 8):Q2 =  INT (Q2 + W * X + (S2 + .5) / 8)
1130 Q1 = Q1 - (Q1 < 0) + (Q1 > 7):Q2 = Q2 - (Q2 < 0) + (Q2 > 7): GOTO 230
1140 I = 3: IF D(I) > 0 THEN 620
1150  PRINT "PHASERS PREPARADOS: UNIDADES DE": INPUT "ENERGIA A DISPARAR ";X: IF X <  = 0 THEN 650
1160  IF X > E THEN  PRINT "SO' DISPOMOS DE ";E;".": GOTO 1150
1170 E = E - X:Y = K: FOR I = 0 TO 7: IF K3(I) <  = 0 THEN 1230
1180 H = X / (Y * ( FN D(0) ^ .4)):K3(I) = K3(I) - H
1190 E$ = "KLINGON EM":N = K3(I): GOSUB 530
1200  IF K3(I) > 0 THEN 1230
1210  PRINT "**KLINGON DESTRUIDO**"
1220 K = K - 1:K9 = K9 - 1:S(K1(I),K2(I)) = 1:Q(Q1,Q2) = Q(Q1,Q2) - 100
1230  NEXT : IF K9 < 1 THEN 1400
1240  GOTO 1090
1250 I = 2: IF D(I) > 0 THEN 620
1260  PRINT D$(I);" PARA O QUADRANTE";Q1 + 1; CHR$ (8); - (Q2 + 1)
1270  FOR I = Q1 - 1 TO Q1 + 1: FOR J = Q2 - 1 TO Q2 + 1: PRINT "   ";
1280  IF I < 0 OR I > 7 OR J < 0 OR J > 7 THEN  PRINT "***";: GOTO 1350
1290 Q(I,J) =  ABS (Q(I,J)): GOTO 1335
1300 I = 5: IF D(I) > 0 THEN 620
1310  PRINT "MAPA GALATICO CUMULATIVO PARA A": PRINT "DATA ESTELAR";T
1320  FOR I = 0 TO 7: FOR J = 0 TO 7: IF J THEN  PRINT " ";
1330  IF Q(I,J) < 0 THEN  PRINT "***";: GOTO 1350
1335  IF I = Q1 AND J = Q2 THEN  INVERSE
1340 E$ =  STR$ (Q(I,J)):E$ = "00" +  MID$ (E$,2): PRINT  RIGHT$ (E$,3);
1345  NORMAL
1350  NEXT J: PRINT : NEXT I: GOTO 650
1360  PRINT : PRINT "E' A DATA ESTELAR";T: RETURN
1370  GOSUB 1360: PRINT "GRACAS 'A SUA INEPCIA, A FEDERA-CAO SERA' CONQUISTADA PELOS";K9
1380  PRINT "CRUZADORES KLINGON RESTANTES!"
1390  PRINT "VOCE E' REBAIXADO A CAMAROTEIRO!"; CHR$ (8): GOTO 1430
1400  GOSUB 1360: PRINT "A FEDERACAO FOI SALVA!"
1410  PRINT "VOCE E' PROMOVIDO A ALMIRANTE.": PRINT K0;"KLINGONS EM";
1420  PRINT T - T0;"ANOS.  AVALIACAO="; INT (K0 / (T - T0) * 1000)
1430  INPUT "TENTAR DE NOVO ";E$: IF  LEFT$ (E$,1) = "S" THEN 110
