PROGRAM SarahRevere(INPUT, OUTPUT); 
VAR
  W1, W2, W3, W4: CHAR;
  Land, Sea: BOOLEAN; 
BEGIN {SarahRevere}
  {Инициализация}   
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
      WRITE(W1, W2, W3, W4, ', ')
    END   
END.  {SarahRevere}

