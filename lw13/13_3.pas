PROGRAM Split(INPUT,OUTPUT);
  {Копирует INPUT в OUTPUT,сначала нечетные,а затем четные
   элементы}
VAR
  Ch,Next: CHAR;
  Odds,Evens: TEXT;
{PROCEDURE CopyOut(VAR F1: TEXT; VAR Ch: CHAR);}
PROCEDURE CopyOut(VAR F1: TEXT; VAR Ch: CHAR);
BEGIN{CopyOut}
  {Копируем F1 в OUTPUT}
  RESET(F1);
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      READ(F1, Ch);
      WRITE(OUTPUT, Ch)
    END;
  WRITELN(OUTPUT)
END;{CopyOut}
BEGIN {Split}
  {Разделяет INPUT в Odds и Evens}
  ASSIGN(Odds,'Odds.dat');
  ASSIGN(Evens,'Evens.dat');
  REWRITE(Odds);
  REWRITE(Evens);
  Next := 'O';
  WHILE NOT EOF(INPUT)
  DO
    BEGIN
      WHILE NOT EOLN(INPUT)
      DO
        {Прочитать Ch, записать в файл, выбранный через
         Next,переключить Next}
        BEGIN
          READ(Ch);
          IF Next = 'O'
          THEN
            BEGIN
              Next := 'E';
              WRITE(Odds, Ch)
            END
          ELSE
            BEGIN
              Next := 'O';
              WRITE(Evens, Ch)
            END;           
        END;
      READLN(INPUT);
    END;
  WRITELN(Odds);
  WRITELN(Evens);
  CopyOut(Odds,Ch);
  CopyOut(Evens,Ch);
  WRITELN
END.{Split}

