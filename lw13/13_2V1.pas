PROGRAM Lex(INPUT, OUTPUT);
VAR
  L1, L2: TEXT;
  Res: CHAR;
PROCEDURE Lexico(VAR F1, F2: TEXT; VAR Result: CHAR);
{Result 0, 1, 2 если лексикографический порядок F1 =, <, > чем F2       
соответственно. Фактические параметры, соответствующие F1 и F2,
должны быть различными}
VAR
  Ch1, Ch2: CHAR;
BEGIN {Lexico}
  RESET(F1);
  RESET(F2);
  Result := '0';
  WHILE (NOT EOLN(F1) AND NOT EOLN(F2)) AND (Result = '0')
  DO
    BEGIN
      READ(F1, Ch1);
      READ(F2, Ch2);
      IF (Ch1 < Ch2)
      THEN {Ch1 < Ch2 или F1 короче F2}
        Result := '1'
      ELSE
        IF (Ch1 > Ch2)
        THEN {Ch1 > Ch2 или F2 короче F1}
          Result := '2'
        ELSE
          IF (EOLN(F1) AND NOT EOLN(F2))
          THEN
            Result := '1'
          ELSE 
            IF (EOLN(F2) AND NOT EOLN(F1))
            THEN
              Result := '2'
    END; {WHILE}
END; {Lexico}

BEGIN
  REWRITE(L1);
  REWRITE(L2);
  WRITELN(L1, 'AB');
  WRITELN(L2, 'B');
  Lexico(L1, L2, Res);
  WRITELN(OUTPUT, Res)
END.

