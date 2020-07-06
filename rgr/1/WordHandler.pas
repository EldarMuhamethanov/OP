UNIT WordHandler;
INTERFACE
  CONST
    Alphabet: SET OF CHAR = ['A' .. 'Z', 'a' .. 'z', '�' .. '�', '�' .. '�', '�', '�'];
    MaxWordLength = 50;
  TYPE
    WordType = STRING[MaxWordLength];
  PROCEDURE GetWord(VAR FIn: TEXT; VAR OneWord: WordType);
IMPLEMENTATION

  FUNCTION ToLowerCase(VAR Letter: CHAR): CHAR; {���������� ����� � ������ ��������}
  CONST 
    UpperCaseLetter: SET OF CHAR = ['A' .. 'Z', '�' .. '�'];
  BEGIN   
    IF Letter IN UpperCaseLetter
    THEN
      ToLowerCase := CHR(ORD(Letter) + 32)
    ELSE
      IF Letter IN ['�', '�'] 
      THEN
        ToLowerCase := '�'
      ELSE
        ToLowerCase := Letter
  END;
  
  
  PROCEDURE GetFirstLetter(VAR FIn: TEXT; VAR Ch: CHAR; VAR IsFound: BOOLEAN);{���������� ��� ���������� �������}
  BEGIN {Get0FirstLetter}
    REPEAT
      READ(FIn, Ch);
    UNTIL (Ch IN Alphabet) OR EOF(FIn);
    IsFound := (Ch IN Alphabet)
  END; {GetFirstLetter}
  
  PROCEDURE GetWord(VAR FIn: TEXT; VAR OneWord: WordType);{��������� ����� �� input �����}
  VAR
     Ch: CHAR;
     IsFound: BOOLEAN;
  BEGIN {GetWord}
    OneWord := '';
    IsFound := FALSE;
    GetFirstLetter(FIn, Ch, IsFound);
    IF IsFound
    THEN
      OneWord := OneWord + ToLowerCase(Ch);  
    WHILE NOT EOF(FIn) AND (Ch IN Alphabet)
    DO
      BEGIN
        READ(FIn, Ch);
        IF Ch IN Alphabet
        THEN
          OneWord := OneWord + ToLowerCase(Ch)
      END       
  END; {GetWord}
END.  
