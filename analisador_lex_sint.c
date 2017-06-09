#include <stdio.h>
#include <string.h>
#include "y.tab.h"

extern int yylex();
extern int yylineno;
extern char* yytext;
extern FILE* yyin;

int main (int argc, char* argv[]) {

  // verifica se há um nome de arquivo passado como argumento
  if (argc < 2) {
    printf("É necessário passar o nome do arquivo como argumento.\n");
    return -1;
  }

  int ntoken, vtoken;
  int hasLexicalError = 0; // flag que identifica se encontrou erro léxico
  yyin = fopen(argv[1], "r"); // define que a entrada será de um arquivo e nao do stdin

  printf("*** Iniciando analise lexica! ***\n");
  ntoken = yylex();
  while (ntoken) {
    hasLexicalError = 0;
    switch (ntoken) {
      case PROGRAM:
        printf("%s - Programa\n", yytext);
        break;
      case BEGIN_:
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
      case PROCEDURE:
        printf("%s - Procedimento\n", yytext);
        break;
      case CMD_READ:
        printf("%s - Comando Read\n", yytext);
        break;
      case CMD_WRITE:
        printf("%s - Comando Write\n", yytext);
        break;
      case CMD_WHILE:
        printf("%s - Comando While\n", yytext);
        break;
      case CMD_FOR:
        printf("%s - Comando For\n", yytext);
        break;
      case TO:
        printf("%s - To\n", yytext);
        break;
      case CMD_DO:
        printf("%s - Comando Do\n", yytext);
        break;
      case CMD_IF:
        printf("%s - Comando If\n", yytext);
        break;
      case CMD_THEN:
        printf("%s - Comando Then\n", yytext);
        break;
      case CMD_ELSE:
        printf("%s - Comando Else\n", yytext);
        break;
      case ATTRIBUTION:
        printf("%s - Atribuicao\n", yytext);
        break;
      case RELATION:
        printf("%s - Relacao\n", yytext);
        break;
      case OP_AD:
        printf("%s - Operador Adicao\n", yytext);
        break;
      case OP_MUL:
        printf("%s - Operador Multiplicacao\n", yytext);
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
      case DOT:
        printf("%s - Ponto\n", yytext);
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
      case OPEN_PARENTHESES:
        printf("%s - Abre parenteses\n", yytext);
        break;
      case CLOSE_PARENTHESES:
        printf("%s - Fecha parenteses\n", yytext);
        break;
      case ERROR:
        // se erro, seta a flag como 1(true)
        hasLexicalError = 1;
        break;
      }
      if (hasLexicalError) {
        printf("Erro léxico encontrado. Abortando compilação.\n");
        fclose (yyin);
        return -1;
      }
      ntoken = yylex();
  }
  printf("*** Analise lexica finalizada com sucesso! ***\n\n");

  yylineno = 1; // reseta a contagem do número da linha
  rewind(yyin); // reseta o ponteiro do arquivo para o inicio do mesmo

  printf("*** Iniciando analise sintatica! ***\n");
  if (parse() == 0) {
    printf("*** Analise sintatica finalizada com sucesso! ***\n");
    fclose (yyin);
    return 0;
  } else {
    printf("Erro sintatico na Linha: %d - Token encontrado: '%s'. Abortando compilação!\n", yylineno, yytext);
    fclose (yyin);
    return -1;
  }

  return 0;
}
