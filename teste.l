
%%
"program" printf("PROGRAM");
"begin" printf("BEGIN");
"end" printf("END");
"var" printf("VAR");
"real"|"integer" printf("VAR_TYPE");
"procedure" printf("DC_P");
"else" printf("P_FALSE");
"read"|"write"|"while"|"if" printf("CMD");
"="|"<>"|">="|"<="|">"|"<" printf("RELATION");
"+"|"-" printf("UN_OP");
"*"|"/" printf("OP_MUL");
[a-z][a-z0-9]* printf("IDENTIFIER");
[1-9]+[0-9]* printf("INTEGER");
[0-9]+"."[0-9]+ printf("REAL");

.					printf("unexpected character\n");
%%
int yywrap(void)
{
	return 1;
}
