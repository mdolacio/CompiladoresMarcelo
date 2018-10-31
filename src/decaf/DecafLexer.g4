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

TIPO: INT | BOOLEAN;
INT: 'int';
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
LCURLY : '{';
RCURLY : '}';



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
OU : '||';
IGUAL : '==';
DIF: '!=';
MAIOR : '>';
MAIORIGUAL:'>=';
MENOR : '<';
MENORIGUAL: '<=';

MAISIGUAL: '+=';
MENOSIGUAL: '-=';
MENOS: '-';
ATRIB: '=';
EEE: '&&';
EXCLAMACAO: '!';
UNDERLINE: '_';
MAIS: '+';
MULT:'*';
DIV:'/';
RESTO:'%';


NHA: ('true'|'false');
                                                                                                
ID  : ('_'|LETRAS)(LETRAS|'_'|NUMEROS)*;

CHAR : '\'' (ESC|LETRAS|NUMEROS) '\'';

STRING : '"' (LETRAS|NUMEROS|ESPECIAL)*    '"';


OPERADORES : ('+'|'-'|'*'|'/'|'<'|'<='|'!='|'&&');

LETRA : ('a'..'z' | 'A'..'Z');

fragment
ESC :  '\\' ('n'|'"'|'t'|'\\'|'\''|'\"');

fragment
LETRAS : ('a'..'z' | 'A'..'Z');

fragment
NUMEROS : ('0'..'9');

fragment
ESPECIAL : (' '|'!'|'"'|'#'|'$'|'%'|'&'|'\\\''|'('|')'|'*'|'+'|','|'-'|'.'|'/'|':'|';'|'<'|'='|'>'|'?'|'@'|'['|']'|'^'|'_'|'´'|'`'|'{'|'|'|'}'|'~'|'\t'|'\\'|'\"');
