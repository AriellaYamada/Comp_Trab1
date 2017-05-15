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
%token DC_P
%token P_FALSE
%token CMD
%token ATTRIBUTION
%token RELATION
%token UN_OP
%token OP_MUL
%token IDENTIFIER
%token INTEGER
%token REAL
%token QUOTES
%token DOT
%token COMMA
%token COLON
%token SEMI_COLON
%token PARENTHESES
%token CURLY_BRACKETS
%token SQUARE_BRACKETS
%token ERROR


%%

/* regras da gramática */

programa : PROGRAM IDENTIFIER SEMI_COLON corpo DOT        {exit(EXIT_SUCCESS);}
  ;

corpo : dc BEGIN_ END
  ;

dc : dc_c dc_v dc_p
  ;

dc_c : CONST IDENTIFIER ATTRIBUTION numero SEMI_COLON dc_c
     |
  ;

dc_v :
  ;

dc_p :
  ;

numero : INTEGER
       | REAL
  ;

comandos : "comandos"
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

