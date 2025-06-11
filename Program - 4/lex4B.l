%{
#include "yacc4B.tab.h"
%}

%%
"if"        { return IF; }
"("         { return LPAREN; }
")"         { return RPAREN; }
"{"         { return LF; }
"}"         { return RF; }
";"         { return ';'; }
"<="        { return LEQ; }
">="        { return GEQ; }
"=="        { return EQ; }
"<"         { return '<'; }
">"         { return '>'; }
"="         { return '='; }
"+"         { return '+'; }
"-"         { return '-'; }
[ \t\n]+    { /* ignore whitespace */ }
[a-zA-Z_][a-zA-Z0-9_]* { return ALPHA; }
[0-9]+      { return NUM; }
"#"         { return 0; }
.           { /* ignore other chars */ }
%%
int yywrap() { return 1; }


// HOW TO RUN:
// bison -d yacc4B.y      
// flex lex4B.l              
// gcc yacc4B.tab.c lex.yy.c -o ifparser -lfl

// ./ifparser

// if(a<5) if(b>3) if(c==1) d;
// ;


