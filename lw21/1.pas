PROGRAM Encryption(INPUT, OUTPUT);
CONST
  Len = 20;
TYPE
  LengthStr = 1 .. Len;
  Str = ARRAY [1 .. Len] OF ' ' .. 'Z';
  Chiper = ARRAY [' ' .. 'Z'] OF CHAR;
VAR
  Msg: Str;
  Code: Chiper;
  I: LengthStr;
PROCEDURE Initialize(VAR Code: Chiper);
VAR
  I: CHAR;
BEGIN  {Initialize}
  Code['A'] := 'Z';
  Code['B'] := 'Y';
  Code['C'] := 'X';
  Code['D'] := '#';
  Code['E'] := 'V';
  Code['F'] := 'U';
  Code['G'] := ',';
  Code['H'] := '"';
  Code['I'] := 'I';
  Code['J'] := 'Q';
  Code['K'] := 'P';
  Code['M'] := ':';
  Code['N'] := 'M';
  Code['O'] := '2';
  Code['P'] := 'K';
  Code['Q'] := '$';
  Code['R'] := 'D';
  Code['S'] := '?';
  Code['T'] := '*';
  Code['U'] := 'F';
  Code['V'] := 'E';
  Code['W'] := 'T';
  Code['X'] := 'C';
  Code['Y'] := 'B';
  Code['Z'] := 'A';
  Code[' '] := '`';
END;  {Initialize}
 
PROCEDURE Encode(VAR Msg: Str; VAR Code: Chiper; VAR MsgLength: LengthStr);
VAR
  I: LengthStr;
  Symbol: CHAR;
  SymbolBunch: SET OF CHAR;
BEGIN {Encode}
  FOR I := 1 TO MsgLength - 1 
  DO
    BEGIN
      IF (Msg[I] IN ['A' .. 'Z'] + [' ']) AND (Code[Msg[I]] IN [' ' .. '~'])
      THEN
        WRITE(Code[Msg[I]])
      ELSE
        WRITE(Msg[I])
    END;
  WRITELN
END; {Encode}

BEGIN  {Encryption} 
  Initialize(Code);
  WHILE NOT EOF
  DO
    BEGIN
      I := 1;
      WHILE NOT EOLN AND (I < Len)
      DO
       BEGIN    
         READ(Msg[I]);          
         WRITE(Msg[I]);
         I := I + 1
       END;
      READLN;
      WRITELN;  
      Encode(Msg, Code, I) 
    END 
END.  {Encryption}
