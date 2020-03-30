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
  Students: TEXT;
  Ch: CHAR;
BEGIN {AverageScore}
  ClassTotal := 0;
  WRITELN('Student averages:');
  Student := 1;
  WHILE Student < ClassSize + 1
  DO 
    BEGIN
      TotalScore := 0;
      WhichScore := 1;
      REWRITE(Students);
      WHILE (Ch <> ' ')
      DO
        BEGIN
          READ(INPUT, Ch);
          WRITE(Students, Ch)
        END;
      WRITELN(Students);
      WHILE WhichScore < NumberOfScores + 1
      DO
        BEGIN
          READ(NextScore);
          TotalScore := TotalScore + NextScore;
          WhichScore := WhichScore + 1;
        END;
      READLN;
      TotalScore := TotalScore * 10;
      Ave := TotalScore DIV NumberOfScores;
      RESET(Students);
      WHILE (NOT EOLN(Students))
      DO
        BEGIN
          READ(Students, Ch);
          WRITE(OUTPUT, Ch)
        END;
      WRITE('average:');
      IF Ave MOD 10 >= 5
      THEN
        WRITELN(Ave DIV 10 + 1)
      ELSE
        WRITELN(Ave DIV 10);
      ClassTotal := ClassTotal + TotalScore;
      Student := Student + 1;
    END;
  WRITELN;
  WRITELN ('Class average:');
  ClassTotal := ClassTotal DIV (ClassSize *NumberOfScores);
  WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10:1)
END.  {AverageScore}