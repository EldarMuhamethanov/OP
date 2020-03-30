PROGRAM TestRemove(INPUT,OUTPUT);
  {вХРЮЕР ЯРПНЙС ХГ БУНДЮ ,ОПНОСЯЙЮЕР ЕЕ ВЕПЕГ RemoveExtraBlanks}
USES Queue;
VAR
  Ch: CHAR;
BEGIN{TestRemove}
  EmptyQ;//нвхыюел нвепедэ
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      READ(INPUT, Ch);
      AddQ(Ch);//днаюбкъел щкелемрш
    END;
  WRITE('бшбндхл нвепедэ:  ');
  WriteQ;
  WRITE('бшбндхл оепбши яхлбнд:  ');
  HeadQ(Ch);
  WRITELN(Ch);
  WRITE('бшбндхл нвепедэ аег оепбнцн яхлбнкю:  ');
  DelQ;
  WriteQ
END.{TestRemove}
