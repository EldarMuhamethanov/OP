PROGRAM KolSymb(INPUT, OUTPUT);
VAR
  N1, N2, N3, Sym, Full: CHAR;
BEGIN
  N1 := '0';
  N2 := '0';
  N3 := '0';
  Full := '0';
  READ(Sym);
  WHILE Sym <> '#'
  DO
    BEGIN
      IF N3 = '9'
      THEN
        BEGIN
          N3 := '0';
          IF N2 = '9'
          THEN
            BEGIN
              N2 := '0';
              IF N1 = '9'
              THEN
                Full := '1'
              ELSE
                BEGIN
                  IF N1 = '8'
                  THEN
                    N1 := '9';
                  IF N1 = '7'
                  THEN
                    N1 := '8';
                  IF N1 = '6'
                  THEN
                    N1 := '7';
                  IF N1 = '5'
                  THEN
                    N1 := '6';
                  IF N1 = '4'
                  THEN
                    N1 := '5';
                  IF N1 = '3'
                  THEN
                    N1 := '4';
                  IF N1 = '2'
                  THEN
                    N1 := '3';
                  IF N1 = '1'
                  THEN
                    N1 := '2';
                  IF N1 = '0'
                  THEN
                    N1 := '1'
                END;
            END
          ELSE
            BEGIN
              IF N2 = '8'
              THEN
                N2 := '9';
              IF N2 = '7'
              THEN
                N2 := '8';
              IF N2 = '6'
              THEN
                N2 := '7';
              IF N2 = '5'
              THEN
                N2 := '6';
              IF N2 = '4'
              THEN
                N2 := '5';
              IF N2 = '3'
              THEN
                N2 := '4';
              IF N2 = '2'
              THEN
                N2 := '3';
              IF N2 = '1'
              THEN
                N2 := '2';
              IF N2 = '0'
              THEN
                N2 := '1'
            END;
        END
      ELSE
        BEGIN
          IF N3 = '8'
          THEN
            N3 := '9';
          IF N3 = '7'
          THEN
            N3 := '8';
          IF N3 = '6'
          THEN
            N3 := '7';
          IF N3 = '5'
          THEN
            N3 := '6';
          IF N3 = '4'
          THEN
            N3 := '5';
          IF N3 = '3'
          THEN
            N3 := '4';
          IF N3 = '2'
          THEN
            N3 := '3';
          IF N3 = '1'
          THEN
            N3 := '2';
          IF N3 = '0'
          THEN
            N3 := '1'
        END;
      READ(Sym)
    END;
WRITELN;
IF Full = '0'
THEN
  WRITELN('Number of characters is ', N1, N2 , N3);
IF Full = '1'
THEN
  WRITELN('Full')
END.
