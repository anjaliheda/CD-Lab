%{
#include <stdio.h>
int count = 0;
int yylex(void);
void yyerror(const char *s) { printf("Error: %s\n", s); }
%}

%token INT FLOAT CHAR DOUBLE ID

%%

S : DCLS ;
DCLS : DCLS DECL ';'
     | DECL ';'
     ;

DECL : TYPE VARS ;

TYPE : INT | FLOAT | CHAR | DOUBLE ;

VARS : ID         { count++; }
     | VARS ',' ID { count++; }
     ;

%%

int main() {
    printf("Enter declaration(s):\n");
    yyparse();
    printf("Total variables declared: %d\n", count);
    return 0;
}
