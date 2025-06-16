%{
#include <stdio.h>
#include <stdlib.h>

int max_depth = 0;
int current_depth = 0;

void yyerror(const char*);
int yylex(void);
%}

%token IF ALPHA NUM GEQ LEQ EQ LPAREN RPAREN LF RF

%%

S:
    stmt ';'
;

stmt:
    IF LPAREN cond RPAREN {
        current_depth++;
        if (current_depth > max_depth)
            max_depth = current_depth;
    }
    stmt {
        current_depth--;
    }
    | ALPHA
    | LF stmt RF
;

cond:
    ALPHA relop ALPHA
    | ALPHA relop NUM
;

relop:
    '<' | '>' | GEQ | LEQ | EQ
;

%%

int main() {
    printf("Enter a nested if expression (end with semicolon `;`):\n");
    yyparse();
    printf("Maximum nesting depth of if statements: %d\n", max_depth);
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Invalid input: %s\n", s);
    exit(1);
}

