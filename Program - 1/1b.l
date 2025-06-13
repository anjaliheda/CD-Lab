//Write a YACC program to recognize strings of the form a n b n+m c m , n,m&gt;=0.

%{
#include "y.tab.h"
%}
%%
'a' {return 'a';}
'b' {return 'b';}
'c' {return 'c';}
. {return yytext[0];}
[\n] {return 0;}
%%

// input: aaabbb

//commands: lex 1.l
// yacc -d 1b.y
//gcc lex.yy.c y.tab.c -ll
//./a.out

