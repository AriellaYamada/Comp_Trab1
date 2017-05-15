all:
	yacc -d lalg.y
	lex comp_trab2.l
	gcc -g lex.yy.c y.tab.c -o lalg

clean: 
	rm -f lex.yy.c y.tab.c y.tab.h lalg

