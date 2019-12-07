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

                    id_logado = db.checkIdByName(nome);


                    if (verifyLogin(nome, password)) {
                        while (x != 0) {
                            System.out.println("1 - Criar Chat com Usuário.");
                            System.out.println("2 - Criar um Compromisso.");
                            System.out.println("3 - Criar uma Reunião.");
                            System.out.println("4 - Criar Chat Privado.");
                            System.out.println("5 - Olhar Lista de Contatos.");
                            System.out.println("6 - Comprar Assinatura Premium.");
                            System.out.println("0 para sair ");
                            System.out.println("Digite o que voce quer fazer: ");
                            x = scan.nextInt();

                            if (db.isConnected()) {
                                if (x == 1) {
                                    System.out.println("Escolha o que você deseja fazer nesse chat:");

                                    System.out.println("1");
                                } else if (x == 2)
                                    System.out.println("1");
                                else if (x == 3)
                                    System.out.println("1");
                                else if (x == 4)
                                    System.out.println("1");
                                else if (x == 5)
                                    System.out.println("1");
                                else if (x == 6)
                                    System.out.println("1");
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