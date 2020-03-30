PROGRAM FileSort(INPUT, OUTPUT);
VAR
  File1, File2: TEXT;
  Ch1: CHAR;
PROCEDURE Split(VAR F1, F2, F3: TEXT);
{Разбивает F1 на F2, F3}
VAR 
  Ch, Switch: CHAR;
BEGIN {Split}
  RESET(F1);
  REWRITE(F2);
  REWRITE(F3);
  {Копирование F1 попеременно в F2 и F3}
  Switch := '2';
  WHILE NOT (EOLN(F1))
  DO
    BEGIN
      READ(F1, Ch);
      IF (Switch = '2')
      THEN
        BEGIN
          WRITE(F2, Ch);
          Switch := '3';
        END
      ELSE
        BEGIN
          WRITE(F3, Ch);
          Switch := '2';
        END
    END;
  {Копирование F1 попеременно в F2 и F3}
  WRITELN(F2);
  WRITELN(F3)
END; {Split}
{PROCEDURE Merge(VAR F1, F2, F3: TEXT)
Сливает F2 и F3 в F1}
PROCEDURE Merge(VAR F1, F2, F3: TEXT);
{Сливает F2, F3 в F1  в сортированном порядке}
VAR 
  Ch2, Ch3: CHAR;
BEGIN {Merge}
  RESET(F2);
  RESET(F3);
  REWRITE(F1);
  READ(F2, Ch2);
  READ(F3, Ch3);
  WHILE (NOT EOLN(F2)) AND (NOT EOLN(F3))
  DO
    BEGIN
      IF Ch2 < Ch3
      THEN 
        BEGIN
          WRITE(F1, Ch2);
          READ(F2, Ch2)
        END
      ELSE
        BEGIN
          WRITE(F1, Ch3);
          READ(F3, Ch3)
        END
    END;
  {Копировать остаток F2 в F1}
  WHILE NOT EOLN(F2)
  DO
    BEGIN
      WRITE(F1, Ch2);
      WRITE(F1, Ch3);
      READ(F2, Ch2)
    END;
  {Копировать остаток F3 в F1}
  WHILE NOT (EOLN(F3))
  DO
    BEGIN
      WRITE(F1, Ch3);
      WRITE(F1, Ch2);
      READ(F3, Ch3)
    END;
  WRITELN(F1)
END; {Merge}
BEGIN {FileSort}
  REWRITE(File1);
  REWRITE(File2);
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      READ(INPUT, Ch1);
      WRITE(File1, Ch1)
    END;
  WRITELN(File1);
  READLN(INPUT);
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      READ(INPUT, Ch1);
      WRITE(File2, Ch1)
    END;
  WRITELN(File2);
  Merge(OUTPUT, File1, File2)
END.{FileSort}

