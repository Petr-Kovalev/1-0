CLS : SCREEN 13
LOCATE 1, 15: COLOR 12: PRINT "ВНИМАНИЕ!": LOCATE 3, 1: COLOR 10: PRINT "Прочтите, чтобы разобраться в программе."
LOCATE 5, 1: COLOR 14: PRINT "Суть данной программы заключается в том,чтобы с помощью 100 простых и 10 допол- нительных ходов заполнить квадрат едини-цами."
PRINT "Простой ход заменяет все нули по гори-  зонтали и вертикали на единицы, и нао-  борот, а также меняет центральную цифру.Дополнительный ход работает как и прос- той, но не меняет центральную цифру."
LOCATE 15, 1: PRINT "Клавиши управления: I,J,K,M , а ПРОБЕЛ иA -простой и дополнительный ходы."
COLOR 7: LOCATE 18, 8: PRINT "Примечания автора Петра Ковалева."
COLOR 11: LOCATE 20, 15: PRINT "ПРОЧИТАЛИ ?"
COLOR 12: LOCATE 22, 1: PRINT "Теперь нажмите  ПРОБЕЛ  для начала игры"
LOCATE 23, 10: PRINT "или  X  для отмены."
5  a$ = INKEY$
IF a$ = " " THEN 10
IF a$ = "x" THEN 130 ELSE 5
10 CLS : DIM a(8, 8): p = 8: q = 1: n = 0: m = 0
RANDOMIZE TIMER
FOR i = 1 TO 8
FOR j = 1 TO 8
a(j, i) = INT(RND(1) * 2)
NEXT: NEXT
30 COLOR 15
FOR i = 2 TO 16 STEP 2
FOR j = 2 TO 16 STEP 2
LOCATE i, j: PRINT a(i / 2, j / 2)
NEXT: NEXT
40 LOCATE p * 2, q * 2: COLOR 12: PRINT a(p, q): LOCATE 1, 22: PRINT "Автор: П.Ковалев.": COLOR 10: LOCATE 19, 2: PRINT "Вы сделали"; n; "простых и"; m; "доп.ходов."
LOCATE 5, 25: PRINT "Управление:": COLOR 14: LOCATE 7, 26: PRINT "I - вверх": LOCATE 9, 26: PRINT "M - вниз": LOCATE 11, 26: PRINT "J - влево": LOCATE 13, 26: PRINT "K - вправо": LOCATE 15, 20: PRINT "A-дополнительный ход.": LOCATE 17, 20: PRINT  _
"ПРОБЕЛ - простой ход."
COLOR 3: PSET (10, 1): DRAW "d130r130u130l130"
s = 0
FOR i = 1 TO 8
FOR j = 1 TO 8
IF a(i, j) = 1 THEN s = s + 1
NEXT: NEXT
IF s = 64 THEN COLOR 11: PLAY "L16ccc": LOCATE 21, 6: PRINT "Вы победили!": LOCATE 23, 2: PRINT "Хотите сыгррать еще(y/n)?": GOTO 120
IF n = 100 AND m = 10 THEN COLOR 11: LOCATE 21, 6: PRINT "Вы проиграли!": FOR i = 1 TO 1000000: NEXT: GOTO 130
50 h$ = INKEY$
IF h$ = "" THEN 50
IF h$ = " " AND n < 100 THEN n = n + 1: GOTO 110: IF h$ = " " AND n = 100 THEN 50
IF h$ = "a" AND m < 10 THEN m = m + 1: GOTO 100: IF h$ = "a" AND m = 10 THEN 50
IF h$ = "i" THEN
LOCATE p * 2, q * 2
COLOR 15: PRINT a(p, q): p = p - 1: IF p < 1 THEN p = p + 1: LOCATE p * 2, q * 2: COLOR 12: PRINT a(p, q): GOTO 50 ELSE 40
END IF
IF h$ = "j" THEN LOCATE p * 2, q * 2: COLOR 15: PRINT a(p, q): q = q - 1: IF q < 1 THEN q = q + 1: LOCATE p * 2, q * 2: COLOR 12: PRINT a(p, q): GOTO 50 ELSE 40
IF h$ = "k" THEN LOCATE p * 2, q * 2: COLOR 15: PRINT a(p, q): q = q + 1: IF q > 8 THEN q = q - 1: LOCATE p * 2, q * 2: COLOR 12: PRINT a(p, q): GOTO 50 ELSE 40
IF h$ = "m" THEN LOCATE p * 2, q * 2: COLOR 15: PRINT a(p, q): p = p + 1: IF p > 8 THEN p = p - 1: LOCATE p * 2, q * 2: COLOR 12: PRINT a(p, q): GOTO 50 ELSE 40
IF h$ <> "i" AND h$ <> "j" AND h$ <> "k" AND h$ <> "m" THEN 50
100 IF a(p, q) = 1 THEN a(p, q) = 0 ELSE a(p, q) = 1
110 FOR c = 1 TO 8
IF a(p, c) = 1 THEN a(p, c) = 0 ELSE a(p, c) = 1
IF a(c, q) = 1 THEN a(c, q) = 0 ELSE a(c, q) = 1
NEXT
IF a(p, q) = 1 THEN a(p, q) = 0 ELSE a(p, q) = 1
GOTO 30
120 a$ = INKEY$
IF a$ = "n" THEN 130
IF a$ = "y" THEN 10 ELSE 120
130 END

