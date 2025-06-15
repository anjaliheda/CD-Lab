%{
#include <stdio.h>
#include <stdlib.h>  
#include <string.h>
void yyerror(char const* s);
int yylex(); 
%}

%start S

%%

S: A B ;

A: 'a' A 'b' | ;

B: 'b' B 'c' | ;

%%

int main() {
    printf("Enter words\n");
    yyparse();  
    printf("true\n");
    return 0;
}

void yyerror(char const *s) {
    fprintf(stderr, "Invalid input: %s\n", s);
    exit(1);  
}

