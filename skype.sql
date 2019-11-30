  
DROP TABLE IF EXISTS LISTA_DE_CONTATOS

CREATE TABLE LISTA_DE_CONTATOS (
	LISTA_DE_CONTATOS_ID NUMERIC,
	NOME VARCHAR(100) NOT NULL,
	DONO NUMERIC NOT NULL,
	USUARIO_ID NUMERIC,
	
	PRIMARY KEY (LISTA_DE_CONTATOS_ID, USUARIO_ID),
	FOREIGN KEY (DONO) REFERENCES USUARIO(USUARIO_ID),
	FOREIGN KEY (USUARIO_ID) REFERENCES USUARIO(USUARIO_ID)
);

CREATE TABLE USUARIO (
	USUARIO_ID NUMERIC PRIMARY KEY,
	NOME VARCHAR(200) NOT NULL,
	EMAIL VARCHAR(200) NOT NULL,
	TELEFONE NUMERIC,
	USUARIO_PREMIUM_ID NUMERIC,
	
	FOREIGN KEY USUARIO_PREMIUM_ID REFERENCES USUARIO_PREMIUM(USUARIO_PREMIUM_ID)
);

CREATE TABLE USUARIO_PREMIUM (
	USUARIO_PREMIUM_ID NUMERIC PRIMARY KEY,
	DATA_DE_TERMINO TIMESTAMP NOT NULL,
	ULTIMO_PAGAMENTO TIMESTAMP NOT NULL,
	METODO_DE_PAGAMENTO CHAR(20) NOT NULL,
	
	FOREIGN KEY (METODO_DE_PAGAMENTO) REFERENCES METODO_DE_PAGAMENTO(NOME)
);

CREATE TABLE METODO_DE_PAGAMENTO (
	NOME CHAR(20) PRIMARY KEY,
	DESCRICAO VARCHAR(255)
);

CREATE TABLE CALENDARIO (
	CALENDARIO_ID NUMERIC PRIMARY KEY,
	COMPROMISSO_ID NUMERIC
	
);

CREATE TABLE COMPROMISSO (
	COMPROMISSO_ID NUMERIC PRIMARY KEY,
	DATA_DE_INICIO TIMESTAMP NOT NULL,
	DATA_DE_TERMINO TIMESTAMP NOT NULL,
	DESCRICAO VARCHAR(255) NOT NULL,
	REUNIAO_ID NUMERIC,
	
	FOREIGN KEY (REUNIAO_ID) REFERENCES REUNIAO(REUNIAO_ID)
);

CREATE TABLE REUNIAO (
	REUNIAO_ID NUMERIC PRIMARY KEY,
	NOME VARCHAR(100) NOT NULL,
	SALA_DE_REUNIAO VARCHAR(100) NOT NULL
	
	FOREIGN KEY (SALA_DE_REUNIAO) REFERENCES SALA_DE_REUNIAO(NOME)
);

CREATE TABLE SALA_DE_REUNIAO (
	NOME VARCHAR(100) PRIMARY KEY
);

--inserir usuarios
insert into usuario (usuario_id, nome, email, telefone, usuario_premium_id)
values(1, 'Alan', 'alan.soledar@hotmail.com', 123456789, 1);
insert into usuario (usuario_id, nome, email, telefone, usuario_premium_id)
values(2, 'Gabriel', 'gabriel.martins@hotmail.com', 223456788, 2);
insert into usuario (usuario_id, nome, email, telefone)
values(3, 'Leonardo', 'leo.augusto@gmail.com', 323456788);
insert into usuario (usuario_id, nome, email, telefone)
values(4, 'Richard', 'richard.leal@gmal.com', 423456789);
insert into usuario (usuario_id, nome, email, telefone)
values(5, 'Giovani', 'Giovani.simon@hotmail.com', 523456789);

--inserir lista de contatos
insert into lista_de_contatos (lista_de_contatos_id, nome, DONO, USUARIO_ID)
values(2, 'DellBrabo', 2, 1);
insert into lista_de_contatos (lista_de_contatos_id, nome, DONO, USUARIO_ID)
values(2, 'DellBrabo', 2, 4);
insert into lista_de_contatos (lista_de_contatos_id, nome, DONO, USUARIO_ID)
values(2, 'DellBrabo', 2, 5);
insert into lista_de_contatos (lista_de_contatos_id, nome, DONO, USUARIO_ID)
values(1, 'Usguri', 1, 2);
insert into lista_de_contatos (lista_de_contatos_id, nome, DONO, USUARIO_ID)
values(1, 'Usguri', 1, 3);
insert into lista_de_contatos (lista_de_contatos_id, nome, DONO, USUARIO_ID)
values(1, 'Usguri', 1, 4);
insert into lista_de_contatos (lista_de_contatos_id, nome, DONO, USUARIO_ID)
values(1, 'Usguri', 1, 5);

--inserir metodo de pagamento
INSERT INTO METODO_DE_PAGAMENTO (NOME, DESCRICAO)
VALUES('Boleto', 'Pago em boleto o valor de x meses de premium')
INSERT INTO METODO_DE_PAGAMENTO (NOME, DESCRICAO)
VALUES('Assinatura', 'Debito em conta automatico mensal do usuario')

--inserir usuario_premium
INSERT INTO USUARIO_PREMIUM (USUARIO_PREMIUM_ID, DATA_DE_TERMINO, ULTIMO_PAGAMENTO, METODO_DE_PAGAMENTO)
values(1, DATE_ADD(CURDATE(), INTERVAL 7 MONTH), DATE_SUB(CURDATE(), INTERVAL 1 MONTH), 'Boleto');
INSERT INTO USUARIO_PREMIUM (USUARIO_PREMIUM_ID, DATA_DE_TERMINO, ULTIMO_PAGAMENTO, METODO_DE_PAGAMENTO)
values(2, DATE_ADD(CURDATE(), INTERVAL 1 MONTH), DATE_SUB(CURDATE(), INTERVAL 1 MONTH), 'Assinatura');

--achar todos os contatos de todas as listas de contatos de um usuario
SELECT LDC.NOME, U.* FROM USUARIO DONO 
JOIN LISTA_DE_CONTATOS LDC ON DONO.USUARIO_ID = DONO
JOIN USUARIO U ON U.USUARIO_ID = LDC.USUARIO_ID
WHERE DONO.NOME = 'Alan';