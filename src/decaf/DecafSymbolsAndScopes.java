package decaf;
import org.antlr.symtab.FunctionSymbol;
import org.antlr.symtab.GlobalScope;
import org.antlr.symtab.LocalScope;
import org.antlr.symtab.Scope;
import org.antlr.symtab.VariableSymbol;
import org.antlr.symtab.Symbol;
import org.antlr.v4.runtime.misc.NotNull;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.tree.ParseTreeProperty;
import java.util.ArrayList;

/**
 * This class defines basic symbols and scopes for Decaf language
 */
public class DecafSymbolsAndScopes extends DecafParserBaseListener {
    ParseTreeProperty<Scope> scopes = new ParseTreeProperty<Scope>();
    GlobalScope globals;
    Scope currentScope; // define symbols in this scope

    ArrayList <String> listVariaveis = new ArrayList();
    String ia = "vadjo";

    @Override
    public void enterProgram(DecafParser.ProgramContext ctx) {
        globals = new GlobalScope(null);
        pushScope(globals);
    }

    @Override
    public void exitProgram(DecafParser.ProgramContext ctx) {
        System.out.println(globals);
    }
    
    @Override 
    public void exitStatement(DecafParser.StatementContext ctx) {
        if(listVariaveis.contains(ia)== false){
            error(ctx.location().ID().getSymbol(), "variavel nao declarada");
        }
     }

    @Override
    public void enterVar_declarada(DecafParser.Var_declaradaContext ctx) { 

        for( int i = 0; i<ctx.ID().size(); i++ ){
            ia = ctx.ID(i).getSymbol().getText();
            if(listVariaveis.contains(ia)== true){
               error(ctx.ID(i).getSymbol(), "Variaveis Repetidas");
            } else {
                listVariaveis.add(ia);
		defineVar(ctx.tipo(),ctx.ID(i).getSymbol());
            }
            
        }
    }
	
    @Override 
    public void exitVar_declarada(DecafParser.Var_declaradaContext ctx) { 
         
    }
    @Override public void enterTipo_metodo(DecafParser.Tipo_metodoContext ctx) {
defineVar(ctx.tipo(),ctx.ID().getSymbol());
 }
	
   @Override
	public void enterMetodo(DecafParser.MetodoContext ctx) { 
        String name = ctx.ID().getText();
        //int typeTokenType = ctx.type().start.getType();
        //DecafSymbol.Type type = this.getType(typeTokenType);

        // push new scope by making new one that points to enclosing scope
        FunctionSymbol function = new FunctionSymbol(name);
        // function.setType(type); // Set symbol type

        currentScope.define(function); // Define function in current scope
        saveScope(ctx, function);
        pushScope(function);
    }

    @Override
    public void exitMetodo(DecafParser.MetodoContext ctx) {
        popScope();
    }

    @Override
    public void enterBloco(DecafParser.BlocoContext ctx) {
        LocalScope l = new LocalScope(currentScope);
        saveScope(ctx, currentScope);
         pushScope(l);
    }

    @Override
    public void exitBloco(DecafParser.BlocoContext ctx) {
        popScope();
    }

    @Override
    public void enterDeclaracao(DecafParser.DeclaracaoContext ctx) {
       // defineVar(ctx.type(), ctx.ID().getSymbol());
    }

    @Override
    public void exitDeclaracao(DecafParser.DeclaracaoContext ctx) {
        /*String name = ctx.ID().getSymbol().getText();
        Symbol var = currentScope.resolve(name);
        if ( var==null ) {
            this.error(ctx.ID().getSymbol(), "no such variable: "+name);
        }
        if ( var instanceof FunctionSymbol ) {
            this.error(ctx.ID().getSymbol(), name+" is not a variable");
        }*/
    }

    void defineVar(DecafParser.TipoContext typeCtx, Token nameToken) {
        //int typeTokenType = typeCtx.start.getType();
        VariableSymbol var = new VariableSymbol(nameToken.getText());

        // DecafSymbol.Type type = this.getType(typeTokenType);
        // var.setType(type);

        currentScope.define(var); // Define symbol in current scope
    }

    /**
     * Método que atuliza o escopo para o atual e imprime o valor
     *
     * @param s
     */
    private void pushScope(Scope s) {
        currentScope = s;
        System.out.println("entering: "+currentScope.getName()+":"+s);
    }

    /**
     * Método que cria um novo escopo no contexto fornecido
     *
     * @param ctx
     * @param s
     */
    void saveScope(ParserRuleContext ctx, Scope s) {
        scopes.put(ctx, s);
    }

    /**
     * Muda para o contexto superior e atualia o escopo
     */
    private void popScope() {
        System.out.println("leaving: "+currentScope.getName()+":"+currentScope);
        currentScope = currentScope.getEnclosingScope();
    }

    public static void error(Token t, String msg) {
        System.err.printf("line %d:%d %s\n", t.getLine(), t.getCharPositionInLine(),
                msg);
    }

    /**
     * Valida tipos encontrados na linguagem para tipos reais
     *
     * @param tokenType
     * @return
     */
   /* public static DecafSymbol.Type getType(int tokenType) {
        switch ( tokenType ) {
            case DecafParser.VOID :  return DecafSymbol.Type.tVOID;
            case DecafParser.NUMBER :   return DecafSymbol.Type.tINT;
        }
        return DecafSymbol.Type.tINVALID;
    }*/


}
