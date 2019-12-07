package skype;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;


public class DataBase {

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

//    public void getSongs() {
//        try {
//            String query = "select nomeMidia from Midia;";
//            this.resultset = this.statement.executeQuery(query);
//            this.statement = this.connection.createStatement();
//            while (this.resultset.next())
//                System.out.println("nome da midia: " + this.resultset.getString("nomeMidia"));
//            System.out.println("\n\n");
//            ;
//        } catch (Exception e) {
//            System.out.println("Erro: " + e.getMessage());
//        }
//    }
//
//    public void playlistInfo() {
//        try {
//            String query = "select nomePlaylist,count(*) as numeroDeMusicas, sum(duracaoMinutosMidia)from playlist natural join playListMusica natural join midia group by nomePlaylist;";
//            this.resultset = this.statement.executeQuery(query);
//            this.statement = this.connection.createStatement();
//            while (this.resultset.next())
//                System.out.println("Nome da playlist: " + this.resultset.getString("nomePlaylist") +
//                        "\nNumero de musicas: " + this.resultset.getString("numeroDeMusicas") +
//                        "\nDuracao da playlist: " + this.resultset.getString("sum(duracaoMinutosMidia)") + "minutos" + '\n');
//            System.out.println();
//            System.out.println();
//            ;
//        } catch (Exception e) {
//            System.out.println("Erro: " + e.getMessage());
//        }
//    }
//
//    public void topSongs() {
//        try {
//            String query = "select nomeArtista, nomeMidia, count(codUsuario) as NumeroDeVezesTocada\r\n" +
//                    "from Musica Natural join Midia natural join UsuarioMidia natural join artista\r\n" +
//                    "where ehMusica = true\r\n" +
//                    "group by nomeMidia\r\n" +
//                    "order by (count(codUsuario)) DESC;";
//            this.resultset = this.statement.executeQuery(query);
//            this.statement = this.connection.createStatement();
//            while (this.resultset.next())
//                System.out.println("Nome da Artista: " + this.resultset.getString("nomeArtista") +
//                        "\nNome da Midia: " + this.resultset.getString("nomeMidia") +
//                        "\nNumero de reproducoes: " + this.resultset.getString("numeroDeVezesTocada") + '\n');
//            System.out.println();
//            System.out.println();
//            ;
//        } catch (Exception e) {
//            System.out.println("Erro: " + e.getMessage());
//        }
//    }
//
//    public void nextShows() {
//        try {
//            String query = "select distinct NomeApresentacao, cidadeLugar, dataApresentacao\r\n" +
//                    "from artista natural join apresentacao natural join lugar\r\n" +
//                    "where lugar.paisLugar = 'Brasil';";
//            this.resultset = this.statement.executeQuery(query);
//            this.statement = this.connection.createStatement();
//            while (this.resultset.next())
//                System.out.println("Nome da Apresentacao: " + this.resultset.getString("nomeApresentacao") +
//                        "\nCidade: " + this.resultset.getString("cidadeLugar") +
//                        "\nData: " + this.resultset.getString("dataApresentacao") + '\n');
//            System.out.println();
//            System.out.println();
//            ;
//        } catch (Exception e) {
//            System.out.println("Erro: " + e.getMessage());
//        }
//    }
//
//    public void notLinkin() {
//        try {
//            String query = "	select distinct nomeArtista\r\n" +
//                    "	from Artista a1\r\n" +
//                    "	Where NOT EXISTS (select * \r\n" +
//                    "		From Artista natural join ArtistaApresentacao\r\n" +
//                    "		Where codArtista = a1.codArtista and\r\n" +
//                    "	 	codApresentacao IN (select distinct codApresentacao\r\n" +
//                    "		From apresentacao natural join ArtistaApresentacao natural join Artista\r\n" +
//                    "		Where nomeArtista = 'Linkin Park'));\r\n" +
//                    "	;";
//            this.resultset = this.statement.executeQuery(query);
//            this.statement = this.connection.createStatement();
//            while (this.resultset.next())
//                System.out.println("Nome do Artista: " + this.resultset.getString("nomeArtista") +
//                        '\n');
//            System.out.println();
//            System.out.println();
//            ;
//        } catch (Exception e) {
//            System.out.println("Erro: " + e.getMessage());
//        }
//    }
//
//    public void albumsInfo() {
//        try {
//            String query = "select nomeArtista,tituloAlbum, nomeMidia, ordemFaixa\r\n" +
//                    "from musica natural join midia natural join Album natural join albumMusica natural join Artista\r\n" +
//                    "order by tituloAlbum,ordemFaixa;";
//            this.resultset = this.statement.executeQuery(query);
//            this.statement = this.connection.createStatement();
//            while (this.resultset.next())
//                System.out.println("Nome do Artista: " + this.resultset.getString("nomeArtista") +
//                        "\nTitulo do album: " + this.resultset.getString("tituloAlbum") +
//                        "\nnnomeMusica: " + this.resultset.getString("nomeMidia") +
//                        "\nOrdem faixa:: " + this.resultset.getString("ordemFaixa") + '\n');
//            System.out.println();
//            System.out.println();
//            ;
//        } catch (Exception e) {
//            System.out.println("Erro: " + e.getMessage());
//        }
//    }
//
//    public void codUsersdontPodcast() {
//        try {
//            String query = "select distinct codUsuario, nomeu\r\n" +
//                    "from usuario\r\n" +
//                    "where codUsuario not in ( select codUsuario\r\n" +
//                    "							from UsuarioMidia natural join Podcast natural join Midia\r\n" +
//                    "							where ehMusica = false);";
//            this.resultset = this.statement.executeQuery(query);
//            this.statement = this.connection.createStatement();
//            while (this.resultset.next())
//                System.out.println("Codigo do usuario: " + this.resultset.getString("codUsuario") +
//                        "\nNome usuario: " + this.resultset.getString("nomeu") + '\n');
//            System.out.println();
//            System.out.println();
//        } catch (Exception e) {
//            System.out.println("Erro: " + e.getMessage());
//        }
//    }

    public boolean verifyLogin(String nome, String password) {

        try {
			String query = "select distinct nome, senha\r\n" +
					"from usuario;";

			this.resultset = this.statement.executeQuery(query);
			this.statement = this.connection.createStatement();
			while (this.resultset.next()){

				if(this.resultset.getString("nome").equals(nome) && this.resultset.getString("senha").equals(password)){
					return true;
				}else {
					return false;
				}
			}
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
            return false;
        }
        return false;
    }

	public String checkIdByName(String nome) {

        try{
            String query = "select usuario_id\r\n" +
                    "from usuario\r\n" +
                    "where nome = " + nome + ";";
            this.resultset = this.statement.executeQuery(query);
            this.statement = this.connection.createStatement();
            while(this.resultset.next()){
                if(this.resultset.getString("usuario_id").equals(nome)){
                    return this.resultset.getString("usuario_id");
                }
            }
        }catch (Exception e){
            System.out.println("Erro: " + e.getMessage());
        }

        return "Id não encontrado :( ";
    }
}
