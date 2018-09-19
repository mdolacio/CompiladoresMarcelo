parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program: CLASS  PROGRAM LCURLY (declaracao)* (metodo)* RCURLY;

declaracao: 
	(tipo id | tipo id ABRECOLCHETE int_literal FECHACOLCHETE)
	(VIRGULA (tipo id | tipo id ABRECOLCHETE int_literal FECHACOLCHETE))* PONTOEVIRGULA;

metodo: (tipo|VOID) id ABREPAR (tipo id(VIRGULA tipo id)*)* FECHAPAR bloco;

bloco : ABRECHAVE (var_declarada)* (statement)* FECHACHAVE;

var_declarada : tipo id(VIRGULA id)* PONTOEVIRGULA;


tipo: INT | BOOLEAN;

statement : localizacao assinatura expressao PONTOEVIRGULA
            | metodo_call PONTOEVIRGULA
            | IF ABREPAR expressao FECHAPAR bloco (ELSE bloco)* 
	    | FOR id IGUAL expressao VIRGULA expressao bloco
	    | RETURN (expressao)* PONTOEVIRGULA
	    | BREAK PONTOEVIRGULA
	    | CONTINUE PONTOEVIRGULA
	    | bloco;




expressao: ;

id : ID;

int_literal: NUMBER;

bloco: CHAR;
