/*** Definition Section has one variable 
which can be accessed inside yylex() 
and main() ***/
%{ 
#include<stdio.h>
%}

DIGIT [0-9]
NUMBER {DIGIT}+
TEXT [a-zA-Z ]+
TEXT_NUMBERS [a-zA-Z0-9]
DELIMITER [;:()"]
WHITESPACE " "|\t|\n
COMMENT "/*"[a-zA-Z0-9 \t\n;.~!@#$%^&*()_+=<>?:"{}]*"*/"|"//"[a-zA-Z0-9 \t;.~!@#$%^&*()_+=<>?:"{}]*"\n"
IDENTIFIER [a-zA-Z]{TEXT_NUMBERS}*|[a-zA-Z]{TEXT_NUMBERS}*[[{NUMBER}+]]|"_"{TEXT_NUMBERS}*[[{NUMBER}+]]
NON_IDENTIFIER {NUMBER}+[A-Za-z]+
KEYWORD "array"|"boolean"|"char"|"else"|"false"|"for"|"function"|"if"|"integer"|"print"|"return"|"string"|"true"|"void"|"while"
AOPERATOR "+"|"-"|"*"|"/"|"="


/*** Rule Section has three rules, first rule 
matches with capital letters, second rule 
matches with any character except newline and 
third rule does not take input after the enter***/ 
%%
{DIGIT} { printf("%s is a digit\n", yytext); }
{NUMBER} { printf("%s is a number\n", yytext); }
{DELIMITER} { printf("%s is a delimiter\n", yytext); }
{KEYWORD} { printf("%s is a keyword\n", yytext); }
{NON_IDENTIFIER} {printf("Could not process %s", yytext); }
{IDENTIFIER} { printf("%s is an identifier\n", yytext); }
{COMMENT} { }
{AOPERATOR} { printf("%s is a mathematical operator\n", yytext); }

%%
/*** Code Section prints the number of 
capital letter present in the given input***/
int yywrap(){} 
int main(){ 
// Explanation: 
// yywrap() - wraps the above rule section 
/* yyin - takes the file pointer 
		which contains the input*/
/* yylex() - this is the main flex function 
		which runs the Rule Section*/
// yytext is the text in the buffer 

// Uncomment the lines below 
// to take input from file 
yyin = fopen("test.bminor","r");
		yylex();
return 0; 
} 
