-- -------------------------------
-- Disparador --------------------
-- -------------------------------
CREATE OR REPLACE FUNCTION Sumar_linea()
RETURNS TRIGGER AS $Sumar_linea()$
BEGIN
resultado = SELECT SUM(importe_linea) FROM Compra_Medicamento cm HAVING cm.fecha_compra = NEW.fecha_compra;
UPDATE Compra
SET importe = resultado
WHERE fecha = NEW.fecha_compra;
END;
$Sumar_linea()$ LANGUAGE plpgsql;


CREATE TRIGGER importe_compra AFTER INSERT
ON Compra_Medicamento FOR EACH ROW
EXECUTE PROCEDURE Sumar_linea();