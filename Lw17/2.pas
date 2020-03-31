PROGRAM GetNumber(INPUT, OUTPUT);
VAR 
  Num: INTEGER;
CONST
  MaxInt = 32767;
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
          IF (Ch = '1') THEN D := 1 ELSE
          IF (Ch = '2') THEN D := 2 ELSE
          IF (Ch = '3') THEN D := 3 ELSE
          IF (Ch = '4') THEN D := 4 ELSE
          IF (Ch = '5') THEN D := 5 ELSE
          IF (Ch = '6') THEN D := 6 ELSE
          IF (Ch = '7') THEN D := 7 ELSE
          IF (Ch = '8') THEN D := 8 ELSE
          IF (Ch = '9') THEN D := 9 ELSE
          IF (Ch = '0') THEN D := 0 
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
  WHILE (Digit <> -1) AND NOT(Owerflow)
  DO
    BEGIN
      IF (N <= MaxInt DIV 10)
      THEN
        BEGIN
          N := N * 10;
          IF (MaxInt - N >= Digit)
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
BEGIN{GetNumber}
  ReadNumber(INPUT, Num);
  WRITELN(Num)
END.{GetNumber}
