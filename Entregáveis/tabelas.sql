ALTER TABLE COMPROMISSO DROP FOREIGN KEY FK_REUNIAO;
DROP VIEW IF EXISTS COMPROMISSO_REUNIAO;
DROP TABLE IF EXISTS REUNIAO;
DROP TABLE IF EXISTS LISTA_DE_CONTATOS;
DROP TABLE IF EXISTS CALENDARIO;
DROP TABLE IF EXISTS CHAMADA;
DROP TABLE IF EXISTS CHAT_PRIVADO;
DROP TABLE IF EXISTS CHAT;
DROP TABLE IF EXISTS NOTIFICACAO;
DROP TABLE IF EXISTS USUARIO;
DROP TABLE IF EXISTS USUARIO_PREMIUM;
DROP TABLE IF EXISTS METODO_DE_PAGAMENTO;
DROP TABLE IF EXISTS ARQUIVO;
DROP TABLE IF EXISTS COMPROMISSO;
DROP TABLE IF EXISTS SALA_DE_REUNIAO;
DROP TABLE IF EXISTS TIPO_DE_ARQUIVO;
DROP TABLE IF EXISTS MENSAGEM;


CREATE TABLE METODO_DE_PAGAMENTO (
	NOME CHAR(20) PRIMARY KEY,
	DESCRICAO VARCHAR(255)
);

CREATE TABLE SALA_DE_REUNIAO (
	NOME VARCHAR(100) PRIMARY KEY
);

CREATE TABLE TIPO_DE_ARQUIVO (
	NOME VARCHAR(20) PRIMARY KEY
);

CREATE TABLE COMPROMISSO (
	COMPROMISSO_ID NUMERIC PRIMARY KEY,
	DATA_DE_INICIO TIMESTAMP NOT NULL,
	DATA_DE_TERMINO TIMESTAMP NOT NULL,
	DESCRICAO VARCHAR(255) NOT NULL
);

CREATE TABLE USUARIO_PREMIUM (
	USUARIO_PREMIUM_ID NUMERIC PRIMARY KEY,
	DATA_DE_TERMINO TIMESTAMP NOT NULL,
	ULTIMO_PAGAMENTO TIMESTAMP NOT NULL,
	METODO_DE_PAGAMENTO CHAR(20) NOT NULL,
	
	FOREIGN KEY (METODO_DE_PAGAMENTO) REFERENCES METODO_DE_PAGAMENTO(NOME)
);

CREATE TABLE USUARIO (
	USUARIO_ID NUMERIC PRIMARY KEY,
	NOME VARCHAR(200) NOT NULL,
	SENHA VARCHAR(20) NOT NULL,
	EMAIL VARCHAR(200) NOT NULL,
	TELEFONE NUMERIC,
	USUARIO_PREMIUM_ID NUMERIC,
	
	FOREIGN KEY (USUARIO_PREMIUM_ID) REFERENCES USUARIO_PREMIUM(USUARIO_PREMIUM_ID)
);

CREATE TABLE LISTA_DE_CONTATOS (
	LISTA_DE_CONTATOS_ID NUMERIC,
	NOME VARCHAR(100) NOT NULL,
	DONO NUMERIC NOT NULL,
	USUARIO_ID NUMERIC,
	
	PRIMARY KEY (LISTA_DE_CONTATOS_ID, USUARIO_ID),
	FOREIGN KEY (DONO) REFERENCES USUARIO(USUARIO_ID),
	FOREIGN KEY (USUARIO_ID) REFERENCES USUARIO(USUARIO_ID)
);

CREATE TABLE CALENDARIO (
	USUARIO_ID NUMERIC,
	COMPROMISSO_ID NUMERIC,
	
	PRIMARY KEY (USUARIO_ID, COMPROMISSO_ID),
	FOREIGN KEY (USUARIO_ID) REFERENCES USUARIO(USUARIO_ID),
	FOREIGN KEY (COMPROMISSO_ID) REFERENCES COMPROMISSO(COMPROMISSO_ID)
);

