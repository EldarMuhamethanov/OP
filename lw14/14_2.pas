PROGRAM RecCopy(INPUT, OUTPUT);
PROCEDURE RCopy(VAR FileInput, FileOutput: TEXT);
VAR 
  Ch: CHAR;
BEGIN{RCopy}
  IF NOT EOLN(FileInput)
  THEN
    BEGIN
      READ(FileInput, Ch);
      WRITE(FileOutput, Ch);
      RCopy(FileInput, FileOutput)
    END
END;{RCopy}
BEGIN{RecCopy}
  RCopy(INPUT, OUTPUT);
  WRITELN(OUTPUT)
END.{RecCopy}
