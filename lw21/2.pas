PROGRAM Encryption(INPUT, OUTPUT);
CONST
  Len = 20;
TYPE
  LengthStr = 1 .. Len;
  Str = ARRAY [1 .. Len] OF ' ' .. 'Z';
  Chiper = ARRAY [' ' .. 'Z'] OF CHAR;
  CharBunch = SET OF CHAR;
VAR
  Msg: Str;
  Code: Chiper;
  ChiperBunch, CodeBunch: CharBunch;
  I: LengthStr;
  ChiperFile: TEXT;
  FormatError, IsExist, Overflow: BOOLEAN;
PROCEDURE Initialize(VAR ChiperFile: TEXT; VAR Code: Chiper; VAR CodeBunch, ChiperBunch: CharBunch; VAR Error: BOOLEAN);
VAR
  SymbolCode, SymbolChiper, SymbolSeparator: CHAR;
BEGIN  {Initialize}
  RESET(ChiperFile);
  WHILE NOT EOF(ChiperFile) AND NOT(Error)
  DO
    BEGIN
      IF NOT EOLN(ChiperFile)
      THEN
        READ(ChiperFile, SymbolCode)
      ELSE
        Error := TRUE;
      IF NOT EOLN(ChiperFile) AND (SymbolCode IN ChiperBunch)
      THEN
        READ(ChiperFile, SymbolSeparator)
      ELSE
        Error := TRUE;  
      IF NOT EOLN(ChiperFile) AND (SymbolSeparator = '-')
      THEN
        BEGIN
          READ(ChiperFile, SymbolChiper);
          Code[SymbolCode] := SymbolChiper;
          CodeBunch := CodeBunch + [SymbolCode];
        END
      ELSE
        Error := TRUE;
      IF NOT(ERROR)
      THEN            
        READLN(ChiperFile);
    END
END;  {Initialize}
 
PROCEDURE Encode(VAR Msg: Str; VAR Code: Chiper; VAR MsgLength: LengthStr);
VAR
  I: LengthStr;
  Symbol: CHAR;
BEGIN {Encode}
  FOR I := 1 TO MsgLength - 1
  DO
    BEGIN
      Symbol := Msg[I];
      WRITE(OUTPUT, Code[Symbol])
    END; 
  WRITELN(OUTPUT);
END; {Encode}

BEGIN  {Encryption}
  ASSIGN(ChiperFile, 'code.txt');
  CodeBunch := []; //��� ������� ������� ����� ������� �� �����
  ChiperBunch := ['A' .. 'Z'] + [' ']; //��� ������� ������� ����� ����������
  Initialize(ChiperFile, Code, CodeBunch, ChiperBunch, FormatError); 
  IF NOT(FormatError)
  THEN
    BEGIN
      WHILE NOT EOF
      DO
       BEGIN
         I := 1;
         IsExist := FALSE;
         Overflow := FALSE;
         WHILE NOT EOLN AND (I <= Len) AND NOT IsExist
         DO
           BEGIN   
             READ(Msg[I]);
             IF (Msg[I] IN ChiperBunch) AND (Msg[I] IN CodeBunch)
             THEN
               WRITE(Msg[I])
             ELSE
               BEGIN
                 WRITELN;
                 WRITE('Symbol ', Msg[I], ' is UNDEFINED');
                 IsExist := TRUE
               END;
             I := I + 1;  
           END;
         IF (NOT EOLN) AND (I > Len)
         THEN
           BEGIN 
             WRITELN;
             WRITE('Too long str');
             Overflow := TRUE;
           END;
         READLN;
         WRITELN;  
         IF NOT IsExist AND NOT Overflow
         THEN
           Encode(Msg, Code, I) 
       END 
    END
  ELSE
    WRITELN(OUTPUT, 'Incorrect file data(Format error OR non-array character)')
END.  {Encryption}
