PROGRAM SumStr(INPUT, OUTPUT);
VAR
  Digit: INTEGER;
PROCEDURE ReadDigit(Num: INTEGER);
VAR
  Ch: CHAR;
BEGIN{ReadDigit}
  READ(Ch);
  Num := -1;
  IF (Ch >= '0') AND (Ch <= '9')
  THEN
    BEGIN
      IF (Ch = '0')
      THEN
        Num := 0;
      IF (Ch = '1')
      THEN
        Num := 1;
      IF (Ch = '2')
      THEN
        Num := 2;
      IF (Ch = '3')
      THEN
        Num := 3;
      IF (Ch = '4')
      THEN
        Num := 4;
      IF (Ch = '5')
      THEN
        Num := 5;
      IF (Ch = '6')
      THEN
        Num := 6;
      IF (Ch = '7')
      THEN
        Num := 7;
      IF (Ch = '8')
      THEN
        Num := 8;
      IF (Ch = '9')
      THEN
        Num := 9;
    END;
END;{ReadDigit}
BEGIN
  ReadDigit(Digit);
  WRITELN(Digit)
END.
