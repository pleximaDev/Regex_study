#lex -o test.yy.c cntr.l
lex -o temp.yy.c $1
#gcc -o ex temp.yy.c -lfl
gcc -o ex temp.yy.c -ll
#./ex

