PROGRAM Prime(INPUT, OUTPUT);
CONST
  Max = 100;
VAR
  I, Prime: INTEGER;
  First: BOOLEAN;
  IntSet : SET  OF 0..Max;
BEGIN {Prime}
  IntSet := [2..Max];
  WRITELN('Простые числа в диапазоне от 2 до ', Max, ': ');
  WHILE (IntSet <> [])
  DO
    BEGIN
      I := 2;
      First := TRUE;
      WHILE I <= Max
      DO
        BEGIN
          IF I IN IntSet
          THEN
            BEGIN
              IF First
              THEN
                BEGIN
                  WRITE(I, ', ');
                  Prime := I;
                  IntSet := IntSet - [I];
                  First := FALSE
                END
              ELSE
                BEGIN
                  IF (I MOD Prime = 0)
                  THEN
                    IntSet := IntSet - [I]
                END   
            END;
          I := I + 1
        END
    END
END. {Prime}
