PROGRAM isPrime(INPUT, OUTPUT);
CONST
  Max = 100;
  Min = 2;
TYPE
  BunchOfNumbers = SET  OF Min..Max;
VAR
  IntSet: BunchOfNumbers;
PROCEDURE WriteBunch(VAR Bunch: BunchOfNumbers; VAR FOut: TEXT);
{Выводит в файл множество}
VAR
  J: INTEGER;
BEGIN{WriteBunch}
  J := Min;
  WRITE(FOut, '{ ');
  WHILE J <= Max
  DO
    BEGIN
      IF J IN Bunch
      THEN
         WRITE(FOut, J, ' ');
      J := J + 1
    END;
  WRITELN(FOut, '}')
END;{WriteBunch}
PROCEDURE GetPrimeNumber(VAR Bunch: BunchOfNumbers; VAR FOut: TEXT);
{Алгоритм поиска }
VAR
  I, J, Prime: INTEGER;  
BEGIN{GetPrimeNumber}
  I := 2;
  WHILE I * I <= Max
  DO
    BEGIN
      J := I;
      IF J IN IntSet
      THEN
        BEGIN 
          Prime := J;
          WHILE J <= Max
          DO
            BEGIN
              IF J IN IntSet
              THEN
                BEGIN
                  IF (J MOD Prime = 0)
                  THEN
                    IntSet := IntSet - [J]  
                END;
              J := J + 1
            END;
          WRITELN(FOut, 'НА ДАННОМ ЭТАПЕ: ');
          WriteBunch(IntSet, FOut);
        END; 
      I := I + 1; 
    END;
END;{GetPrimeNumber}
BEGIN {isPrime}
  IntSet := [Min..Max];
  GetPrimeNumber(IntSet, OUTPUT)
END. {isPrime}
