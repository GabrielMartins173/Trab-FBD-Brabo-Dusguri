CREATE TABLE MENSAGEM (
	MENSAGEM_ID NUMERIC PRIMARY KEY,
    CONTEUDO VARCHAR(255) NOT NULL,
    USUARIO_ID NUMERIC NOT NULL,
    ARQUIVO_ID NUMERIC,

    FOREIGN KEY (USUARIO_ID) REFERENCES USUARIO(USUARIO_ID),
    FOREIGN KEY (ARQUIVO_ID) REFERENCES ARQUIVO(ARQUIVO_ID)
);

CREATE TABLE ARQUIVO (
    ARQUIVO_ID NUMERIC PRIMARY KEY,
    TAMANHO VARCHAR(50) NOT NULL, 
    DESCRICAO VARCHAR(255) NOT NULL,
    NOME_DO_ARQUIVO VARCHAR(100),

    FOREIGN KEY (NOME_DO_ARQUIVO) REFERENCES TIPO_DE_ARQUIVO(NOME_DO_ARQUIVO)
);

CREATE TABLE TIPO_DE_ARQUIVO (
	NOME_DO_ARQUIVO VARCHAR(100) PRIMARY KEY,
);

CREATE TABLE CHAT (
    CHAT_ID NUMERIC PRIMARY KEY,
    NUMERO_DE_MEMBROS NUMERIC NOT NULL,
    CHAT_PRIVADO_ID NUMERIC,
    USUARIO_ID NUMERIC NOT NULL,
    LIGACAO_ID NUMERIC

    FOREIGN KEY (CHAT_PRIVADO_ID) REFERENCES CHAT_PRIVADO(CHAT_PRIVADO_ID),
    FOREIGN KEY (USUARIO_ID) REFERENCES USUARIO(USUARIO_ID),
    FOREIGN KEY (LIGACAO_ID) REFERENCES LIGACAO(LIGACAO_ID) 
);

CREATE TABLE LIGACAO (
	LIGACAO_ID NUMERIC PRIMARY KEY,
    INICIO TIMESTAMP NOT NULL, 
    FIM TIMESTAMP NOT NULL,
);

CREATE TABLE CHAT_PRIVADO (
	CHAT_PRIVADO_ID NUMERIC PRIMARY KEY
);

CREATE TABLE NOTIFICACAO (
	
);