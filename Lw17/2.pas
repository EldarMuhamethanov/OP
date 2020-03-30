PROGRAM GetNumber(INPUT, OUTPUT);
VAR 
  Num: INTEGER;
CONST
  MAXINT = 32767;
PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
VAR
  Ch: CHAR;
BEGIN{ReadDigit}
  D := -1;
  IF NOT EOLN(F)
  THEN
    BEGIN
      READ(F, Ch); 
      IF (Ch >= '0') AND (Ch <= '9')
      THEN
        BEGIN
          IF (Ch = '0')
          THEN
            D := 0;
          IF (Ch = '1')
          THEN
            D := 1; 
          IF (Ch = '2')
          THEN
            D := 2;
          IF (Ch = '3')
          THEN
            D := 3;
          IF (Ch = '4')
          THEN
            D := 4;
          IF (Ch = '5')
          THEN
            D := 5;
          IF (Ch = '6')
          THEN
            D := 6;
          IF (Ch = '7')
          THEN
            D := 7;
          IF (Ch = '8')
          THEN
            D := 8;
          IF (Ch = '9')
          THEN
            D := 9              
        END
    END
END;{ReadDigit}
PROCEDURE ReadNumber(VAR F: TEXT; VAR N: INTEGER);
VAR 
  Digit: INTEGER;
  Owerflow: BOOLEAN;
BEGIN{ReadNumber}
  Owerflow := FALSE;
  N := 0;
  ReadDigit(F, Digit);
  WHILE (Digit <> -1)
  DO
    BEGIN
      IF (MAXINT - N >= 29491)
      THEN
        BEGIN
          N := N * 10;
          IF (MAXINT - N >= Digit)
          THEN
            N := N + Digit
          ELSE
            Owerflow := TRUE;
        END
      ELSE
        Owerflow := TRUE;
      ReadDigit(F, Digit)
    END;
  IF Owerflow
  THEN
    N := -1;
END;{ReadNumber}
BEGIN
  ReadNumber(INPUT, Num);
  WRITELN(Num)
END.
