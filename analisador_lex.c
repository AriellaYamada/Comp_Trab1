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
    printf("%d\n", ntoken);
    vtoken = yylex();
    switch (ntoken) {
      case PROGRAM:
        if(vtoken != IDENTIFIER) {
          printf("Erro de sintaxe na linha %d, É esperado um identificador, mas foi encontrado %d\n", yylieno, yytext);
          return 1;
        }
        printf("O nome do programa é %s\n", yytext);
        break;
      case BEGIN:
        if(vtoken != CMD) {
          printf("Erro de sintaxe na linha %d, é esperado um comando, mas foi encontrado %d\n", yylineno, yytext);
          return 1;
        }
        printf("Comando: %s\n", yytext);
        break;
      case CONST:
        if(vtoken != IDENTIFIER) {
          printf("Erro de sintaxe na linha %d, é esperado um identificador, mas foi encontrado %d\n", yylineno, yytext);
          return 1;
        }
        printf("Constante: %s\n", yytext);
        break;
      case VAR:
        if(vtoken != IDENTIFIER) {
          printf("Erro de sintaxe na linha %d, é esperado um identificador, mas foi encontrado %d\n", yylineno, yytext);
          return 1;
        }

        printf("Variável: %s\n", yytext);

    }
  }

  return 0;
}
