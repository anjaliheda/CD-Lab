%{
#include "y.tab.h"
extern YYSTYPE yylval;
%}

%%
[0-9]* {yylval=atoi(yytext);return NUM;}
[-+*/] {return yytext[0];}
. {return yytext[0];};
\n {return 0;}
%%

// lex 2b.l
//yacc -d 2b.l
//gcc lex.yy.c y.tab.c -ll
// ./a.out
