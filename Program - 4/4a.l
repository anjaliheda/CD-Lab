//Write a LEX program to recognize and count the number of identifiers, operators and keywords in a given input file.

%{
#include <stdio.h>
int key = 0, id = 0, op = 0;
%}

%%
"int"|"float"|"double"|"if"|"for"|"else"|"while"|"switch"|"printf"|"scanf"|"exit"|"return"|"case"|"main()" { key++; }
[a-zA-Z_][a-zA-Z0-9_]* { id++; }
[0-9] { /* ignore numbers */ }
[\+\-\*\/\&\|\!\(\)\{\}] { op++; }
[;] { /* ignore */ }
[,] { /* ignore */ }
[\t\n]+ { /* ignore whitespace */ }
[#] { return 0; }
[.]+ { printf("Invalid %s\n", yytext); }
%%

int yywrap() {
    return 1;
}

int main() {
    yyin = fopen("eg.c", "r");  // Use global yyin
    if (!yyin) {
        printf("Cannot open input file eg.c\n");
        return 1;
    }

    yylex();
    printf("\nKeywords=%d\nIdentifiers=%d\nOperators=%d\n", key, id, op);
    fclose(yyin);
    return 0;
}


// HOW TO RUN:
// flex lex4A.l
// gcc lex.yy.c -o lex4A -lfl
// ./lex4A



