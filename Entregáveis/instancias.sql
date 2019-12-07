#INSERTS

#inserir metodo de pagamento
INSERT INTO METODO_DE_PAGAMENTO (NOME, DESCRICAO)
VALUES('Boleto', 'Pago em boleto o valor de x meses de premium');
INSERT INTO METODO_DE_PAGAMENTO (NOME, DESCRICAO)
VALUES('Cartão de crédito', 'Pago via cartão de crédito o valor de x meses de premium');
INSERT INTO METODO_DE_PAGAMENTO (NOME, DESCRICAO)
VALUES('Assinatura', 'Debito em conta automatico mensal do usuario');

#insert sala de reuniao
INSERT INTO SALA_DE_REUNIAO (NOME) 
VALUES('Sala 103');
INSERT INTO SALA_DE_REUNIAO (NOME) 
VALUES('Sala 104');
INSERT INTO SALA_DE_REUNIAO (NOME) 
VALUES('Sala 112');
INSERT INTO SALA_DE_REUNIAO (NOME) 
VALUES('Sala 115');

#inserir usuario_premium
INSERT INTO USUARIO_PREMIUM (USUARIO_PREMIUM_ID, DATA_DE_TERMINO, ULTIMO_PAGAMENTO, METODO_DE_PAGAMENTO)
values(1, DATE_ADD(CURDATE(), INTERVAL 7 MONTH), DATE_SUB(CURDATE(), INTERVAL 1 MONTH), 'Boleto');
INSERT INTO USUARIO_PREMIUM (USUARIO_PREMIUM_ID, DATA_DE_TERMINO, ULTIMO_PAGAMENTO, METODO_DE_PAGAMENTO)
values(2, DATE_ADD(CURDATE(), INTERVAL 2 MONTH), DATE_SUB(CURDATE(), INTERVAL 1 MONTH), 'Cartão de crédito');
INSERT INTO USUARIO_PREMIUM (USUARIO_PREMIUM_ID, DATA_DE_TERMINO, ULTIMO_PAGAMENTO, METODO_DE_PAGAMENTO)
values(3, DATE_ADD(CURDATE(), INTERVAL 1 MONTH), DATE_SUB(CURDATE(), INTERVAL 1 MONTH), 'Assinatura');

#inserir usuarios
insert into usuario (usuario_id, nome, senha, email, telefone, usuario_premium_id)
values(1, 'Alan', 'password', 'alan.soledar@hotmail.com', 123456789, 1);
insert into usuario (usuario_id, nome, senha, email, telefone, usuario_premium_id)
values(2, 'Gabriel', 'senha', 'gabriel.martins@hotmail.com', 223456788, 2);
insert into usuario (usuario_id, nome, senha, email, telefone)
values(3, 'Leonardo', 'admin', 'leo.augusto@gmail.com', 323456788);
insert into usuario (usuario_id, nome, senha, email, telefone)
values(4, 'Richard', '1234', 'richard.leal@gmal.com', 423456789);
insert into usuario (usuario_id, nome, senha, email, telefone)
values(5, 'Giovani', 'data de aniversario', 'Giovani.simon@hotmail.com', 523456789);
insert into usuario (usuario_id, nome, senha, email, telefone)
values(6, 'Lucão', '4321', 'Lucão@gmail.com', 623456789);

#inserir lista de contatos
insert into lista_de_contatos (lista_de_contatos_id, nome, DONO, USUARIO_ID)
values(2, 'Dell Brabo', 2, 1);
insert into lista_de_contatos (lista_de_contatos_id, nome, DONO, USUARIO_ID)
values(2, 'Dell Brabo', 2, 4);
insert into lista_de_contatos (lista_de_contatos_id, nome, DONO, USUARIO_ID)
values(2, 'Dell Brabo', 2, 5);
insert into lista_de_contatos (lista_de_contatos_id, nome, DONO, USUARIO_ID)
values(1, 'Us guri', 1, 2);
insert into lista_de_contatos (lista_de_contatos_id, nome, DONO, USUARIO_ID)
values(1, 'Us guri', 1, 3);
insert into lista_de_contatos (lista_de_contatos_id, nome, DONO, USUARIO_ID)
values(1, 'Us guri', 1, 4);
insert into lista_de_contatos (lista_de_contatos_id, nome, DONO, USUARIO_ID)
values(1, 'Usguri', 1, 5);
insert into lista_de_contatos (lista_de_contatos_id, nome, DONO, USUARIO_ID)
values(3, 'A volta dos que não foram', 2, 2);
insert into lista_de_contatos (lista_de_contatos_id, nome, DONO, USUARIO_ID)
values(3, 'A volta dos que não foram', 1, 3);
insert into lista_de_contatos (lista_de_contatos_id, nome, DONO, USUARIO_ID)
values(4, 'Os ruim', 3, 1);
insert into lista_de_contatos (lista_de_contatos_id, nome, DONO, USUARIO_ID)
values(4, 'Os ruim', 3, 3);
insert into lista_de_contatos (lista_de_contatos_id, nome, DONO, USUARIO_ID)
values(4, 'Os ruim', 3, 5);

