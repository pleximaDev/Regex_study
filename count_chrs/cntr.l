%{
#include "stdio.h"
//extern int chr_count;
int chr_count = 0;
int lines_count = 0;
%}

%%

\n ++lines_count;
. ++chr_count;

%%
int main(void)
{
	yylex();
	printf("num of chars: %d\n", chr_count);
	printf("num of lines: %d\n", lines_count);
	return 0;
}
