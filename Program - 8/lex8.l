//Write a YACC program that generates Assembly language (Target) Code for
valid Arithmetic Expression.

%{
#include "yacc8.tab.h"
#include <stdlib.h>
#include <string.h>
%}
DIGIT [0-9]
ID [a-zA-Z][a-zA-Z0-9]*
WS [ \t\n]
STRING \"[^"]*\"
%%
"int" { return INT; }
"main" { return MAIN; }
"printf" { return PRINTF; }
{STRING} { yylval.str = strdup(yytext); return STRING; }
{ID} { yylval.id = strdup(yytext); return ID; }
{DIGIT}+ { yylval.num = atoi(yytext); return NUM; }
"+" { return ADD; }
"=" { return ASSIGN; }
"(" { return LPAREN; }
")" { return RPAREN; }
";" { return SEMI; }
"," { return COMMA; }
"{" { return LBRACE; }
"}" { return RBRACE; }

{WS} ; /* ignore whitespace */
%%
int yywrap() { return 1; }

// HOW TO RUN
// bison -d yacc8.y
// flex lex8.l
// gcc -o output yacc8.tab.c lex.yy.c -lfl

// echo 'int main(){int a=5;int b=10; a=b+a; printf("Sum %d\n",a);}' | ./output

