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
BEGIN  {Initialize}
  Code['E'] := 'V';
  Code['F'] := 'U';
  Code['G'] := ',';
  Code['H'] := '"';
  Code['I'] := 'I';
  Code['J'] := 'Q';
  Code['K'] := 'P';
  Code['L'] := '!';
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
BEGIN {Encode}
  FOR I := 1 TO MsgLength DO
  BEGIN
    Symbol := Msg[I];
    WRITE(Code[Symbol])
  END; 
  WRITELN
END; {Encode}
BEGIN  {Encryption} 
 Initialize(Code);
 WHILE NOT EOF
 DO
   BEGIN
     WHILE NOT EOLN AND (I < Len)
     DO
       BEGIN
         I := I + 1;
         READ(Msg[I]);
         WRITE(Msg[I])
       END;
     READLN;
     WRITELN;
     Encode(Msg, Code, I)   
   END 
END.  {Encryption}
