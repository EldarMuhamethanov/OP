PROGRAM KolSim(INPUT, OUTPUT);
VAR
  N1, N2, N2C, N3C, N3, Sim, Full: CHAR;
BEGIN
  READ(Sim);
  N1 := '0';
  N2 := '0';
  N3 := '0';
  Full := ' ';
  N2C := '2';
  N3C := '2';
  WHILE Sim <> '#'
  DO
    BEGIN
      IF N1 = '0'
      THEN
        N1 := '1'
      ELSE
        IF N1 = '1'
        THEN
          N1 := '2'
        ELSE
          IF N1 = '2'
          THEN
            N1 := '3'
          ELSE
            IF N1 = '3'
            THEN
              N1 := '4'
            ELSE
              IF N1 = '4'
              THEN
                N1 := '5'
              ELSE
                IF N1 = '5'
                THEN
                  N1 := '6'
                ELSE
                  IF N1 = '6'
                  THEN
                    N1 := '7'
                  ELSE
                    IF N1 = '7'
                    THEN
                      N1 := '8'
                    ELSE
                      IF N1 = '8'
                      THEN
                        N1 := '9'
                      ELSE
                        IF N1 = '9'
                        THEN
                          BEGIN
                            N1 := '0';
                            IF N2 = '8'
                            THEN
                              BEGIN
                                N2 := '9';
                                N2C := '1';
                              END;
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
                              N2 := '1';
                            IF (N2 = '9' OR N2C = '2')
                            THEN
                              BEGIN
                                N2 := '0';
                                IF N3 = '8'
                                THEN
                                  BEGIN
                                    N3 := '9';
                                    N3C := '1'
                                  END
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
                                  N3 := '1';
                                IF (N3 = '9' AND N3C = '2')
                                THEN
                                  Full := '1';
                                IF N3C = '1'
                                THEN
                                  N3C := '2'
                              END;
                            IF N2C = '1'
                            THEN
                              N2C := '2'
                          END;
      READ(Sim)
    END;
  WRITELN;
  IF Full = ' '
  THEN
    WRITE('Number of characters is ', N3, N2, N1)
  ELSE
    WRITE('Number Is Full')
END.
