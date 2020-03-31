PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;
  ClassSize = 4;
TYPE
  Score = 0 .. 100;
VAR
  WhichScore: 1 .. NumberOfScores;
  Student: 1 .. ClassSize;
  NextScore: Score;
  Ave, TotalScore, ClassTotal: INTEGER;
  Error: BOOLEAN;
BEGIN {AverageScore}
  ClassTotal := 0;
  WRITELN('Student averages:');
  Student := 1;
  Error := FALSE;
  WHILE (Student < ClassSize + 1) AND NOT(Error)
  DO 
    BEGIN
      TotalScore := 0;
      WhichScore := 1;
      WHILE (WhichScore < NumberOfScores + 1) AND NOT(Error)
      DO
        BEGIN
          IF NOT EOLN
          THEN
            READ(NextScore)
          ELSE
            Error := TRUE;
          TotalScore := TotalScore + NextScore;
          WhichScore := WhichScore + 1
        END;
      READLN;
      IF NOT(Error)
      THEN
        BEGIN
          TotalScore := TotalScore * 10;
          Ave := TotalScore DIV NumberOfScores;
          WRITE('average: ');
          IF Ave MOD 10 >= 5
          THEN
            WRITELN(Ave DIV 10 + 1)
          ELSE
          WRITELN(Ave DIV 10);
          ClassTotal := ClassTotal + TotalScore;
          Student := Student + 1
        END
    END;
  WRITELN;
  IF NOT(Error)
  THEN
    BEGIN
      WRITELN ('Class average:');
      ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
      WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10:1)
    END
  ELSE
    WRITELN('ньхайю ббндю!!!')
END.  {AverageScore}
