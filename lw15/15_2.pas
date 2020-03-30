PROGRAM CountReverse(INPUT, OUTPUT);
VAR 
  Ch1, Ch2, Ch3, Hund, Ten, One: CHAR;
USES
  Count;
BEGIN{Count3}
  Start;
  WRITE('бунд: ');
  IF NOT EOLN
  THEN
    BEGIN
      READ(Ch1);
      IF NOT EOLN
      THEN
        BEGIN
          READ(Ch2);
        END
    END;
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch3);
      IF (Ch2 < Ch1) OR (Ch2 > Ch3)
      THEN
        Bump;
      Ch1 := Ch2;
      Ch2 := Ch3
    END;
  Value(Hund, Ten, One);
  WRITELN('йнкхвеярбн пебепянб: ', Hund, Ten, One)
END.{Count3}
