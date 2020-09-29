
EVEN [02468]
ODD [13579]

%{
#include <stdio.h>
#include <stdlib.h>
#define MAX_TOKENS 32

int num_counter = 0;
int num_array[MAX_TOKENS];

//word boundary vers
//\b(([2468]?([13579][02468])+)|[02468])\b {num_counter++; printf("%s\n",yytext); printf("Got here...\n");}

// (([2468]?([13579][02468])+)|[02468]) {num_counter++; printf("%s\n",yytext); printf("Got here...\n");}

//grouping vers
//(^|\s)((?:[2468]?(?:[13579][02468])+)|[02468])(?=\s)

// using $2
// (^|\s)((?:[2468]?(?:[13579][02468])+)|[02468])(?=\s) {num_counter++; printf("found 2nd group: %s\n", $2);/* printf("%s\n",yytext);*/}

%}


%%

(^|[ \t\n])(([13579]?([2468][13579])+)|[13579])($|[ \t\n]) {*(num_array + num_counter) = atoi(yytext); num_counter++; /*printf("%s\n",yytext);*/}

. ;

%%
int main(void)
{
	yylex();
	//printf("%d\n", atoi(yytext));
	printf("List of tokens:\n");
	if(num_counter <= MAX_TOKENS)
	{
		for(int i = 0; i < num_counter; i++)
		{
			printf("%d. %d\n", i, *(num_array + i));
		}
	}
	else
	{
		printf("Number of tokens is more than output array limits...\n");
	}
	printf("Total count of tokens being found: %d\n", num_counter);
	return 0;
}
