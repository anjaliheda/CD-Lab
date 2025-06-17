//Write a YACC program to recognize Declaration statement (C language) and display the number variables declared .
%{
#include "y.tab.h"
%}

%%

"int"       { return INT; }
"float"     { return FLOAT; }
"char"      { return CHAR; }
"double"    { return DOUBLE; }
[a-zA-Z_][a-zA-Z0-9_]*    { return ID; }
","         { return ','; }
";"         { return ';'; }
[ \t\n]     { /* skip whitespace */ }
.           { /* skip others */ }

%%
int yywrap() { return 1; }
