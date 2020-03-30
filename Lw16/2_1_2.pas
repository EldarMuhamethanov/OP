PROGRAM SarahRevere(INPUT, OUTPUT); 
VAR
  W1, W2, W3, W4: CHAR;
  Land, Sea: BOOLEAN; 
BEGIN {SarahRevere}
  {Инициализация}   
  Land := FALSE;
  Sea := FALSE;
  W4 := ' ';
  W3 := ' ';
  W2 := ' ';
  W1 := ' ';
  WHILE (NOT EOLN) AND NOT (Land OR Sea)   
  DO
    BEGIN
      {движение окна}
      W1 := W2;
      W2 := W3;
      W3 := W4;
      READ(INPUT, W4);  
      {проверка окна на land}
      Land := (W1 = 'l') AND (W2 = 'a') AND (W3 = 'n') AND (W4 = 'd');
      {проверка окна на sea}
      Sea := (W2 = 's') AND (W3 = 'e') AND (W4 = 'a');
    END;
  WRITELN('Sea is ', Sea);
  WRITELN('Land is ', Land)     
END.  {SarahRevere}

