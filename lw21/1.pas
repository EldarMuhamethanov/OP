PROGRAM Encryption(INPUT, OUTPUT);
CONST
  Len = 20;
TYPE
  LengthStr = 1 .. Len;
  Str = ARRAY [1 .. Len] OF ' ' .. 'Z';
  Chiper = ARRAY [' '..'Z'] OF CHAR;
  CharBunch = SET OF CHAR;
VAR
  Msg: Str;
  Code: Chiper;
  I: LengthStr;
  ChiperBunch: CharBunch;
  isExist: BOOLEAN;
PROCEDURE Initialize(VAR Code: Chiper);
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
  FOR I := 1 TO MsgLength - 1 
  DO
    BEGIN
      IF Msg[I] IN ['A' .. 'Z'] + [' ']
    THEN
      WRITE(Code[Msg[I]])
    ELSE
      WRITE(Msg[I]);

    END; 
  WRITELN
END; {Encode}

BEGIN  {Encryption} 
 Initialize(Code);
 ChiperBunch := ['A' .. 'Z'] + [' '];
 WHILE NOT EOF
 DO
   BEGIN
     I := 1;
     isExist := FALSE;
     WHILE NOT EOLN AND (I < Len) AND NOT isExist
     DO
       BEGIN    
         READ(Msg[I]);          
         IF (Msg[I] IN ChiperBunch)  
         THEN
           WRITE(Msg[I])
         ELSE
           BEGIN
             WRITELN;
             WRITE('Symbol ', Msg[I], ' is UNDEFINED');
             isExist := TRUE
           END;
         I := I + 1; 
       END;
     READLN;
     WRITELN;  
     IF NOT isExist
     THEN
       Encode(Msg, Code, I) 
   END 
END.  {Encryption}
