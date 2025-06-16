//YACC program that reads the C statements for an input file and converts them in quadruple three address intermediate code.
%{
#include "y.tab.h"
%}

%%
[0-9]+ { yylval.sym = (char)yytext[0]; return NUMBER; }
[a-zA-Z]+ { yylval.sym = (char)yytext[0]; return LETTER; }
\n ; 
. { return yytext[0]; }
%%
int yywrap() { return 1; }

//lex 9.l
//yacc -d 6.y
// gcc lex.yy.c y.tab.c -o parser
// ./parser

// a=b+c*d;

