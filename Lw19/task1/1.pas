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
PROCEDURE GetPrimeBunch(VAR Bunch: BunchOfNumbers; VAR FOut: TEXT);
{Алгоритм поиска }
VAR
  I, J, Prime: INTEGER;  
BEGIN{GetPrimeNumber}
  I := Min;
  WHILE I * I <= Max
  DO
    BEGIN
      J := I;
      IF J IN Bunch
      THEN
        BEGIN 
          Prime := J;
          J := J + Prime;
          WHILE J <= Max
          DO
            BEGIN
              Bunch := Bunch - [J];  
              J := J + Prime;
            END;
          WRITELN(FOut, 'НА ДАННОМ ЭТАПЕ: ');
          WriteBunch(Bunch, FOut);
        END; 
      I := I + 1; 
    END;
END;{GetPrimeNumber}
BEGIN {isPrime}
  IntSet := [Min..Max];
  GetPrimeBunch(IntSet, OUTPUT)
END. {isPrime}
