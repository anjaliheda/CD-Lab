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

// HOW TO RUN
// bison -d yacc6.y
// flex lex6.l
// gcc -o prog yacc6.tab.c lex.yy.c -lfl


// ./prog

// a=b+c*d;

