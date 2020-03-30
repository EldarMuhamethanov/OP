PROGRAM GetNumber(INPUT, OUTPUT);
VAR
  Num: INTEGER;
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
  CountDig, Digit, Rank: INTEGER;
BEGIN{ReadNumber}
  CountDig := 0;
  N := 0;
  ReadDigit(F, Digit);
  WHILE (Digit <> -1)
  DO
    BEGIN
      CountDig := CountDig + 1;
      ReadDigit(INPUT, Digit);
    END;
  RESET(F);
  ReadDigit(F, Digit);
  WHILE (Digit <> -1)
  DO
    BEGIN
      Rank:= CountDig - 1;
      WHILE (Rank > 0)
      DO
        BEGIN
          Digit := Digit * 10;
          Rank := Rank -1;
        END;
      N := N + Digit;
      Rank := Rank - 1;
      ReadDigit(F, Digit);
    END;
END;{ReadNumber}
BEGIN
  ReadNumber(INPUT, Num);
  WRITELN(Num)
END.
