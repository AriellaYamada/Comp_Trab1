%%
,														printf("COMMA\n");
:                           printf("COLON\n");
;                           printf("SEMI_COLON\n");
"("|")"											printf("PARENTHESES\n");
"{"|"}"											printf("BRACKETS\n");
"["|"]"											printf("SQUARE BRACKES\n");
"program" printf("PROGRAM\n");
"begin" printf("BEGIN\n");
"end" printf("END\n");
"const" printf("CONST\n");
"var" printf("VAR\n");
"real"|"integer" printf("VAR_TYPE\n");
"procedure" printf("DC_P\n");
"else" printf("P_FALSE\n");
"read"|"write"|"while"|"if" printf("CMD\n");
"=" printf("ATTRIBUTION\n");
"<>"|">="|"<="|">"|"<" printf("RELATION\n");
"+"|"-" printf("UN_OP\n");
"*"|"/" printf("OP_MUL\n");
[a-z][a-z0-9]* printf("IDENTIFIER\n");
[1-9][0-9]* printf("INTEGER\n");
[0-9]"."[0-9] printf("REAL\n");
[ \r\t\n] printf(" ");

.					printf("unexpected character\n");
%%
int yywrap(void)
{
	return 1;
}
