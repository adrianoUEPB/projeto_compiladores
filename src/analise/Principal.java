package analise;

import java.io.FileReader;
import java.nio.file.Paths;

public class Principal {

    public static void main(String[] args) {

        String rootPath = Paths.get("").toAbsolutePath().toString();
        String subPath = "/test_code/";
        String sourceCode = rootPath + subPath + "teste.txt";
        try {
            Parser p = new Parser(new Lexer(new FileReader(sourceCode)));
            p.parse();           

            System.out.println("Compilacao concluida com sucesso...");
        } catch (Exception e) {
        	System.out.println("Erro" + e.getMessage());
            e.printStackTrace();
        }

    }
}