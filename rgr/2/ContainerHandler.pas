UNIT ContainerHandler;
INTERFACE
USES 
  WordHandler;
TYPE
  Container = ^NodeType;
  NodeType = RECORD
               OneWord: WordType;
               Counter: INTEGER;
               LLink, RLink: Container;
             END;               
  PROCEDURE InsertWord(VAR Ptr: Container; VAR Data: WordType; VAR Nodes: INTEGER);{Вставляет слово в контейнер}
  PROCEDURE ReloadContainer(VAR Root: Container; VAR FTemp1, FTemp2: TEXT; VAR ContainerCounter: INTEGER); {Обновление/очищение контейнера}        
  PROCEDURE PrintStatistic(VAR FTemp1, FOut: TEXT; VAR Root: Container; VAR ContainerCounter: INTEGER); {Выводит Статистику в файл}
IMPLEMENTATION

  PROCEDURE PrintContainer(VAR FOut: TEXT; VAR Ptr: Container); {Выводит Контейнер в файл FOut}
  BEGIN {PrintContainer}
    IF Ptr <> NIL
    THEN
      BEGIN
        PrintContainer(FOut, Ptr^.LLink);
        WRITELN(FOut, Ptr^.OneWord, ' ', Ptr^.Counter);
        PrintContainer(FOut, Ptr^.RLink)
      END
  END;  {PrintContainer}
  
  PROCEDURE ClearContainer(VAR Ptr: Container); {Очищает контейнер} 
  BEGIN {ClearContainer}
    IF Ptr <> NIL
    THEN
      BEGIN
        ClearContainer(Ptr^.LLink);
        ClearContainer(Ptr^.RLink);
        Ptr := NIL
      END;
    DISPOSE(Ptr)  
  END;  {ClearContainer}
  
  PROCEDURE CopyOpenFile(VAR FIn, FOut: TEXT); {Копирует из одного файла в другой}
  VAR 
    Ch: CHAR;
  BEGIN {CopyFile}
    WHILE NOT EOF(FIn)
    DO
      BEGIN
        WHILE NOT EOLN(FIn)
        DO
          BEGIN
            READ(FIn, Ch);
            WRITE(FOut, Ch)
          END;
        WRITELN(FOut);
        READLN(FIn)  
      END
  END;  {CopyFile}
     
  PROCEDURE MergeContainer(VAR Temp1, Temp2: TEXT; VAR Ptr: Container; VAR EndOfFile: BOOLEAN; VAR ContainerWordInfo, FileWordInfo: WordInfo);{Сливает контейнер с файлом Temp1 в другой файл Temp2}
  VAR 
    IsEqual, IsLess: BOOLEAN;
  BEGIN {MergeContainer}
    IF (Ptr <> NIL)
    THEN
      BEGIN 
        MergeContainer(Temp1, Temp2, Ptr^.LLink, EndOfFile, ContainerWordInfo, FileWordInfo);
        IsEqual := FALSE;
        IsLess := FALSE; 
        ContainerWordInfo.OneWord := Ptr^.OneWord;
        ContainerWordInfo.Counter := Ptr^.Counter;
        IF (FileWordInfo.OneWord < ContainerWordInfo.OneWord) AND NOT EndOfFile
        THEN  
          BEGIN 
            WRITELN(Temp2, FileWordInfo.OneWord, ' ', FileWordInfo.Counter);
            EndOfFile := EOF(Temp1)
          END
        ELSE 
          IF (FileWordInfo.OneWord = ContainerWordInfo.OneWord) AND (NOT EOF(Temp1))
          THEN
            BEGIN
              WRITELN(Temp2, FileWordInfo.OneWord, ' ', FileWordInfo.Counter + ContainerWordInfo.Counter);
              IsEqual := TRUE      
            END
          ELSE
            IsLess := TRUE;  
        WHILE (NOT IsLess) AND (NOT EOF(Temp1))
        DO
          BEGIN
            GetWordFromFile(Temp1, FileWordInfo.OneWord, FileWordInfo.Counter);
            IF (FileWordInfo.OneWord < ContainerWordInfo.OneWord)
            THEN
              BEGIN   
                WRITELN(Temp2, FileWordInfo.OneWord, ' ', FileWordInfo.Counter);
                EndOfFile := EOF(Temp1)
              END
            ELSE 
              IF FileWordInfo.OneWord = ContainerWordInfo.OneWord 
              THEN
                BEGIN
                  WRITELN(Temp2, FileWordInfo.OneWord, ' ', FileWordInfo.Counter + ContainerWordInfo.Counter);
                  IsEqual := TRUE
                END
              ELSE
                IsLess := TRUE               
          END; 
        IF NOT IsEqual 
        THEN        
          WRITELN(Temp2, ContainerWordInfo.OneWord, ' ', ContainerWordInfo.Counter);       
        MergeContainer(Temp1, Temp2, Ptr^.RLink, EndOfFile, ContainerWordInfo, FileWordInfo)      
      END   
  END;  {MergeContainer}
          
  PROCEDURE Merge(VAR Temp1, Temp2: TEXT; VAR Ptr: Container); {Подготавливает контейнер к слиянию с файлом}
  VAR
    ContainerWordInfo, FileWordInfo: WordInfo;
    EndOfFile: BOOLEAN;
    Ch: CHAR;
  BEGIN {Merge} 
    GetWordFromFile(Temp1, FileWordInfo.OneWord, FileWordInfo.Counter);
    ContainerWordInfo.OneWord := '';
    ContainerWordInfo.Counter := 0;
    EndOfFile := FALSE;
    MergeContainer(Temp1, Temp2, Ptr, EndOfFile, ContainerWordInfo, FileWordInfo);
    IF NOT EndOfFile
    THEN
      WRITELN(Temp2, FileWordInfo.OneWord, ' ', FileWordInfo.Counter);
    WHILE NOT EOF(Temp1)
    DO
      BEGIN
        GetWordFromFile(Temp1, FileWordInfo.OneWord, FileWordInfo.Counter);
        WRITELN(Temp2, FileWordInfo.OneWord, ' ', FileWordInfo.Counter)
      END    
  END;  {Merge}
  
  PROCEDURE ReloadContainer(VAR Root: Container; VAR FTemp1, FTemp2: TEXT; VAR ContainerCounter: INTEGER); {Обновление/очищение контейнера}
  BEGIN
    IF ContainerCounter = 0
    THEN
      BEGIN
        REWRITE(FTemp1);
        PrintContainer(FTemp1, Root)
      END              
    ELSE
      BEGIN
        RESET(FTemp1);
        REWRITE(FTemp2);
        Merge(FTemp1, FTemp2, Root);
        RESET(FTemp2);
        REWRITE(FTemp1);
        CopyOpenFile(FTemp2, FTemp1)
      END;
    ClearContainer(Root);
    ContainerCounter := ContainerCounter + 1
  END;
 
  PROCEDURE InsertWord(VAR Ptr: Container; VAR Data: WordType;  VAR Nodes: INTEGER);
  BEGIN {InsertWord} 
    IF Ptr = NIL
    THEN 
      BEGIN 
        NEW(Ptr);
        Ptr^.OneWord := Data;
        Nodes := Nodes + 1;
        Ptr^.Counter := 1;
        Ptr^.LLink := NIL;
        Ptr^.RLink := NIL
      END
    ELSE
      IF Ptr^.OneWord = Data
      THEN
        Ptr^.Counter := Ptr^.Counter + 1
      ELSE  
        IF Data <= Ptr^.OneWord
        THEN
          InsertWord(Ptr^.LLink, Data, Nodes)
        ELSE
          InsertWord(Ptr^.RLink, Data, Nodes)
  END;  {InsertWord}
  
  PROCEDURE PrintStatistic(VAR FTemp1, FOut: TEXT; VAR Root: Container; VAR ContainerCounter: INTEGER); {Выводит Статистику в файл}
  BEGIN {PrintStatistic}
    IF ContainerCounter = 0 
    THEN
      PrintContainer(FOut, Root)
    ELSE
      BEGIN 
        RESET(FTemp1);
        Merge(FTemp1, FOut, Root)    
      END;
    ClearContainer(Root)
  END; {PrintStatistic}
  
BEGIN                              
END.


