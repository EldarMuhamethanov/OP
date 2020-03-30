PROGRAM SelectSort(INPUT, OUTPUT);
{—ортирует символы, предшествующие #, из INPUT в OUTPUT.ѕрограмма выдаст ошибку, если в INPUT отсутствует #}
VAR
  Ch, Min: CHAR;
  F1, F2: TEXT;
BEGIN {SelectSort}
  REWRITE(F1);
  WRITE(OUTPUT, 'INPUT DATA:');
  READ(INPUT, Ch);
  WHILE Ch <> '#'
  DO
    BEGIN
      WRITE(F1, Ch);
      WRITE(OUTPUT, Ch);
      READ(INPUT, Ch)
    END;
  WRITELN(OUTPUT);
  WRITELN(F1, '#');
  //WRITE(OUTPUT, 'SORTED DATA:');
  RESET(F1);
  READ(F1, Ch);
  WHILE Ch <> '#'
  DO { Ch <> С#Т и Ch1 Ц первый символ F1}
    BEGIN 
      REWRITE(F2);
      Min := Ch;
      READ(F1, Ch);
      WRITE('ќ—“ј“ќ  - ');
      WHILE Ch <> '#'
      DO { Ch <> С#Т и Ch1 Ц первый символ F1}
        BEGIN
          IF Ch < Min
          THEN  {Ch Ц минимальный из (Ch, Min)}
            BEGIN
              WRITE(F2, Min);
              WRITE(OUTPUT, Min); {ѕ–ќ¬≈– ј}
              Min := Ch;
            END
          ELSE {Min Ц минимальный из (Ch, Min)}
            BEGIN
              WRITE(F2, Ch);
              WRITE(OUTPUT, Ch); {ѕ–ќ¬≈– ј}
            END;
          READ(F1, Ch)
        END;
      WRITELN(F2, '#');
      WRITELN(OUTPUT);{ѕ–ќ¬≈– ј}
      WRITELN(OUTPUT, 'ћинимальное - ', Min);
      WRITELN(OUTPUT); {ѕ–ќ¬≈– ј}
      RESET(F2);
      REWRITE(F1);
      READ(F2, Ch);
      WHILE Ch <> '#'
      DO
        BEGIN
          WRITE(F1, Ch);
          READ(F2, Ch)
        END;
      WRITELN(F1, '#');
      RESET(F1);
      READ(F1, Ch)
    END;
  WRITELN(OUTPUT);
END. {SelectSort}          
