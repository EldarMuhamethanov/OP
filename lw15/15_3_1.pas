PROGRAM TestRemove(INPUT,OUTPUT);
  {������ ������ �� ����� ,���������� �� ����� RemoveExtraBlanks}
USES Queue;
VAR
  Ch: CHAR;
BEGIN{TestRemove}
  EmptyQ;//������� �������
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      READ(INPUT, Ch);
      AddQ(Ch);//��������� ��������
    END;
  WRITE('������� �������:  ');
  WriteQ;
  WRITE('������� ������ ������:  ');
  HeadQ(Ch);
  WRITELN(Ch);
  WRITE('������� ������� ��� ������� �������:  ');
  DelQ;
  WriteQ
END.{TestRemove}
