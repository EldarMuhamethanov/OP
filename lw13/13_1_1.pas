PROGRAM BubbleSort(INPUT, OUTPUT);
  { ��������� ������ ������ INPUT � OUTPUT }
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
  { �������� INPUT � F1 }
  CopyFile(INPUT, F1);
  { �������� F1 � OUTPUT }
  CopyFile(F1, OUTPUT)
END.{ BubbleSort }
