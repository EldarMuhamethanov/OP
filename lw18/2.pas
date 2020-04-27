PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  Min = 0;
  Max = 100;
  NumberOfScores = 4;
  ClassSize = 4;
TYPE
  Score = 0 .. 100;
VAR
  WhichScore: 0 .. NumberOfScores;
  Student: 0 .. ClassSize;
  NextScore: Score;
  Ave, TotalScore, ClassTotal: INTEGER;
  Error, Overflow: BOOLEAN;
PROCEDURE ReadName(VAR FIn, Fout: TEXT); {ReadName}
VAR
  Ch: CHAR;
BEGIN
  WHILE ((NOT EOLN(FIn)) AND (Ch <> ' '))
  DO
    BEGIN
      READ(FIn, Ch);
      WRITE(Fout, Ch)
    END
END; {ReadName}
BEGIN {AverageScore}
  Overflow := FALSE;
  Error := FALSE;
  ClassTotal := 0;
  Student := 0;
  WRITELN('Student averages:');
  WHILE ((Student < ClassSize) AND NOT EOLN AND NOT Overflow AND NOT Error)
  DO 
    BEGIN
      ReadName(INPUT, OUTPUT);
      Student := Student + 1;
      TotalScore := 0;
      WhichScore := 0;
      WHILE ((WhichScore < NumberOfScores) AND NOT Overflow AND NOT EOLN)
      DO
        BEGIN
          READ(NextScore);
          Overflow := ((Max < NextScore) OR (NextScore < Min ));
          IF NOT Overflow
          THEN                                                       
            BEGIN
              WhichScore := WhichScore + 1;
              TotalScore := TotalScore + NextScore
            END
          ELSE
            WRITE('ICORRECT RATING ENTERED')
        END;
      Error := NOT(EOLN AND (WhichScore = NumberOfScores)) AND NOT Overflow;
      IF Error
      THEN
        WRITE('ICORRECT NUMBER OF RATINGS ENTERED');
      IF (NOT Overflow AND NOT Error)
      THEN
        BEGIN
          READLN;
          TotalScore := TotalScore * 10;
          Ave := TotalScore DIV NumberOfScores;
          IF (Ave MOD 10 >= 5)
          THEN
            WRITELN(Ave DIV 10 + 1)
          ELSE
            WRITELN(Ave DIV 10);
          ClassTotal := ClassTotal + TotalScore
        END
    END;
  WRITELN;
  IF (NOT Overflow AND NOT Error)
  THEN
    BEGIN
      WRITELN('Class average:');
      ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
      WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10:1)
    END
END. {AverageScore}
