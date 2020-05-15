PROGRAM Encryption(INPUT, OUTPUT);
CONST
  Len = 20;
  CodeAlphabet = ['A' .. 'Z', ' '];
TYPE
  LengthStr = 1 .. Len;
  Str = ARRAY [1 .. Len] OF ' ' .. 'Z';
  Chiper = ARRAY [' ' .. 'Z'] OF CHAR;
  CharBunch = SET OF CHAR;
VAR
  Msg: Str;
  Code: Chiper;
  CodeBunch: CharBunch;
  I: LengthStr;
  ChiperFile: TEXT;
  FormatError, Overflow: BOOLEAN;
PROCEDURE Initialize(VAR ChiperFile: TEXT; VAR Code: Chiper; VAR CodeBunch: CharBunch; VAR Error: BOOLEAN);
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
      IF NOT EOLN(ChiperFile) AND (SymbolCode IN CodeAlphabet)
      THEN
        READ(ChiperFile, SymbolSeparator)
      ELSE
        Error := TRUE;  
      IF NOT EOLN(ChiperFile) AND (SymbolSeparator = '-') AND NOT Error
      THEN
        BEGIN
          READ(ChiperFile, SymbolChiper);
          Code[SymbolCode] := SymbolChiper;
          CodeBunch := CodeBunch + [SymbolCode]
        END
      ELSE
        Error := TRUE;
      IF NOT(Error)
      THEN            
        READLN(ChiperFile)
    END
END;  {Initialize}
 
PROCEDURE Encode(VAR Msg: Str; VAR Code: Chiper; VAR MsgLength: LengthStr; VAR CodeBunch: CharBunch);
VAR
  I: LengthStr;
  Symbol: CHAR;
BEGIN {Encode}
  FOR I := 1 TO MsgLength - 1
  DO
    BEGIN
      IF (Msg[I] IN CodeAlphabet) AND (Msg[I] IN CodeBunch)
      THEN
        WRITE(Code[Msg[I]])
      ELSE
        WRITE(Msg[I])
    END; 
  WRITELN
END; {Encode}

BEGIN  {Encryption}
  ASSIGN(ChiperFile, 'code.txt');
  CodeBunch := []; //Все символы которые будут считаны из файла И закодированы
  Initialize(ChiperFile, Code, CodeBunch, FormatError); 
  IF NOT(FormatError)
  THEN
    BEGIN
      WHILE NOT EOF
      DO
        BEGIN
          I := 1;
          Overflow := FALSE;
          WHILE NOT EOLN AND (I <= Len)
          DO
            BEGIN   
              READ(Msg[I]);
              WRITE(Msg[I]);
              I := I + 1
            END;
          IF (NOT EOLN) AND (I > Len)
          THEN
            BEGIN 
              WRITELN;
              WRITE('long str');
              Overflow := TRUE
            END;
          READLN;
          WRITELN;  
          IF NOT Overflow
          THEN
            Encode(Msg, Code, I, CodeBunch) 
        END 
    END
  ELSE
    WRITELN(OUTPUT, 'Incorrect file data(Format error OR non-array character)')
END.  {Encryption}
