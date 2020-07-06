UNIT ContainerHandler;
INTERFACE
USES 
  WordHandler;
TYPE 
  Container = ^NodeType;
  NodeType = RECORD
               OneWord: WordType;
               WordCounter: INTEGER;
               LLink, RLink: Container
             END;
  PROCEDURE InsertWord(VAR Ptr: Container; VAR Data: WordType);{��������� ����� � ���������}
  PROCEDURE PrintContainer(VAR FOut: TEXT; VAR Ptr: Container); {������� ��������� � ���� FOut}
  PROCEDURE ClearContainer(VAR Ptr: Container); {������� ���������}
IMPLEMENTATION
  PROCEDURE InsertWord(VAR Ptr: Container; VAR Data: WordType);{��������� ����� � ���������}  
  BEGIN {IsertWord}
    IF Ptr = NIL
    THEN
      BEGIN {������� ���� �� ��������� Data}
        NEW(Ptr); 
        Ptr^.OneWord := Data;
        Ptr^.WordCounter := 1;
        Ptr^.LLink := NIL;
        Ptr^.RLink := NIL
      END
    ELSE
      IF Data < Ptr^.OneWord
      THEN
        InsertWord(Ptr^.LLink, Data)
      ELSE
        IF Data > Ptr^.OneWord
        THEN
          InsertWord(Ptr^.RLink, Data) 
        ELSE
          Ptr^.WordCounter := Ptr^.WordCounter + 1                           
  END; {IsertWord}
  
  PROCEDURE PrintContainer(VAR FOut: TEXT; VAR Ptr: Container); {������� ��������� � ���� FOut}
  BEGIN {PrintContainer}
    IF Ptr <> NIL
    THEN  {�������� ��������� �����, �������, ��������� ������}
      BEGIN
        PrintContainer(FOut, Ptr^.LLink);
        WRITELN(FOut, Ptr^.OneWord, ' ', Ptr^.WordCounter);
        PrintContainer(FOut, Ptr^.RLink)
      END
  END; {PrintContainer}
  
  PROCEDURE ClearContainer(VAR Ptr: Container); {������� ���������}
  BEGIN {ClearContainer}
    IF Ptr <> NIL
    THEN
      BEGIN
        ClearContainer(Ptr^.LLink); 
        ClearContainer(Ptr^.RLink);
        Ptr^.OneWord := '';
        Ptr^.WordCounter := 0;
        Ptr := NIL
      END;
    DISPOSE(Ptr)  
  END; {ClearContainer}
END.
