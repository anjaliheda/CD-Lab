//Write a LEX program to count number of Positive and Negative integers and Positive &amp; Negative fractions.

%{
#include<stdio.h>
int nf = 0, p = 0, n = 0, pf = 0;
%}

%%
[+]?[0-9]*              { p++; }  // Matches positive integers
[-][0-9]*               { n++; }  // Matches negative integers
[+]?[0-9]*[.][0-9]*     { pf++; } // Matches positive fractions
[-][0-9]*[.][0-9]*      { nf++; } // Matches negative fractions

[+]?[0-9]*[.]*[0-9]*[/][+]?[0-9]*[.]*[0-9]*  { pf++; } // Matches positive fractions in fractions
[+]?[0-9]*[.]*[0-9]*[/][-][0-9]*[.]*[0-9]*  { nf++; } // Matches negative fractions in fractions
[-][0-9]*[.]*[0-9]*[/][+]?[0-9]*[.]*[0-9]*  { nf++; } // Matches negative fractions in fractions
[-]?[0-9]*[.]*[0-9]*[/][-]?[0-9]*[.]*[0-9]*  { pf++; } // Matches fractions in fractions
# { return 0; } // End input on '#' character
%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter numbers (use # to end):\n");
    yylex();  // Start lexical analysis

    // Correct printf syntax and format
    printf("Number of positive integers = %d\n", p);
    printf("Number of negative integers = %d\n", n);
    printf("Number of positive fractions = %d\n", pf);
    printf("Number of negative fractions = %d\n", nf);

    return 0;
}


// input:-1.2,-3.4,5.7,8,-90,-100,8
// lex 2.l
// gcc lex.yy.c
// ./a.out


