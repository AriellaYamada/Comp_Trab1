
%%
"program" printf("PROGRAM");
"begin" printf("BEGIN");
"end" printf("END");
"var" printf("VAR");
"real"|"integer" printf("VAR_TYPE");
.					printf("unexpected character\n");
%%
int yywrap(void)
{
	return 1;
}