CREATE TABLE REUNIAO (
	REUNIAO_ID NUMERIC,
	NOME VARCHAR(100) NOT NULL,
	SALA_DE_REUNIAO VARCHAR(100) NOT NULL,
	USUARIO_ID NUMERIC NOT NULL,
	
	PRIMARY KEY(REUNIAO_ID, USUARIO_ID),
	FOREIGN KEY (USUARIO_ID) REFERENCES USUARIO(USUARIO_ID),
	FOREIGN KEY (SALA_DE_REUNIAO) REFERENCES SALA_DE_REUNIAO(NOME)
);

CREATE TABLE CHAT (
	CHAT_ID NUMERIC,
	NUMERO_DE_PARTICIPANTES NUMERIC NOT NULL,
	USUARIO_ID NUMERIC NOT NULL,
	PRIVILEGIO_ADMIN BOOLEAN NOT NULL,
	
	PRIMARY KEY(CHAT_ID, USUARIO_ID),
	FOREIGN KEY(USUARIO_ID) REFERENCES USUARIO(USUARIO_ID)
);

CREATE TABLE CHAT_PRIVADO (
	CHAT_ID NUMERIC PRIMARY KEY,
	SENHA VARCHAR(16) NOT NULL,
	DURACAO NUMERIC,
	
	FOREIGN KEY(CHAT_ID) REFERENCES CHAT(CHAT_ID)
);
CREATE TABLE CHAMADA (
	CHAMADA_ID NUMERIC,
	TEMPO_DE_INICIO TIMESTAMP NOT NULL,
	TEMPO_DE_TERMINO TIMESTAMP NOT NULL,
	HOUVE_VIDEO BOOLEAN NOT NULL,
	HOUVE_COMPARTILHAMENTO_DE_TELA BOOLEAN NOT NULL,
	USUARIO_ID NUMERIC NOT NULL,
	CHAT_ID NUMERIC,
	
	PRIMARY KEY(CHAMADA_ID, USUARIO_ID),
	FOREIGN KEY(USUARIO_ID) REFERENCES USUARIO(USUARIO_ID),
	FOREIGN KEY(CHAT_ID) REFERENCES CHAT(CHAT_ID)
	
);

CREATE TABLE ARQUIVO (
	ARQUIVO_ID NUMERIC PRIMARY KEY,
	NOME VARCHAR(100) NOT NULL,
	TAMANHO VARCHAR(10) NOT NULL,
	DESCRICAO VARCHAR(255),
	TIPO_DE_ARQUIVO VARCHAR(20) NOT NULL,
	
	FOREIGN KEY(TIPO_DE_ARQUIVO) REFERENCES TIPO_DE_ARQUIVO(NOME)
);

CREATE TABLE NOTIFICACAO (
	NOTIFICACAO_ID NUMERIC PRIMARY KEY,
	DATA_DA_NOTIFICACAO TIMESTAMP NOT NULL,
	USUARIO_ALVO NUMERIC NOT NULL,
	USUARIO_ORIGEM NUMERIC NOT NULL,
	
	FOREIGN KEY(USUARIO_ALVO) REFERENCES USUARIO(USUARIO_ID),
	FOREIGN KEY(USUARIO_ORIGEM) REFERENCES USUARIO(USUARIO_ID)
);

CREATE TABLE MENSAGEM (
	MENSAGEM_ID NUMERIC PRIMARY KEY,
	CONTEUDO VARCHAR(255) NOT NULL,
	CHAT_ID NUMERIC NOT NULL,
	ARQUIVO_ID NUMERIC,
	USUARIO_ID NUMERIC NOT NULL,
	DATA_DE_ENVIO TIMESTAMP NOT NULL,
	
	FOREIGN KEY(ARQUIVO_ID) REFERENCES ARQUIVO(ARQUIVO_ID),
	FOREIGN KEY(CHAT_ID) REFERENCES CHAT(CHAT_ID)
);

ALTER TABLE COMPROMISSO
ADD COLUMN REUNIAO_ID NUMERIC AFTER DESCRICAO,
ADD CONSTRAINT FK_REUNIAO FOREIGN KEY (REUNIAO_ID) REFERENCES REUNIAO(REUNIAO_ID);

CREATE VIEW COMPROMISSO_REUNIAO AS 
SELECT * FROM COMPROMISSO 
LEFT JOIN REUNIAO USING(REUNIAO_ID);

CREATE VIEW USUARIO_SIMPLES AS 
SELECT USUARIO_ID, NOME, EMAIL FROM USUARIO;

