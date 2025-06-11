%{
#include <stdio.h>
#include <stdlib.h>  // To fix the 'exit' declaration warning
#include <string.h>
void yyerror(char const* s);
extern int yylex();  // Declare yylex() if using Flex
%}

%start S

%%

S: A B ;

A: 'a' A 'b' | ;

B: 'b' B 'c' | ;

%%

int main() {
    printf("Enter words\n");
    yyparse();  // Start the parsing process
    printf("true\n");
    return 0;
}

void yyerror(char const *s) {
    fprintf(stderr, "Invalid input: %s\n", s);
    exit(1);  // Exit with a non-zero status to indicate an error
}

