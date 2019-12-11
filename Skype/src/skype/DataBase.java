package skype;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;


public class DataBase {

    private static int chatId = 6;
    private static int mensagemId = 9;
    private static int chamadaId = 2;
    Scanner scan = new Scanner(System.in);

    private Connection connection = null;
    private Statement statement = null;
    private ResultSet resultset = null;

    public void connect() {

        String servidor = "jdbc:mysql://localhost:3306/Skype" +
                "?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";

        String user = "root";
        String password = "LeIrBaG123";
        String driver = "com.mysql.cj.jdbc.Driver";

        try {
            Class.forName(driver);
            this.connection = DriverManager.getConnection(servidor, user, password);
            this.statement = this.connection.createStatement();
            System.out.println("CONNECTED");
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }

    public boolean isConnected() {
        if (this.connection != null)
            return true;
        else
            return false;
    }


    public boolean verifyLogin(String nome, String password) {

        try {
            String query = "select distinct nome, senha\r\n" +
                    "from usuario;";

            this.resultset = this.statement.executeQuery(query);
            this.statement = this.connection.createStatement();
            while (this.resultset.next()) {

                if (this.resultset.getString("nome").equals(nome) && this.resultset.getString("senha").equals(password)) {
                    return true;
                } else {
                    return false;
                }
            }
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
            return false;
        }
        return false;
    }

    public String getIdByName(String in) {

        try {
            String query = "select usuario_id, nome\r\n" +
                    "from usuario\r\n" +
                    "where nome ='" + in + "';";
            this.resultset = this.statement.executeQuery(query);
            this.statement = this.connection.createStatement();
            while (this.resultset.next()) {
                if (this.resultset.getString("nome").equals(in)) {
                    return this.resultset.getString("usuario_id");
                }
            }
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }

        return "Id não encontrado :( ";
    }

    public void listaContatos(String id) {

        try {
            String query = "select distinct ldc.nome, u.* from usuario_simples dono\r\n" +
                    "join lista_de_contatos ldc on dono.usuario_id = dono\r\n" +
                    "join usuario_simples u on u.usuario_id = ldc.usuario_id\r\n" +
                    "where dono.usuario_id = '" + id + "'\r\n" +
                    "order by ldc.nome;";
            this.resultset = this.statement.executeQuery(query);
            this.statement = this.connection.createStatement();
            while (this.resultset.next())
                System.out.println("Nome da Lista de Contatos: " + this.resultset.getString("ldc.nome") +
                        "\nId: " + this.resultset.getString("u.usuario_id") +
                        "\nNome: " + this.resultset.getString("u.nome") +
                        "\nE-mail: " + this.resultset.getString("u.email") + '\n');
            System.out.println();
            System.out.println();
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }

    public void olhaCalendario(String id) {

        try {
            String query = "select u.nome, c.* from usuario u\r\n" +
                    "join calendario cal using(usuario_id)\r\n" +
                    "join compromisso_reuniao c using(compromisso_id)\r\n" +
                    "where u.usuario_id = '" + id + "';";
            this.resultset = this.statement.executeQuery(query);
            this.statement = this.connection.createStatement();
            while (this.resultset.next())
                System.out.println("Nome: " + this.resultset.getString("u.nome") +
                        "\nId Reunião: " + this.resultset.getString("c.reuniao_id") +
                        "\nId Compromisso: " + this.resultset.getString("c.compromisso_id") +
                        "\nInício: " + this.resultset.getString("c.data_de_inicio") +
                        "\nTérmino: " + this.resultset.getString("c.data_de_termino") +
                        "\nDescrição: " + this.resultset.getString("c.descricao") +
                        "\nNome do Compromisso: " + this.resultset.getString("c.nome") +
                        "\nLocal: " + this.resultset.getString("c.sala_de_reuniao") +
                        "\nId Outro Participante: " + this.resultset.getString("c.usuario_id") + '\n');
            System.out.println();
            System.out.println();
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }

    public void usarChat(String id) {

        String idSelecionado;
        int numeroParticipantes = 2;

        try {
            String query = "SELECT CHAT_ID, NUMERO_DE_PARTICIPANTES, NOME FROM CHAT JOIN USUARIO_SIMPLES USING(USUARIO_ID)\r\n" +
                    "WHERE CHAT_ID IN (SELECT DISTINCT CHAT_ID FROM CHAT\r\n" +
                    "WHERE USUARIO_ID = " + id + ");";

            this.resultset = this.statement.executeQuery(query);
            this.statement = this.connection.createStatement();

            while (this.resultset.next()) {
                System.out.println("Id: " + this.resultset.getString("chat_id") +
                        "\nNúmero Participantes: " + this.resultset.getString("numero_de_participantes") +
                        "\nNome: " + this.resultset.getString("nome"));
            }

            System.out.println("Selecione o Id do chat que deseja usar.");

            idSelecionado = scan.nextLine();

            String query2 = "select distinct numero_de_participantes from chat where chat_id = " + idSelecionado + ";";

            this.resultset = this.statement.executeQuery(query2);
            this.statement = this.connection.createStatement();

            this.resultset.next();
            numeroParticipantes = resultset.getInt("numero_de_participantes");


            chat(Integer.parseInt(idSelecionado), numeroParticipantes, id);

        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }

    public void criarChat(String id) {
        try {

            int numeroParticipantes = 2;
            int idSelecionado = 1;

            idSelecionado = selecionaUsuario(id);

            String query2 = "INSERT INTO CHAT (CHAT_ID, NUMERO_DE_PARTICIPANTES,USUARIO_ID, PRIVILEGIO_ADMIN)\r\n" +
                    "VALUES(" + chatId + "," + numeroParticipantes + ", " + id + ", TRUE);";

            this.statement.executeUpdate(query2);
            this.statement = this.connection.createStatement();

            String query3 = "INSERT INTO CHAT (CHAT_ID, NUMERO_DE_PARTICIPANTES,USUARIO_ID, PRIVILEGIO_ADMIN)\r\n" +
                    "VALUES(" + chatId + "," + numeroParticipantes + ", " + idSelecionado + ", FALSE);";

            this.statement.executeUpdate(query3);
            this.statement = this.connection.createStatement();

            System.out.println("Chat Criado !");

            chatId++;

            chat(chatId - 1, numeroParticipantes, id);

        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }

    private void chat(int idChat, int participantes, String idLogado) throws Exception {
        int x = 7;
        int userId;

        while (x!= 3) {
            System.out.println("Selecione o que voce desejar fazer com o chat:");
            System.out.println("1 - Adicionar usuario ao chat.");
            System.out.println("2 - Escrever Mensagem.");
            System.out.println("3 - Sair.");

            x = scan.nextInt();

            if(x==1){

                userId = selecionaUsuario(idLogado);

                String query = "INSERT INTO CHAT (CHAT_ID, NUMERO_DE_PARTICIPANTES,USUARIO_ID, PRIVILEGIO_ADMIN)\r\n" +
                        "VALUES("+ idChat +", "+ participantes +","+ userId +", FALSE);";

                this.statement.executeUpdate(query);
                this.statement = this.connection.createStatement();

                participantes++;

                String query2 = "UPDATE CHAT SET NUMERO_DE_PARTICIPANTES = 3 WHERE CHAT_ID = "+ idChat +";";
                this.statement.executeUpdate(query2);
                this.statement = this.connection.createStatement();

                System.out.println("Usuario adicionado com Sucesso!");

            }else if(x==2){

                System.out.println("Digite qual mensagem deseja inserir:");

                String mensagem = scan.nextLine();

                String query = "INSERT INTO MENSAGEM(MENSAGEM_ID, CONTEUDO, CHAT_ID, ARQUIVO_ID, USUARIO_ID, DATA_DE_ENVIO)\r\n" +
                        "VALUES("+mensagemId+",'"+ mensagem + "',"+ idChat +", null, "+ idLogado +", CURDATE());";

                this.statement.executeUpdate(query);
                this.statement = this.connection.createStatement();

                mensagemId++;

                System.out.println("Mensagem inserida com sucesso!");

            }else{
                System.out.println("Escolha uma opção válida ! (1,2 ou 3).");
            }
        }


    }

    private int selecionaUsuario(String id) throws Exception {
        String queryListUsers = "SELECT * FROM USUARIO_SIMPLES\r\n" +
                "WHERE USUARIO_ID <> " + id + ";";

        this.resultset = this.statement.executeQuery(queryListUsers);
        this.statement = this.connection.createStatement();

        System.out.println("Selecione o id do usuário com o qual gostaria de iniciar um chat.");

        while (this.resultset.next()) {
            System.out.println("Id: " + this.resultset.getString("usuario_id") +
                    "\nNome: " + this.resultset.getString("nome") + '\n');
        }

        return scan.nextInt();
    }

}
