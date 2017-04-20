%{
include "def.h"
%}
%%
:                           return COLON;
;                           return SEMI_COLON;
"program"                   return PROGRAM;
"begin"                     return BEGIN;
"end"                       return END;
"const"                     RETURN CONST;
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
[1-9]+[0-9]*                return INTEGER;
[0-9]+"."[0-9]+             return REAL;
[ \t\n]					            ;
.					printf("unexpected character\n");
%%
int yywrap(void)
{
	return 1;
}
