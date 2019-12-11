package skype;

import java.util.Scanner;

public class Skype {


    private static DataBase db = new DataBase();

    public static void main(String[] args) {
        int x = 1;
        Scanner scan = new Scanner(System.in);
        String nome;
        String password;
        String id_logado;
        int option = 3;

        db.connect();

        while (option != 0) {

            System.out.println("Digite 1 Para Utilizar a Aplicação.");
            System.out.println("Digite 0 Para Sair.");
            option = scan.nextInt();
            scan.nextLine();

            switch (option) {
                case 1:
                    System.out.println("Digite Seu Nome de Usuário:");
                    nome = scan.nextLine();

                    System.out.println("Digite Sua Senha:");
                    password = scan.nextLine();

                    id_logado = db.getIdByName(nome);

                    if (verifyLogin(nome, password)) {
                        while (x != 7) {
                            System.out.println("1 - Criar Chat com Usuário.");
                            System.out.println("2 - Listar todos os seus contatos.");
                            System.out.println("3 - Olhar o seu calendário.");
                            System.out.println("4 - Criar Chat Privado.");
                            System.out.println("5 - Olhar Lista de Contatos.");
                            System.out.println("6 - Comprar Assinatura Premium.");
                            System.out.println("7 - Deslogar. ");
                            System.out.println("Digite o que voce quer fazer: ");
                            x = scan.nextInt();

                            if (db.isConnected()) {
                                if (x == 1) {
                                    System.out.println("Escolha o que você deseja fazer nesse chat:");
                                    int y;
                                    System.out.println("1 - Usar Chat Existente.");
                                    System.out.println("2 - Criar Novo Chat.");

                                    y = scan.nextInt();

                                    if(y==1){
                                        db.usarChat(id_logado);
                                    }else if (y==2){
                                        db.criarChat(id_logado);
                                    }
                                } else if (x == 2)
                                    db.listaContatos(id_logado);
                                else if (x == 3)
                                    db.olhaCalendario(id_logado);
                                else if (x == 4)
                                    System.out.println("1");
                                else if (x == 5)
                                    System.out.println("1");
                                else if (x == 6)
                                    System.out.println("1");
                                else if (x == 7)
                                    System.out.println("Deslogando...");
                            } else {
                                System.out.println("Não foi possível realizar a conexão com o Banco de Dados. ");

                            }
                        }
                    } else {
                        System.out.println("Você Não está Autenticado !");
                    }
                case 0:
                    System.out.println("Até logo :) ");
            }

        }
    }

    public static boolean verifyLogin(String nome, String password) {
        return db.verifyLogin(nome, password);
    }
}