PROGRAM Less(INPUT, OUTPUT);
VAR
  Ch: CHAR;
BEGIN
  READ(Ch);
  WRITELN('YOUR MESSAGE WITHOUT SPACE');
  WHILE Ch <> '#'
  DO
    BEGIN
      IF Ch <> ' '
      THEN
        WRITE(Ch);
      READ(Ch)
    END;
  WRITELN
END.
