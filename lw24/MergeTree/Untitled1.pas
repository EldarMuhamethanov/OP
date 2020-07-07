PROGRAM TreeSort(INPUT, OUTPUT);
TYPE 
  Tree = ^NodeType;
  NodeType = RECORD
               Ch: CHAR;
               LLink, RLink: Tree;
             END;
VAR
  Root1, Root2: Tree;
  Ch: CHAR;
PROCEDURE Insert(VAR Ptr: Tree; Data: CHAR);
BEGIN {Insert}
  IF Ptr = NIL
  THEN
    BEGIN {Создаем лист со значением Data}
      NEW(Ptr);
      Ptr^.Ch := Data;
      Ptr^.LLink := NIL;
      Ptr^.RLink := NIL;
    END
  ELSE
    IF Data <= Ptr^.Ch
    THEN
      Insert(Ptr^.LLink, Data)
    ELSE
      Insert(Ptr^.RLink, Data)
END;  {Insert}

PROCEDURE PrintTree(Ptr: Tree);
BEGIN {PrintTree}
  IF Ptr <> NIL
  THEN  {Печатает поддерево слева, вершину, поддерево справа}
    BEGIN
      PrintTree(Ptr^.LLink);
      WRITE(Ptr^.Ch);
      PrintTree(Ptr^.RLink);
    END;
END;  {PrintTree}


PROCEDURE MergeTree(VAR Ptr1, Ptr2: Tree);
VAR
  Val1, Val2: CHAR;
BEGIN
  IF (Ptr1 <> NIL) AND (Ptr2 <> NIL)
  THEN
    BEGIN
      MergeTree(Ptr1^.LLink, Ptr2);
      Val1 := Ptr1^.Ch;
      MergeTree(Ptr1, Ptr2^.LLink);
      Val2 := Ptr2^.Ch;
      IF Val1 < Val2
      THEN
        BEGIN
          WRITE(Ptr1^.Ch);
        END
      ELSE
        BEGIN
          WRITE(Ptr2^.Ch);
        END;      
      MergeTree(Ptr1^.RLink, Ptr2);
      MergeTree(Ptr1, Ptr2^.RLink);
    END
END;

BEGIN {TreeSort}
  Root1 := NIL;
  Root2 := NIL;
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      Insert(Root1, Ch)
    END;
  READLN;
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      Insert(Root2, Ch)
    END;
  WRITELN(Root1^.Ch, Root2^.Ch);
  MergeTree(Root1, Root2);
  PrintTree(Root1);
  PrintTree(Root2);
END.  {TreeSort}

