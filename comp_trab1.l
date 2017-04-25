%{
#include "def.h"
%}
%%
,														printf("COMMA\n");
:                           printf("COLON\n");
;                           printf("SEMI_COLON\n");
"("|")"											printf("PARENTHESES\n");
"{"|"}"											printf("BRACKETS\n");
"["|"]"											printf("SQUARE BRACKES\n");
"program"                   return PROGRAM;
"begin"                     return begin;
"end"                       return END;
"const"                     return CONST;
"var"                       return VAR;
"real"|"integer"            return VAR_TYPE;
"procedure"                 return DC_P;
"else"                      return P_FALSE;
"read"|"write"|"while"|"if" return CMD;
"="                         return ATTRIBUTION;
"<>"|">="|"<="|">"|"<"      return RELATION;
"+"|"-"                     return UN_OP;
"*"|"/"                     return OP_MUL;
[a-z][a-z0-9]*              return IDENTIFIER;
[1-9][0-9]*     	          return INTEGER;
[0-9]"."[0-9]		            return REAL;
[ \r\t\n]					            			;
.					printf("unexpected character\n");
%%
int yywrap(void)
{
	return 1;
}
