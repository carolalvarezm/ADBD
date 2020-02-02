

CREATE TRIGGER VenderComoAbono AFTER UPDATE ON Producto FOR EACH ROW 
INSERT INTO compra_ganadero(ID_ticket,Fecha_compra) VALUES(NEW.ID,NEW.Lote) WHERE Fecha_Caducidad <= now() - interval 5 day;