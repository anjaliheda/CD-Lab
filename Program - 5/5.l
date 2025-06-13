//Write a YACC program to recognize Declaration statement (C language) and display the number variables declared .

%{
#include "y.tab.h"
%}

%%
"int"       { return INT; }
"float"     { return FLOAT; }
"char"      { return CHAR; }
"double"    { return DOUBLE; }
[a-zA-Z_][a-zA-Z0-9_]*  { yylval.str = strdup(yytext); return IDENTIFIER; }
[0-9]+      { yylval.num = atoi(yytext); return NUM; }
"["         { return '['; }
"]"         { return ']'; }
","         { return ','; }
";"         { return ';'; }
[ \t\n]     { /* ignore whitespace */ }
.           { /* ignore any other characters */ }
%%

int yywrap() {
    return 1;
}


// HOW TO RUN
// bison -d yacc5.y       
// flex lex5.l         
// gcc -o decl_parser yacc5.tab.c lex.yy.c -lfl

// ./decl_parser

// int a[10], b, c;
// float x, y[5];

