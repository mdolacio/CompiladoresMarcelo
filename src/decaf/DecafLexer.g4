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

IF:'if';
BOOLEAN: 'boolean';
CALLOUT:'callout';
CLASS:'class';
ELSE:'else';
RETURN:'return';
VOID:'void';
FOR:'for';
BREAK:'break';
CONTINUE:'continue';
PROGRAM:'Program';
INT: 'int';
LCURLY : '{';
RCURLY : '}';




NHA: ('true'|'false');
																								
ID  : ('_'|LETRAS)(LETRAS|'_'|NUMEROS)*;

CHAR : '\'' (ESC|LETRAS|NUMEROS) '\'';

STRING : '"' (LETRAS|NUMEROS|ESPECIAL)*	'"';



WS_ : (' ' | '\n'|'\t' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

NUMBER: (NUMEROS)+;

HEXA :'0x'(NUMEROS|LETRAS)+;


VIRGULA : ',';
PONTOEVIRGULA : ';'; 
ABRECOLCHETE : '[';
FECHACOLCHETE : ']';
ABREPAR : '(';
FECHAPAR : ')';
OU : '|';
IGUAL : '=';
MAIOR : '<';
MENOR : '>';
FECHACHAVE : '}';
ABRECHAVE : '{'; 

OPERADORES : ('+'|'-'|'*'|'/'|'<'|'<='|'!='|'&&');

fragment
ESC :  '\\' ('n'|'"'|'t'|'\\'|'\''|'\"');

fragment
LETRAS : ('a'..'z' | 'A'..'Z');

fragment
NUMEROS : ('0'..'9');

fragment
ESPECIAL : (' '|'!'|'"'|'#'|'$'|'%'|'&'|'\\\''|'('|')'|'*'|'+'|','|'-'|'.'|'/'|':'|';'|'<'|'='|'>'|'?'|'@'|'['|']'|'^'|'_'|'´'|'`'|'{'|'|'|'}'|'~'|'\t'|'\\'|'\"');


