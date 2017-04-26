#include <stdio.h>
#include "def.h"

extern int yylex();
extern int yylineno;
extern char* yytext;

char *names[] = {NULL, "program", "begin", "end", "const", "var", "real", "integer", "procedure", "else", "read", "write", "while", "if" };

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
        printf("%s - Variável\n", yytext);
				break;
			case VAR_TYPE:
				printf("%s - Tipo de variável\n", yytext);
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
				printf("%s - Atribuição\n", yytext);
			  break;
			case RELATION:
				printf("%s - Relação\n", yytext);
				break;
			case UN_OP:
				printf("%s - Operador unário\n", yytext);
				break;
			case OP_MUL:
				printf("%s - Operador de multiplicação\n", yytext);
				break;
			case IDENTIFIER:
				printf("%s - Identificador\n", yytext);
				break;
			case INTEGER:
				printf("%s - Inteiro\n", yytext);
				break;
			case REAL:
				printf("%s - Real\n", yytext);
				break;
			case COMMA:
				printf("%s - Vírgula\n", yytext);
				break;
			case COLON:
				printf("%s - Dois pontos\n", yytext);
				break;
			case SEMI_COLON:
				printf("%s - Ponto e vírgula\n", yytext);
				break;
			case PARENTHESES:
				printf("%s - Parenteses\n", yytext);
				break;
			case BRACKETS:
				printf("%s - Chaves\n", yytext);
				break;
			case SQUARE_BRACKETS:
				printf("%s - Colchetes\n", yytext);
				break;
			default:
				printf("%s - ERRO! Caractere não pertence a linguagem\n", yytext);
			}
			ntoken = yylex();
  }

  return 0;
}
