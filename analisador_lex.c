#include <stdio.h>
#include <string.h>
#include "def.h"

extern int yylex();
extern int yylineno;
extern char* yytext;

char *names[] = {NULL, "program", "begin", "end", "const", "var", "real", "integer", "procedure", "else", "read", "write", "while", "if" };

void ver_Erro(char *s) {
	if(strstr(s, "program") != NULL)
		printf("ATENÇÃO! Pode haver erros de digitação - ");
	if(strstr(s, "begin") != NULL)
		printf("ATENÇÃO! Pode haver erros de digitação - ");
	if(strstr(s, "end") != NULL)
		printf("ATENÇÃO! Pode haver erros de digitação - ");
	if(strstr(s, "const") != NULL)
		printf("ATENÇÃO! Pode haver erros de digitação - ");
	if(strstr(s, "var") != NULL)
		printf("ATENÇÃO! Pode haver erros de digitação - ");
	if(strstr(s, "real") != NULL)
		printf("ATENÇÃO! Pode haver erros de digitação - ");
	if(strstr(s, "integer") != NULL)
		printf("ATENÇÃO! Pode haver erros de digitação - ");
	if(strstr(s, "procedure") != NULL)
		printf("ATENÇÃO! Pode haver erros de digitação - ");
	if(strstr(s, "else") != NULL)
		printf("ATENÇÃO! Pode haver erros de digitação - ");
	if(strstr(s, "read") != NULL)
		printf("ATENÇÃO! Pode haver erros de digitação - ");
	if(strstr(s, "write") != NULL)
		printf("ATENÇÃO! Pode haver erros de digitação - ");
	if(strstr(s, "while") != NULL)
		printf("ATENÇÃO! Pode haver erros de digitação - ");
	if(strstr(s, "if") != NULL)
		printf("ATENÇÃO! Pode haver erros de digitação - ");
	if(strstr(s, "wile") != NULL)
		printf("ATENÇÃO! Pode haver erros de digitação - ");
	if(strstr(s, "whole") != NULL)
		printf("ATENÇÃO! Pode haver erros de digitação - ");
	if(strstr(s, "proceddure") != NULL)
		printf("ATENÇÃO! Pode haver erros de digitação - ");
	if(strstr(s, "vsr") != NULL)
		printf("ATENÇÃO! Pode haver erros de digitação - ");
}

int main() {

  int ntoken, vtoken;

  ntoken = yylex();
  while(ntoken) {
    switch (ntoken) {
      case PROGRAM:
				printf("%s - Programa\n", yytext);
        break;
      case begin:
        printf("%s - Begin\n", yytext);
        break;
			case END:
				printf("%s - End\n", yytext);
				break;
      case CONST:
        printf("%s - Constante\n", yytext);
        break;
      case VAR:
        printf("%s - Variavel\n", yytext);
				break;
			case VAR_TYPE:
				printf("%s - Tipo de variavel\n", yytext);
				break;
			case DC_P:
				printf("%s - procedure\n", yytext);
				break;
			case P_FALSE:
				printf("%s - Else\n", yytext);
				break;
			case CMD:
				printf("%s - Comando\n", yytext);
				break;
			case ATTRIBUTION:
				printf("%s - Atribuicao\n", yytext);
			  break;
			case RELATION:
				printf("%s - Relacao\n", yytext);
				break;
			case UN_OP:
				printf("%s - Operador unario\n", yytext);
				break;
			case OP_MUL:
				printf("%s - Operador de multiplicacao\n", yytext);
				break;
			case IDENTIFIER:
				ver_Erro(yytext);
				printf("%s - Identificador\n", yytext);
				break;
			case INTEGER:
				printf("%s - Inteiro\n", yytext);
				break;
			case REAL:
				printf("%s - Real\n", yytext);
				break;
			case QUOTES:
				printf("%s - Aspas\n", yytext);
				break;
			case COMMA:
				printf("%s - Virgula\n", yytext);
				break;
			case COLON:
				printf("%s - Dois pontos\n", yytext);
				break;
			case SEMI_COLON:
				printf("%s - Ponto e virgula\n", yytext);
				break;
			case PARENTHESES:
				printf("%s - Parenteses\n", yytext);
				break;
			case CURLY_BRACKETS:
				printf("%s - Chaves\n", yytext);
				break;
			case SQUARE_BRACKETS:
				printf("%s - Colchetes\n", yytext);
				break;
			default:
				printf("%s - ERRO! Caractere nao pertence a linguagem\n", yytext);
			}
			ntoken = yylex();
  }

  return 0;
}
