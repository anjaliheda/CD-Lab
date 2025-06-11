%{
#include<stdio.h>
#include<stdlib.h>
int single = 0, multi = 0, multilines = 0;
%}

%%
"//"[^\n]*  { single++; }  // Matches single-line comments (//...)
"/*"[^*]*"*/" {  // Matches multi-line comments (/*...*/)
    multi++;
    for(int i = 0; i < yyleng; i++) {
        if(yytext[i] == '\n') {
            multilines++;
        }
    }
}
%%

int yywrap() {
    return 1;
}

int main() {
    // Open input and output files
    yyin = fopen("inp.txt", "r");
    yyout = fopen("out.txt", "w");

    // Start lexical analysis
    yylex();

    // Correct printf syntax
    printf("Single line comments = %d\n", single);
    printf("Multiline comments = %d\n", multi);
    printf("Number of lines in multiline comments = %d\n", multilines);

    return 0;
}


// make a separate inp.txt file with a few single line and multi-line comments
//lex 3a.l
// gcc lex.yy.c - ./a.out
//
