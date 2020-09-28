
EVEN [02468]
ODD [13579]

%{
#include <stdio.h>
#include <stdlib.h>
int num_counter = 0;

//\b(([2468]?([13579][02468])+)|[02468])\b {num_counter++; printf("%s\n",yytext); printf("Got here...\n");}

%}


%%

(([2468]?([13579][02468])+)|[02468]) {num_counter++; printf("%s\n",yytext); printf("Got here...\n");}

%%
int main(void)
{
	yylex();
	//printf("%d\n", atoi(yytext));
	printf("Total count of lexems being found: %d\n", num_counter);
	return 0;
}
