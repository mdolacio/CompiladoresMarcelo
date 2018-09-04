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

RESERVADOS: ('if'|'boolean'|'callout'|'class'|'else'|'int'|'return'|'void'|'for'|'break'|'continue');

BOOLEAN: ('true'|'false');
																								
ID  : (LETRAS|'_') +;

CHAR : '\'' (ESC|LETRAS|NUMEROS) '\'';

STRING : '"' (LETRAS|NUMEROS|ESPECIAL)*	'"';

WS_ : (' ' | '\n' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

NUMBER: (NUMEROS)+;

OPERADORES : ('+'|'-'|'*'|'/'|'<'|'<='|'!='|'&&');

fragment
ESC :  '\\' ('n'|'"'|'t'|'\\'|'\''|'\"');

fragment
LETRAS : ('a'..'z' | 'A'..'Z');

fragment
NUMEROS : ('0'..'9');

fragment
ESPECIAL : (' '|'!'|'"'|'#'|'$'|'%'|'&'|'\\\''|'('|')'|'*'|'+'|','|'-'|'.'|'/'|':'|';'|'<'|'='|'>'|'?'|'@'|'['|']'|'^'|'_'|'´'|'`'|'{'|'|'|'}'|'~'|'\t'|'\\'|'\"');




