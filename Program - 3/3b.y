%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
int count = 0;
int error=0;
int yyerror();
%}
%token FOR LPAREN RPAREN LF RF ALPH NUM EQ LE GE ADDEQ SUBEQ INC DEC
%%
S : I
;
I : FOR A B { count++; }
;
A : LPAREN E ';' E ';' E RPAREN
;
E : ALPH Z NUM
| ALPH Z ALPH
| ALPH U
| /* empty */
;
Z : '='
| '>'
| '<'
| LE /* Placeholder for '<=' */

| GE /* Placeholder for '>=' */
| EQ /* Placeholder for '==' */
| ADDEQ /* Placeholder for '+=' */
| SUBEQ /* Placeholder for '-=' */
;
U : INC /* Placeholder for '++' */
| DEC /* Placeholder for '--' */
;
B : LF B RF
| I
| ALPH
| ALPH I
| /* empty */
;
%%
int main() {
yyparse();
if(error){
printf("error");
}
else{
printf("valid");
}
printf("Number of nested FOR's are: %d\n", count);
return 0;
}
int yyerror() {
error=1;
exit(0);
}
