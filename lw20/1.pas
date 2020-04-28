PROGRAM XPrint(INPUT, OUTPUT);
TYPE
  BunchOfNumbers = SET  OF 1..25;
VAR 
  Ch: CHAR;
PROCEDURE SetBunch(VAR Bunch: BunchOfNumbers; VAR Ch: CHAR);
BEGIN{SetBunch}
  CASE Ch OF
    'A': Bunch := [1, 6, 7, 11, 13, 16, 17, 18, 19, 21, 25];
    'B': Bunch := [1, 2, 3, 4, 6, 10, 11, 12, 13, 14, 16, 20, 21, 22, 23, 24];
    'C': Bunch := [2, 3, 4, 5, 6, 11, 16, 22, 23, 24, 25];
    'D': Bunch := [1, 2, 3, 4, 6, 10, 11, 15, 16, 20, 21, 22, 23, 24];
    'E': Bunch := [1, 2, 3, 4, 5, 6, 11, 12, 13, 14, 15, 16, 21, 22, 23, 24, 25];
    'F': Bunch := [1, 2, 3, 4, 5, 6, 11, 12, 13, 16, 21];
    'G': Bunch := [2, 3, 4, 6, 11, 13, 14, 15, 16, 20, 22, 23, 24];
    'H': Bunch := [1, 5, 6, 10, 11, 12, 13, 14, 15, 16, 20, 21, 25];
    'I': Bunch := [2, 3, 4, 8, 13, 18, 22, 23, 24];
    'J': Bunch := [1, 2, 3, 4, 5, 8, 13, 16, 18, 22];
    'K': Bunch := [1, 4, 6, 8, 11, 12, 16, 18, 21, 24];
    'L': Bunch := [1, 6, 11, 16, 21, 22, 23, 24, 25];
    'M': Bunch := [1, 5, 6, 7, 9, 10, 11, 13, 15, 16, 20, 21, 25];
    'N': Bunch := [1, 5, 6, 7, 10, 11, 13, 15, 16, 19, 20, 21, 25];
    'O': Bunch := [2, 3, 4, 6, 10, 11, 15, 16, 20, 22, 23, 24];
    'P': Bunch := [1, 2, 3, 6, 9, 11, 12, 13, 16, 21];
    'Q': Bunch := [2, 3, 4, 6, 10, 11, 15, 16, 19, 22, 23, 25];
    'R': Bunch := [1, 2, 3, 4, 6, 9, 11, 12, 13, 14, 16, 18, 21, 24];
    'S': Bunch := [2, 3, 4, 5, 6, 12, 13, 14, 20, 21, 22, 23, 24];
    'T': Bunch := [1, 2, 3, 4, 5, 8, 13, 18, 23];
    'U': Bunch := [1, 5, 6, 10, 11, 15, 16, 20, 22, 23, 24];
    'V': Bunch := [1, 5, 7, 9, 12, 14, 18];
    'W': Bunch := [1, 5, 6, 10, 11, 13, 15, 16, 18, 20, 22, 24];
    'X': Bunch := [1, 5, 7, 9, 13, 17, 19, 21, 25];
    'Y': Bunch := [1, 5, 7, 9, 13, 18, 23];
    'Z': Bunch := [1, 2, 3, 4, 5, 9, 13, 17, 21, 22, 23, 24, 25];
    ELSE WRITELN('ERROR')
  END;
END;{SetBunch}
PROCEDURE GraphPrint(VAR Ch: CHAR; VAR FOut: TEXT);
VAR
  LetterBunch: BunchOfNumbers;
  I: INTEGER;
BEGIN{GraphPrint}
  SetBunch(LetterBunch, Ch);
  WRITELN(FOut);
  FOR I := 1 TO 25 DO
    BEGIN
      IF (I IN LetterBunch)
      THEN
        WRITE(FOut, 'X')
      ELSE
        WRITE(FOut, ' ');
      IF (I MOD 5 = 0)
      THEN
        WRITELN(FOut)
    END;    
END;{GraphPrint}
BEGIN{XPrint}
  READ(Ch);
  GraphPrint(Ch, OUTPUT)
END.{XPrint}
