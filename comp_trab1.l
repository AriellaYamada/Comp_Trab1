%{
#include "def.h"
%}
%%
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
,														return COMMA;
:                           return COLON;
;                           return SEMI_COLON;
"("|")"											return PARENTHESES;
"{"|"}"											return BRACKETS;
"["|"]"											return SQUARE_BRACKETS;
[ \r\t\n]					            			;
.														return ERROR;
%%
int yywrap(void)
{
	return 1;
}
