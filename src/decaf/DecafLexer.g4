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
  (LETRAS|'_')(LETRAS|NUMEROS|'_')+;


WS_ : (' ' | '\n' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHAR : '\'' (ESC|LETRAS|NUMEROS) '\'';
 
STRING : '"' (LETRAS|NUMEROS|ESPECIAL)*	'"';

NUMBER: (NUMEROS)+;

OPERADORES : ('+'|'-'|'*'|'/');

fragment
ESC :  '\\' ('n'|'"'|'t'|'\\'|'\''|'\"');

fragment
LETRAS : ('a'..'z' | 'A'..'Z');

fragment
NUMEROS : ('0'..'9');

fragment
ESPECIAL : (' '|'!'|'"'|'#'|'$'|'%'|'&'|'\\\''|'('|')'|'*'|'+'|','|'-'|'.'|'/'|':'|';'|'<'|'='|'>'|'?'|'@'|'['|']'|'^'|'_'|'´'|'`'|'{'|'|'|'}'|'~'|'\t'|'\\'|'\"');




