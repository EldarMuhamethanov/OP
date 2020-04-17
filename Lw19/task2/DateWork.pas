UNIT DateWork;
INTERFACE
TYPE
  Month = (NoMonth, Jan, Feb, Mar, Apr, May, Jun,
                    Jul, Aug, Sep, Oct, Nov, Dec);
  DayNum = 1..31;
  Date   = RECORD
             Mo : Month;
             Day: DayNum
           END;
  FileOfDate = FILE OF Date;
  PROCEDURE ReadDate(VAR FIn: TEXT; VAR Result: Date);{Считывает дату из файла}
  PROCEDURE WriteDate(VAR FOut: TEXT; VAR Result: Date);{Выводит дату в файл}
  PROCEDURE WriteMonth(VAR FOut: TEXT; VAR Mo: Month);{Выводит месяц в файл}
  PROCEDURE ReadMonth(VAR FIn: TEXT; VAR Mo: Month);{Считывает месяц из файла}  
  PROCEDURE CopyOut(VAR DateFile: FileOfDate);{Копирует файл в OUTPUT}
  FUNCTION Less(VAR D1, D2: Date): BOOLEAN;{Определяет меньшую дату}
IMPLEMENTATION
  PROCEDURE WriteDate(VAR FOut: TEXT; VAR Result: Date);
  {Result.Mo = MMM, Result.Day = DD => 'MMM DD' }
  BEGIN{WriteDate}
    WriteMonth(FOut, Result.Mo);
    WRITE(FOut, Result.Day : 3)
  END;{WriteDate}
  
  PROCEDURE WriteMonth(VAR FOut: TEXT; VAR Mo: Month);
  {Result.Mo = MMM => 'MMM'}
  BEGIN {WriteMonth}
    IF Mo = Jan THEN WRITE(FOut, 'JAN') ELSE
    IF Mo = Feb THEN WRITE(FOut, 'FEB') ELSE
    IF Mo = Mar THEN WRITE(FOut, 'MAR') ELSE
    IF Mo = Apr THEN WRITE(FOut, 'APR') ELSE
    IF Mo = May THEN WRITE(FOut, 'MAY') ELSE
    IF Mo = Jun THEN WRITE(FOut, 'JUN') ELSE
    IF Mo = Jul THEN WRITE(FOut, 'JUL') ELSE
    IF Mo = Aug THEN WRITE(FOut, 'AUG') ELSE
    IF Mo = Sep THEN WRITE(FOut, 'SEP') ELSE
    IF Mo = Oct THEN WRITE(FOut, 'OCT') ELSE
    IF Mo = Nov THEN WRITE(FOut, 'NOV') ELSE
    IF Mo = Dec THEN WRITE(FOut, 'DEC')
      ELSE WRITE(FOut, 'NoMonth')
  END; {WriteMonth}
  
  PROCEDURE ReadDate (VAR FIn: TEXT; VAR Result: Date);
  {'MMM/ +/DD' => Result.Mo = MMM, Result.Day = DD }
  BEGIN{ReadDate}
    ReadMonth(FIn, Result.Mo);
    READ(FIn, Result.Day)
  END;{ReadDate}
  
  PROCEDURE ReadMonth(VAR FIn: TEXT; VAR Mo: Month);
  {'MMM/ +/DD' => Result.Mo = MMM}
  VAR
    Ch1, Ch2, Ch3: CHAR;
  BEGIN{ReadMonth}
    Mo := NoMonth;
    IF NOT EOLN(FIn)
    THEN 
      READ(FIn, Ch1);
    IF NOT EOLN(FIn)
    THEN 
      READ(FIn, Ch2);
    IF NOT EOLN(FIn)
    THEN
      BEGIN 
        READ(FIn, Ch3);
        IF (Ch1 = 'J') AND (Ch2 = 'A') AND (Ch3 = 'N') THEN Mo := JAN ELSE
        IF (Ch1 = 'F') AND (Ch2 = 'E') AND (Ch3 = 'B') THEN Mo := FEB ELSE
        IF (Ch1 = 'M') AND (Ch2 = 'A') AND (Ch3 = 'R') THEN Mo := MAR ELSE
        IF (Ch1 = 'A') AND (Ch2 = 'P') AND (Ch3 = 'R') THEN Mo := APR ELSE
        IF (Ch1 = 'M') AND (Ch2 = 'A') AND (Ch3 = 'Y') THEN Mo := MAY ELSE
        IF (Ch1 = 'J') AND (Ch2 = 'U') AND (Ch3 = 'N') THEN Mo := JUN ELSE
        IF (Ch1 = 'J') AND (Ch2 = 'U') AND (Ch3 = 'L') THEN Mo := JUL ELSE
        IF (Ch1 = 'A') AND (Ch2 = 'U') AND (Ch3 = 'G') THEN Mo := AUG ELSE
        IF (Ch1 = 'S') AND (Ch2 = 'E') AND (Ch3 = 'P') THEN Mo := SEP ELSE
        IF (Ch1 = 'O') AND (Ch2 = 'C') AND (Ch3 = 'T') THEN Mo := OCT ELSE
        IF (Ch1 = 'N') AND (Ch2 = 'O') AND (Ch3 = 'V') THEN Mo := NOV ELSE
        IF (Ch1 = 'D') AND (Ch2 = 'E') AND (Ch3 = 'C') THEN Mo := DEC
      END
  END;{ReadMonth}
   
  PROCEDURE CopyOut(VAR DateFile: FileOfDate);
  {DateFile => OUTPUT/}
  VAR
    VarDate: Date;
  BEGIN {CopyOut}
    WHILE NOT EOF(DateFile)
    DO
      BEGIN
        READ(DateFile, VarDate);
        WriteDate(OUTPUT, VarDate);
        WRITELN(OUTPUT)
      END
  END;{CopyOut}
  FUNCTION Less(VAR D1, D2: Date): BOOLEAN;
  {Less:= D1 < D2}
  BEGIN {Less}
    IF D1.Mo < D2.Mo
    THEN
      Less := TRUE
    ELSE
      IF D1.Mo > D2.Mo
      THEN
        Less := FALSE
      ELSE {D1.Mo = D2.Mo}
        Less := (D1.Day < D2.Day)
  END; {Less}
END.
