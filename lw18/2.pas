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
  Ch: CHAR;
  StudName: TEXT;
BEGIN {AverageScore}
  ClassTotal := 0;
  WRITELN('Student averages:');
  Student := 1;
  WHILE Student < ClassSize + 1
  DO 
    BEGIN
      TotalScore := 0;
      WhichScore := 1;
      REWRITE(StudName);
      READ(INPUT, Ch);
      WHILE (Ch <> ' ')
      DO
        BEGIN
          WRITE(StudName, Ch);
          READ(INPUT, Ch)          
        END;
      WRITELN(StudName);
      WHILE WhichScore < NumberOfScores + 1
      DO
        BEGIN
          READ(INPUT, NextScore);
          TotalScore := TotalScore + NextScore;
          WhichScore := WhichScore + 1;
        END;
      READLN(INPUT);
      TotalScore := TotalScore * 10;
      Ave := TotalScore DIV NumberOfScores;
      RESET(StudName);
      WHILE (NOT EOLN(StudName))
      DO
        BEGIN
          READ(StudName, Ch);
          WRITE(OUTPUT, Ch)
        END;
      WRITE(OUTPUT, ' average: ');
      IF Ave MOD 10 >= 5
      THEN
        WRITELN(OUTPUT, Ave DIV 10 + 1)
      ELSE
        WRITELN(OUTPUT, Ave DIV 10);
      ClassTotal := ClassTotal + TotalScore;
      Student := Student + 1;
    END;
  WRITELN(OUTPUT);
  WRITELN (OUTPUT, 'Class average:');
  ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
  WRITELN(OUTPUT, ClassTotal DIV 10, '.', ClassTotal MOD 10:1)
END.  {AverageScore}
