PROGRAM WordCount(INPUT, OUTPUT);
USES
  WordHandler, ContainerHandler; 
VAR 
  FIn, FOut: TEXT; 
PROCEDURE GetStatistic(VAR FIn, FOut: TEXT);
VAR
  OneWord: WordType;
  Root: Container;
  Nodes: INTEGER;
BEGIN {GetStatstic}
  RESET(FIn);
  REWRITE(FOut);
  Root := NIL;
  WHILE NOT EOF(FIn)
  DO
    BEGIN
      GetWord(FIn, OneWord);
      IF OneWord <> '' 
      THEN
        InsertWord(Root, OneWord)
    END;      
  PrintContainer(FOut, Root);
  ClearContainer(Root)
END; {GetStatstic}

BEGIN {WordCount}
  ASSIGN(INPUT, 'input.txt');
  ASSIGN(OUTPUT, 'output.txt');
  GetStatistic(INPUT, OUTPUT)
END. {WordCount}
