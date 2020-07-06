PROGRAM CountWords(INPUT, OUTPUT);
USES
  WordHandler,
  ContainerHandler;
CONST
  MaxNodes = 20000;    
PROCEDURE GetStatistic(VAR FIn, FOut: TEXT);
VAR
  OneWord: WordType;
  Root: Container;
  Nodes, ContainerCounter: INTEGER;
  FTemp1, FTemp2: TEXT;
BEGIN {GetStatistic}
  RESET(FIn);
  REWRITE(FOut);
  Nodes := 0;
  ContainerCounter := 0;
  Root := NIL;
  WHILE NOT EOF(FIn)
  DO  
    BEGIN
      GetWord(FIn, OneWord);
      IF OneWord <> ''
      THEN
        InsertWord(Root, OneWord, Nodes);
      IF Nodes > MaxNodes 
      THEN
        BEGIN
          ReloadContainer(Root, FTemp1, FTemp2, ContainerCounter);
          Nodes := 0
        END      
    END; 
  PrintStatistic(FTemp1, FOut, Root, ContainerCounter)
END;  {GetStatistic}
  
BEGIN {CountWords}
  ASSIGN(INPUT, 'input.txt');
  ASSIGN(OUTPUT, 'output.txt');
  
  GetStatistic(INPUT, OUTPUT)
END.  {CountWords}  

