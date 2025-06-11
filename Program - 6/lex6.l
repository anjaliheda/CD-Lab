%{
#include "yacc6.tab.h"
%}

%%
[0-9]+ { yylval.sym = (char)yytext[0]; return NUMBER; }
[a-zA-Z]+ { yylval.sym = (char)yytext[0]; return LETTER; }
\n { return 0; }
. { return yytext[0]; }
%%
int yywrap() { return 1; }

// HOW TO RUN
// bison -d yacc6.y
// flex lex6.l
// gcc -o prog yacc6.tab.c lex.yy.c -lfl


// ./prog

// a=b+c*d;

