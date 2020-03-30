PROGRAM KolSim(INPUT, OUTPUT);
VAR
  Ch1, Ch2, Ch3, Sim: CHAR;
BEGIN
  READ(Sim);
  Ch1 := '0';
  Ch2 := '0';
  Ch3 := '0';
  WHILE Sim <> '#'
  DO
    BEGIN
      Ch3 := Chr(Ord(Ch3) + 1);
      IF Ord(Ch3) = 58
      THEN
        BEGIN
          Ch3 := Chr(Ord(Ch3) - 10);
          Ch2 := Chr(Ord(Ch2) + 1);
        END;
      IF Ord(Ch2) = 58
      THEN
        BEGIN
          Ch2 := Chr(Ord(Ch2) - 10);
          Ch1 := Chr(Ord(Ch1) + 1)
        END;
      READ(Sim)
    END;
  WRITELN;
  WRITELN('Number of characters is ', Ch1, Ch2, Ch3)
END.