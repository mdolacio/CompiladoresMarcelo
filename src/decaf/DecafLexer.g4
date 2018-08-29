lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

tokens
{
  TK_class
}

LCURLY : '{';
RCURLY : '}';

ID  :
  ('a'..'z' | 'A'..'Z'| '0'..'9'| '?'|',')+;

ID2  :
  ('a'..'z' | 'A'..'Z'| '0'..'9');


WS_ : (' ' | '\n' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHAR : '\'' (ESC|ID2) '\'';
 
STRING : '"' (ESC|~'"'|ID)* '"';

fragment
ESC :  '\\' ('n'|'"'|'t'|'\\');