#insert reuniao
INSERT INTO REUNIAO(REUNIAO_ID, NOME, SALA_DE_REUNIAO, USUARIO_ID)
VALUES(1, 'FBD 1', 'Sala 103', 1);
INSERT INTO REUNIAO(REUNIAO_ID, NOME, SALA_DE_REUNIAO, USUARIO_ID)
VALUES(1, 'FBD 1', 'Sala 103', 2);
INSERT INTO REUNIAO(REUNIAO_ID, NOME, SALA_DE_REUNIAO, USUARIO_ID)
VALUES(2, 'FBD 2', 'Sala 115', 1);
INSERT INTO REUNIAO(REUNIAO_ID, NOME, SALA_DE_REUNIAO, USUARIO_ID)
VALUES(2, 'FBD 2', 'Sala 115', 2);
INSERT INTO REUNIAO(REUNIAO_ID, NOME, SALA_DE_REUNIAO, USUARIO_ID)
VALUES(2, 'FBD 2', 'Sala 115', 3);
INSERT INTO REUNIAO(REUNIAO_ID, NOME, SALA_DE_REUNIAO, USUARIO_ID)
VALUES(2, 'FBD 3', 'Sala 115', 4);
INSERT INTO REUNIAO(REUNIAO_ID, NOME, SALA_DE_REUNIAO, USUARIO_ID)
VALUES(3, 'FBD 3', 'Sala 104', 4);
INSERT INTO REUNIAO(REUNIAO_ID, NOME, SALA_DE_REUNIAO, USUARIO_ID)
VALUES(3, 'FBD 3', 'Sala 104', 3);

#insert compromisso
INSERT INTO COMPROMISSO (COMPROMISSO_ID, DATA_DE_INICIO, DATA_DE_TERMINO, DESCRICAO, REUNIAO_ID)
values(1, DATE_ADD(CURDATE(), INTERVAL 1 WEEK), DATE_ADD(CURDATE(), INTERVAL 2 WEEK), 'Licenca medica', NULL);
INSERT INTO COMPROMISSO (COMPROMISSO_ID, DATA_DE_INICIO, DATA_DE_TERMINO, DESCRICAO, REUNIAO_ID)
values(2, DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 1 WEEK),INTERVAL 14 HOUR), DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 1 WEEK),INTERVAL 16 HOUR), 'Para tratar de negocios', 1);
INSERT INTO COMPROMISSO (COMPROMISSO_ID, DATA_DE_INICIO, DATA_DE_TERMINO, DESCRICAO, REUNIAO_ID)
values(3, DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 2 WEEK),INTERVAL 16 HOUR), DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 2 WEEK),INTERVAL 18 HOUR), 'Dentista', NULL);
INSERT INTO COMPROMISSO (COMPROMISSO_ID, DATA_DE_INICIO, DATA_DE_TERMINO, DESCRICAO, REUNIAO_ID)
values(4, DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 3 WEEK),INTERVAL 12 HOUR), DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 4 WEEK),INTERVAL 12 HOUR), 'Viagem', NULL);
INSERT INTO COMPROMISSO (COMPROMISSO_ID, DATA_DE_INICIO, DATA_DE_TERMINO, DESCRICAO, REUNIAO_ID)
values(5, DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 2 WEEK),INTERVAL 14 HOUR), DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 2 WEEK),INTERVAL 16 HOUR), '1o1', 3);
