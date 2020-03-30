 PROGRAM Split(INPUT, OUTPUT);
 VAR
   Ch, Next: CHAR;
   Odds, Evens: TEXT;
BEGIN
  REWRITE(Odds);
  REWRITE(Evens);
  Next := 'O';
  READ(INPUT, Ch);
  WHILE Ch <> '#'
  DO
    BEGIN
      WRITELN(OUTPUT, Ch, ' - ', Next); {для проверки}
      IF Next = 'O'
      THEN
        BEGIN
          WRITE(Odds, Ch);
          Next := 'E'
        END
      ELSE
        BEGIN
          WRITE(Evens, Ch);
          Next := 'O'
        END;
      READ(INPUT, Ch)  
    END;
  WRITELN(Odds, '#');
  WRITELN(Evens, '#')
  {копируем Odds в OUTPUT}
  {копируем Evens в OUTPUT}
END.
