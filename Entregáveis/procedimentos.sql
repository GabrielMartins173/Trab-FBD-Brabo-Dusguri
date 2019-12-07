CREATE TRIGGER ATUALIZA_CALENDARIO AFTER INSERT
ON COMPROMISSO
FOR EACH ROW
	INSERT INTO CALENDARIO (USUARIO_ID, COMPROMISSO_ID)
	SELECT DISTINCT R.USUARIO_ID, C.COMPROMISSO_ID FROM REUNIAO R JOIN COMPROMISSO C USING(REUNIAO_ID) WHERE COMPROMISSO_ID = NEW.COMPROMISSO_ID;

