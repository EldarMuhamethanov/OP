PROGRAM SortMonth(INPUT, OUTPUT);
USES
  dateio;
VAR
  Mo1: Month;
BEGIN
  ReadMonth(INPUT, Mo1);
  IF (Mo1 <> NoMonth)
  THEN
    BEGIN
      WRITE('����� - ');
      WriteMonth(OUTPUT, Mo1)
    END
  ELSE 
      WRITELN('������ ����������')
    
END.
