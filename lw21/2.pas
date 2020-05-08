PROGRAM Encryption(INPUT, OUTPUT);
CONST
  Len = 20;
TYPE
  LengthStr = 1 .. Len;
  Str = ARRAY [1 .. Len] OF ' ' .. 'Z';
  Chiper = ARRAY [' ' .. 'Z'] OF CHAR;
  BunchOfAlpha = SET OF 'A' .. 'Z';
VAR
  Msg: Str;
  Code: Chiper;
  I: INTEGER;
  Kript, Enc: TEXT;
  FormatError, isExist: BOOLEAN;
PROCEDURE Initialize(VAR Kript: TEXT; VAR Code: Chiper; VAR Error: BOOLEAN);
VAR
  SymbolCode, SymbolKript, SymbolSeparator: CHAR;
  BunchOfAlpha: SET OF CHAR;
BEGIN  {Initialize}
  BunchOfAlpha := [' '..'Z'];
  RESET(Kript);
  WHILE NOT EOF(Kript) AND NOT(ERROR)
  DO
    BEGIN
      IF NOT EOLN(Kript)
      THEN
        READ(Kript, SymbolCode)
      ELSE
        Error := TRUE;
      IF NOT EOLN(Kript) AND (SymbolCode IN BunchOfAlpha)
      THEN
        READ(Kript, SymbolSeparator)
      ELSE
        Error := TRUE;  
      IF NOT EOLN(Kript) AND (SymbolSeparator = '-')
      THEN
        BEGIN
          READ(Kript, SymbolKript);
          Code[SymbolCode] := SymbolKript
        END
      ELSE
        Error := TRUE;
      IF NOT(ERROR)
      THEN            
        READLN(Kript);
    END
END;  {Initialize}
 
PROCEDURE Encode(VAR Msg: Str; VAR Code: Chiper; VAR MsgLength: INTEGER);
VAR
  I: LengthStr;
  Symbol: CHAR;
BEGIN {Encode}
  FOR I := 1 TO MsgLength DO
  BEGIN
    Symbol := Msg[I];
    WRITE(OUTPUT, Code[Symbol])
  END; 
  WRITELN(OUTPUT);
END; {Encode}
BEGIN  {Encryption}
  ASSIGN(Kript, 'code.txt');
  Initialize(Kript, Code,FormatError);
  IF NOT(FormatError)
  THEN
    BEGIN
      WHILE NOT EOF(INPUT)
      DO
        BEGIN
          I := 0;
          WHILE NOT EOLN(INPUT) AND (I < Len)
          DO
            BEGIN   
              I := I + 1;          
              READ(Msg[I]);
              WRITE(Msg[I])              
            END;
          READLN(INPUT);
          WRITELN(OUTPUT);
          Encode(Msg, Code, I)   
        END 
    END
  ELSE
    WRITELN(OUTPUT, 'Incorrect file data')
END.  {Encryption}
