//Write a LEX program to count number of words, lines, characters and whitespaces in a given paragraph.

%{
#include <stdio.h>
int lines = 1, spaces = 0, words = 0, characters = 0;
%}
%%
[ ]              {spaces++;}              // Counts spaces
[\t]             {spaces = spaces + 3;}    // Counts tabs as 3 spaces
[\n]             {lines++;}                // Counts newlines
[a-zA-Z]+        {words++; characters = characters + yyleng;} // Counts words and characters
#                {return 0;}                // Ends input on '#'
%%
int yywrap() {
    return 1;
}

int main() {
    printf("Enter a paragraph:\n");  // Prompt for user input
    yylex();  // Process input from stdin according to the rules above

    // Output the statistics after input ends
    printf("Number of lines = %d\n", lines);
    printf("Number of spaces = %d\n", spaces);
    printf("Number of words = %d\n", words);
    printf("Number of characters = %d\n", characters);
    return 0;
}


// lex 1.l
// gcc lex.yy.cc
// ./a.out
