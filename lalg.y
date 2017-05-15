/*
  TODO LIST
  - colocar todas as regras gramaticais
  - salvar os identificadores e valores
  - ao utilizar um identificador, verificar se o mesmo já existe
  - inclusão do comando 'for'
  - tratamento de erros
*/
%{
void yyerror (char *s);
#include <stdio.h>     /* C declarations used in actions */
#include <stdlib.h>
int symbols[52];
int symbolVal(char symbol);
void updateSymbolVal(char symbol, int val);
%}

%union {int num; char id;} /* estrutura que vai guardar os identificadores e valores */
%start programa /* regra inicial */
/* %token <num> number
%token <id> identifier
%type <num> line exp term
%type <id> assignment */

/* tokens que estavam em def.h agora são definidos aqui */
/* o yacc gera o y.tab.h que substitui o def.h */
%token PROGRAM
%token BEGIN_
%token END
%token CONST
%token VAR
%token VAR_TYPE
%token PROCEDURE
%token CMD_READ
%token CMD_WRITE
%token CMD_WHILE
%token CMD_DO
%token CMD_IF
%token CMD_THEN
%token CMD_ELSE
%token ATTRIBUTION
%token RELATION
%token OP_AD
%token OP_MUL
%token IDENTIFIER
%token INTEGER
%token REAL
%token QUOTES
%token DOT
%token COMMA
%token COLON
%token SEMI_COLON
%token OPEN_PARENTHESES
%token CLOSE_PARENTHESES
%token CURLY_BRACKETS
%token SQUARE_BRACKETS
%token ERROR


%%

/* regras da gramática */

programa : PROGRAM IDENTIFIER SEMI_COLON corpo DOT        {exit(EXIT_SUCCESS);}
  ;

corpo : dc BEGIN_ comandos END
  ;

dc : dc_c dc_v dc_p
  ;

dc_c : CONST IDENTIFIER ATTRIBUTION numero SEMI_COLON dc_c
     | /* lambda */
  ;

dc_v : VAR variaveis COLON VAR_TYPE SEMI_COLON dc_v
     | /* lambda */
  ;

variaveis : IDENTIFIER mais_var
          | /* lambda */
  ;

mais_var : COMMA variaveis
         | /* lambda */
  ;

dc_p : PROCEDURE IDENTIFIER parametros SEMI_COLON corpo_p dc_p
     | /* lambda */
  ;

parametros : OPEN_PARENTHESES lista_par CLOSE_PARENTHESES
           | /* lambda */
  ;

lista_par : variaveis COLON VAR_TYPE mais_par
  ;

mais_par : SEMI_COLON lista_par
         | /* lambda */
  ;

corpo_p : dc_loc BEGIN_ comandos END SEMI_COLON
        | /* lambda */
  ;

dc_loc : dc_v
  ;

lista_arg : OPEN_PARENTHESES argumentos CLOSE_PARENTHESES
          | /* lambda */
  ;

argumentos : IDENTIFIER mais_ident
  ;

mais_ident : SEMI_COLON argumentos
           | /* lambda */
  ;

pfalsa : CMD_ELSE cmd
       | /* lambda */
  ;

comandos : cmd SEMI_COLON comandos
         | /* lambda */
  ;

cmd : CMD_READ OPEN_PARENTHESES variaveis CLOSE_PARENTHESES
    | CMD_WRITE OPEN_PARENTHESES variaveis CLOSE_PARENTHESES
    | CMD_WHILE OPEN_PARENTHESES condicao CMD_DO cmd
    | CMD_IF condicao CMD_THEN cmd pfalsa
    | IDENTIFIER ATTRIBUTION expressao
    | IDENTIFIER lista_arg
    | BEGIN_ comandos END
  ;

condicao : expressao RELATION expressao

expressao : termo outros_termos

op_un : OP_AD
      | /* lambda */
  ;

outros_termos : OP_AD termo outros_termos
              | /* lambda */
  ;

termo : op_un fator mais_fatores

mais_fatores : OP_MUL fator mais_fatores
             | /* lambda */
  ;

fator : IDENTIFIER
      | numero
      | OPEN_PARENTHESES expressao CLOSE_PARENTHESES
  ;

numero : INTEGER
       | REAL
  ;

/* regras da gramática de exemplo */

/*
line    : assignment ';'    {;}
    | exit_command ';'    {exit(EXIT_SUCCESS);}
    | print exp ';'     {printf("Printing %d\n", $2);}
    | line assignment ';' {;}
    | line print exp ';'  {printf("Printing %d\n", $3);}
    | line exit_command ';' {exit(EXIT_SUCCESS);}
        ;

assignment : identifier '=' exp  { updateSymbolVal($1,$3); }
      ;
exp     : term                  {$$ = $1;}
        | exp '+' term          {$$ = $1 + $3;}
        | exp '-' term          {$$ = $1 - $3;}
        ;
term    : number                {$$ = $1;}
    | identifier      {$$ = symbolVal($1);} 
        ;
*/
%%                     /* C code */

int computeSymbolIndex(char token)
{
  int idx = -1;
  if(islower(token)) {
    idx = token - 'a' + 26;
  } else if(isupper(token)) {
    idx = token - 'A';
  }
  return idx;
} 

/* returns the value of a given symbol */
int symbolVal(char symbol)
{
  int bucket = computeSymbolIndex(symbol);
  return symbols[bucket];
}

/* updates the value of a given symbol */
void updateSymbolVal(char symbol, int val)
{
  int bucket = computeSymbolIndex(symbol);
  symbols[bucket] = val;
}

int main (void) {
  /* init symbol table */
  int i;
  for(i=0; i<52; i++) {
    symbols[i] = 0;
  }

  return yyparse ( );
}

void yyerror (char *s) {fprintf (stderr, "%s\n", s);} 

