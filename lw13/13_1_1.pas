PROGRAM BubbleSort(INPUT, OUTPUT);
  { Сортируем первую строку INPUT в OUTPUT }
VAR
  Sorted, Ch, Ch1, Ch2: CHAR;
  F1, F2: TEXT;
PROCEDURE CopyFile(VAR C1, C2: TEXT);
VAR
  Ch: CHAR;
BEGIN
  RESET(C1);
  REWRITE(C2);
  WHILE NOT EOLN(C1)
  DO
    BEGIN
      READ(C1, Ch);
      WRITE(C2, Ch)
    END
END;
BEGIN { BubbleSort }
  { Копируем INPUT в F1 }
  CopyFile(INPUT, F1);
  { Копируем F1 в OUTPUT }
  CopyFile(F1, OUTPUT)
END.{ BubbleSort }
