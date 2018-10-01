parser grammar DecafParser;

@header {
package decaf; 
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program: CLASS PROGRAM LCURLY (declaracao)* (metodo)* RCURLY;

declaracao:
	(tipo id | tipo id ABRECOLCHETE int_literal FECHACOLCHETE)
	(VIRGULA (tipo id | tipo id ABRECOLCHETE int_literal FECHACOLCHETE))* PONTOEVIRGULA;

    	
metodo: (tipo|VOID) id ABREPAR (tipo id(VIRGULA tipo id)*)* FECHAPAR bloco;

bloco : LCURLY var_declarada* statement* RCURLY;

var_declarada : tipo id(VIRGULA id)* PONTOEVIRGULA;


tipo: INT | BOOLEAN;

statement :  location assign_op expr PONTOEVIRGULA
            | metodo_call PONTOEVIRGULA
            | IF ABREPAR expr FECHAPAR bloco (ELSE bloco)?
       	    | FOR id ATRIB expr VIRGULA expr bloco
            | RETURN (expr)* PONTOEVIRGULA
            | BREAK PONTOEVIRGULA
            | CONTINUE PONTOEVIRGULA
            | bloco;

assign_op : ATRIB|MAISIGUAL|MENOSIGUAL;

metodo_call : metodo_nome ABREPAR ( expr(VIRGULA expr)*)? FECHAPAR
          |CALLOUT ABREPAR string_literal ( VIRGULA callout_arg(VIRGULA callout_arg)*)? FECHAPAR;

callout_arg: expr | string_literal;

metodo_nome: id
         |id ABRECOLCHETE expr FECHACOLCHETE;

location: id
	  |id ABRECOLCHETE expr FECHACOLCHETE;

expr: location
      |metodo_call
      |literal
      |expr  bin_op expr
      | MENOS expr
      | EXCLAMACAO expr
      | ABREPAR expr FECHAPAR;



bin_op: arith_op | rel_op | eq_op | cond_op;

arith_op: MAIS|MENOS|MULT|DIV|RESTO ;

rel_op: MENOR|MAIOR|MENORIGUAL|MAIORIGUAL;

eq_op: IGUAL|DIF;

cond_op: EEE| OU;

literal: int_literal | char_literal | bool_literal;

id: ID ;

alpha_num: alpha | digit;

alpha: LETRA;

digit:NUMBER;

int_literal: NUMBER;

decimal_literal: digit digit*;

hex_literal: HEXA;

bool_literal: NHA;

char_literal: CHAR;

string_literal: STRING;


