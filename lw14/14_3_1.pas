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
BEGIN {FileSort}
  Split(INPUT, File1, File2);
  {Выводим F1}
  RESET(File1);
  WHILE NOT EOLN(File1)
  DO
    BEGIN
      READ(File1, Ch1);
      WRITE(OUTPUT, Ch1)
    END;
  WRITELN(OUTPUT);
  {Выводим F2}
  RESET(File2);
  WHILE NOT EOLN(File2)
  DO
    BEGIN
      READ(File2, Ch1);
      WRITE(OUTPUT, Ch1)
    END
END.{FileSort}

