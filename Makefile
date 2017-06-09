all:
	yacc -d lalg.y
	lex comp_trab2.l
	gcc -g analisador_lex_sint.c lex.yy.c y.tab.c -o lalg

test1:
	./lalg "Exemplos/exemplo1.in"

test2:
	./lalg "Exemplos/exemplo2.in"

test3:
	./lalg "Exemplos/exemplo3.in"

test4:
	./lalg "Exemplos/exemplo4.in"

clean: 
	rm -f lex.yy.c y.tab.c y.tab.h lalg

