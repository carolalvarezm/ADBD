CREATE OR REPLACE FUNCTION sumar_bonificacion() RETURNS TRIGGER AS $suma_bonificacion$
DECLARE BEGIN
	UPDATE Cliente
	SET Bonificación = Bonificación + 1
	RETURN NULL;
END
$suma_bonificacion$ LANGUAGE plpgsql;


CREATE TRIGGER insertar_compra AFTER INSERT 
ON Producto_Cliente FOR EACH ROW
EXECUTE PROCEDURE sumar_bonificacion();

