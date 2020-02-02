CREATE OR REPLACE FUNCTION DescontarCincuentaPorCiento()
RETURNS TRIGGER AS $DescontarCincuentaPorCiento()$
BEGIN
UPDATE Producto SET Precio/KG = Precio/KG /2 WHERE Fecha_Recogida <= now() - interval 5 day;
END;
$DescontarCincuentaPorCiento()$ LANGUAGE plpgsql;



CREATE TRIGGER mucho_tiempo_almacen AFTER UPDATE
ON Producto FOR EACH ROW
EXECUTE PROCEDURE DescontarCincuentaPorCiento();

