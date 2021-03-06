%{
  #include "y.tab.h"
%}

%option yylineno

%%
"program"                   return PROGRAM;
"begin"                     return BEGIN_;
"end"                       return END;
"const"                     return CONST;
"var"                       return VAR;
"real"|"integer"            return VAR_TYPE;
"procedure"                 return PROCEDURE;
"read"                      return CMD_READ;
"write"                     return CMD_WRITE;
"while"                     return CMD_WHILE;
"for"                       return CMD_FOR;
"to"                        return TO;
"do"                        return CMD_DO;
"if"                        return CMD_IF;
"then"                      return CMD_THEN;
"else"                      return CMD_ELSE;
":="                        return ATTRIBUTION;
"="|"<>"|">="|"<="|">"|"<"  return RELATION;
"+"|"-"                     return OP_AD;
"*"|"/"                     return OP_MUL;
[a-z][a-z0-9]*              return IDENTIFIER;
[0-9]+                      return INTEGER;
[0-9]+"."[0-9]+             return REAL;
"."                         return DOT;
,                           return COMMA;
:                           return COLON;
;                           return SEMI_COLON;
"("                         return OPEN_PARENTHESES;
")"                         return CLOSE_PARENTHESES;
"{"[^\n]*"}"                ; // ignorar comentários
[ \r\t\n]                   ;
.                           {printf("ERRO: Linha %d - Encontrado: '%s'.\n", yylineno, yytext); return ERROR;}
%%
int yywrap(void)
{
  return 1;
}
