10 PRINT "LOCALIZE O INICIO DO ARQUIVO NA FITA E PRESSIONE PLAY."
20 CALL 49506
30 PRINT "NOME DO ARQUIVO: ";
40 INVERSE
50 FOR A = 0 TO 13
60 C = PEEK(383 + A)
70 IF C = 13 THEN 100
80 PRINT CHR$(C);
90 NEXT A
100 NORMAL
110 PRINT
120 INPUT "ENTER PARA PROXIMO ARQUIVO, CTRL+C PARA PARAR"; X$
130 RUN