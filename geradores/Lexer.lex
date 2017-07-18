import java_cup.runtime.Symbol;

%%
%cup
%public
%class Lexer
%line
%column
%type java_cup.runtime.Symbol

Inteiro = Inteiro																																	
Flutuante = Flutuante
Texto = Texto
Aceito = Aceito
Negado = Negado
Repeticao = Repeticao
ESPACO = [ \t]
NUMERO = [0-9]
INTEIRO_NUM = {NUMERO}+
FLUTUANTE_NUM = {NUMERO}+[.]{NUMERO}+
CADEIA_CARACTERES = [\"][A-Za-z0-9]+[\"]
QUEBRA_LINHA = [\r]?[\n]
ID = [A-Za-z_][A-Za-z0-9_]*
%%

<YYINITIAL> {
	{Inteiro}                { return new Symbol(Sym.Inteiro); }
	{Flutuante}              { return new Symbol(Sym.Flutuante); }
	{Texto}                  { return new Symbol(Sym.Texto); }
	
	{Aceito}                 { return new Symbol(Sym.Aceito); }
	{Negado}                 { return new Symbol(Sym.Negado); } 
	{Repeticao}              { return new Symbol(Sym.Repeticao); } 
	
	":"                      { return new Symbol(Sym.END); }  
	"("               		 { return new Symbol(Sym.Open_Par); }   
	")"         		     { return new Symbol(Sym.Close_Par); }  
	"["						 { return new Symbol(Sym.Open_C); } 
	"]"						 { return new Symbol(Sym.Close_C); } 
	"{"                      { return new Symbol(Sym.Open_Key); }
	"}"                      { return new Symbol(Sym.Close_Key); }  
	">"                      { return new Symbol(Sym.MAIOR); }
	"<"                      { return new Symbol(Sym.MENOR); }
   	"="                      { return new Symbol(Sym.ATT); }
   	"=="                     { return new Symbol(Sym.IGUAL); }
	"+"               		 { return new Symbol(Sym.SOMA_OP); }
	"-"           			 { return new Symbol(Sym.SUBTRACAO_OP); }
	"*"                 	 { return new Symbol(Sym.MULTIPLICACAO_OP); }
	"/"                      { return new Symbol(Sym.DIVISAO_OP); }
	"^"                      { return new Symbol(Sym.POTENCIACAO_OP); }
  
	{FLUTUANTE_NUM}          { return new Symbol(Sym.FLUTUANTE_NUM, Double.parseDouble(yytext()); }
	{INTEIRO_NUM}            { return new Symbol(Sym.INTEIRO_NUM, Integer.parseInt(yytext()); }
	{CADEIA_CARACTERES}      { return new Symbol(Sym.CADEIA_CARACTERES); }  

	{ID}                     { return new Symbol(Sym.ID, yytext()); }  
	{QUEBRA_LINHA}           { }
	{ESPACO}                 { }
  

  [^]					 { throw new RuntimeException("Illegal character \""+yytext()+
                                                              "\" at line "+(yyline+1)+", column "+(yycolumn+1)); }
	}
  
<<EOF>> { return new Symbol(Sym.EOF); }