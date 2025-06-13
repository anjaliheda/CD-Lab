Write a YACC program to recognize a nested (minimum3levels)FOR loop statement for C language.
%{
#include "y.tab.h"
%}
%%
"for" { return FOR; }
"(" { return LPAREN; }

")" { return RPAREN; }
"{" { return LF; }
"}" { return RF; }
"=" { return '='; }
"-" { return '-'; }
"+" { return '+'; }
">" { return '>'; }
"<" { return '<'; }
";" { return ';'; }
"==" { return EQ; }
"<=" { return LE; }
">=" { return GE; }
"+=" { return ADDEQ; }
"-=" { return SUBEQ; }
"++" { return INC; }
"--" { return DEC; }
[a-zA-Z]+ { return ALPH; }
[0-9]+ { return NUM; }
[ \t] { /* Ignore */ }
# { return 0; }
. { /* Ignore */ }
%%
int yywrap(){
return 1;
}
