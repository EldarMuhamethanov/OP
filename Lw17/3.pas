Program Start(INPUT, OUTPUT);
VAR
  Min, Max, EnterCount, Sum, Number: INTEGER;  
  Overflow: BOOLEAN;
PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);{ReadDigit}
VAR
   Ch: CHAR;
BEGIN{ReadDigit}
  D := -1; 
  IF NOT(EOLN)
  THEN
    BEGIN
      READ(F, Ch);  
      IF Ch = '1' THEN D := 1 ELSE
      IF Ch = '2' THEN D := 2 ELSE
      IF Ch = '3' THEN D := 3 ELSE
      IF Ch = '4' THEN D := 4 ELSE
      IF Ch = '5' THEN D := 5 ELSE
      IF Ch = '6' THEN D := 6 ELSE
      IF Ch = '7' THEN D := 7 ELSE
      IF Ch = '8' THEN D := 8 ELSE
      IF Ch = '9' THEN D := 9 ELSE
      IF Ch = '0' THEN D := 0
    END   
END;{ReadDigit}  
PROCEDURE ReadNumber(VAR F: TEXT; VAR N: INTEGER);{ReadNumber}
VAR 
 I: INTEGER;
BEGIN{ReadNumber}
  N := 0;
  I := 0;
  WHILE (NOT(EOLN(F)) AND (N >= 0) AND (I <> -1))
  DO
    BEGIN        
      ReadDigit(F, I);
      IF (I <> -1)
      THEN
        BEGIN     
          IF (N <= MAXINT DIV 10) 
          THEN    
            BEGIN     
              N := N * 10;
              IF(MAXINT - N >= I)
              THEN
                N := N + I
              ELSE
                N := -1
            END                                            
          ELSE
            N := -1            
        END    
    END;    
END;{ReadNumber} 
BEGIN
  Max := 0;
  Min := MAXINT;
  Sum := 0;
  Number := 0;
  EnterCount := 0;
  Overflow := FALSE;
  WHILE (NOT EOLN(INPUT)) AND (NOT Overflow)
  DO
    BEGIN   
      ReadNumber(INPUT, Number);
      Overflow := (Number = -1) OR (Sum > (MAXINT - Number)) OR (EnterCount >= MAXINT - 1);
      IF (Overflow)
      THEN
        WRITELN('Incorrect value entered, or overflow')   
      ELSE
        BEGIN
          EnterCount := EnterCount + 1;
          Sum := Sum + Number; 
          IF (Min > Number)
          THEN
            Min := Number;
          IF (Max < Number)
          THEN
            Max := Number;                                 
        END            
    END;   
  IF (NOT Overflow)
  THEN
    BEGIN
      IF (EnterCount > 0)
      THEN
        BEGIN
          WRITELN('Min: ', Min);
          WRITELN('Max: ', Max);
          WRITELN('Average: ', Sum DIV EnterCount, '.', Sum MOD EnterCount * 100 DIV EnterCount);
        END
      ELSE
        WRITELN('nothing entered')
    END    
END.  
