PROGRAM BubbleSort(INPUT, OUTPUT);
  { Сортируем первую строку INPUT в OUTPUT }
VAR
  F1, F2: TEXT;
PROCEDURE CopyFile(VAR C1, C2: TEXT);
VAR
  Ch: CHAR;
BEGIN{CopyFile}
  RESET(C1);
  REWRITE(C2);
  WHILE NOT EOLN(C1)
  DO
    BEGIN
      READ(C1, Ch);
      WRITE(C2, Ch)
    END;
  WRITELN(C2)
END;{CopyFile}

PROCEDURE Sort(VAR S1, S2: TEXT);
VAR
  Sorted, Ch1, Ch2: CHAR;
BEGIN{Sort}
  Sorted := 'Y';
  RESET(S1);
  REWRITE(S2);
  IF NOT EOLN(S1)
  THEN
    BEGIN
      READ(S1, Ch1);
      WHILE NOT EOLN(S1)
      DO
        BEGIN
          READ(S1, Ch2);
          IF Ch1 <= Ch2
          THEN
            BEGIN
              WRITE(S2, Ch1);
              Ch1 := Ch2
            END
          ELSE
            BEGIN
              WRITE(S2, Ch2);
              Sorted := 'N'
            END
        END;
      WRITELN(S2, Ch1)
    END;
  WRITELN(OUTPUT, Sorted)
END;{Sort}

BEGIN { BubbleSort }
  CopyFile(INPUT, F1);{ Копируем INPUT в F1 }
  Sort(F1, F2)
  //CopyFile(F1, OUTPUT){ Копируем F1 в OUTPUT }
END.{ BubbleSort }

