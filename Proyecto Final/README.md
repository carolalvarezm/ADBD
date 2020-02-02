# Administración y Diseño de Bases de Datos
## Proyecto Final
### Alumnos: Carolina Álvarez Martín y Leonardo Dorta Bejarano
#### Modelo E/R
()
#### Modelo Relacional
#### Diagrama UML
#### Scripts
```SQL

-- -----------------------------------------------------
-- Table Producto
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Producto (
  ID INT NOT NULL,
  Lote INT NOT NULL,
  Variedad VARCHAR(45) NULL,
  Epoca VARCHAR(45) NULL,
  Fecha_Recogida DATE NOT NULL,
  Fecha_Caducidad DATE NOT NULL,
  Tipo VARCHAR(45) NOT NULL,
  Precio_KG FLOAT NOT NULL,
  Stock FLOAT NULL,
  PRIMARY KEY (ID, Lote))
 ;


-- -----------------------------------------------------
-- Table Productor_local
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Productor_local (
  NIF CHAR(9) NOT NULL,
  Teléfono INT NULL,
  Email VARCHAR(45) NULL,
  PRIMARY KEY (NIF))
 ;


-- -----------------------------------------------------
-- Table Pedido
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Pedido (
  ID INT NOT NULL,
  Total FLOAT,
  Cantidad FLOAT NULL,
  PRIMARY KEY (ID))
 ;


-- -----------------------------------------------------
-- Table Compra
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Compra (
  Fecha_compra DATE NOT NULL,
  ID_Ticket INT NOT NULL,
  Importe FLOAT,
  PRIMARY KEY (Fecha_compra,   ID_Ticket))
 ;


-- -----------------------------------------------------
-- Table Empleado
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Empleado (
  NSS CHAR(16) NOT NULL,
  DNI CHAR(9) NOT NULL,
  Salario FLOAT NULL,
  Turno VARCHAR(45) NULL,
  Fecha_inicio_contrato DATE NULL,
  Fecha_fin_contrato DATE NULL,
  Tipo VARCHAR(45) NOT NULL,
  PRIMARY KEY (NSS));


-- -----------------------------------------------------
-- Table Cliente_Credito
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Cliente_Credito (
  DNI CHAR(9) NOT NULL,
  Nombre VARCHAR(45) NULL,
  Apellido1 VARCHAR(45) NULL,
  Apellido2 VARCHAR(45) NULL,
  Calle VARCHAR(45) NULL,
  Provincia VARCHAR(45) NULL,
  Codigo_Postal INT NULL,
  PRIMARY KEY (DNI))
 ;


-- -----------------------------------------------------
-- Table Pago
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Pago (
  Fecha_Pago DATE NOT NULL,
  Fecha_Compra DATE NOT NULL,
  ID_Ticket INT NOT NULL,
  NSS_Empleado CHAR(16) NOT NULL,
  DNI_CCredito CHAR(9) NULL,
  Fecha_Límite DATE NULL,
  PRIMARY KEY (Fecha_Pago, Fecha_Compra, ID_Ticket),
  CONSTRAINT Pago_compra
    FOREIGN KEY (Fecha_Compra , ID_Ticket)
    REFERENCES Compra (Fecha_compra , ID_Ticket)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT Pago_Empleado
    FOREIGN KEY (NSS_Empleado)
    REFERENCES Empleado (NSS)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT Pago_cliente
    FOREIGN KEY (DNI_CCredito)
    REFERENCES Cliente_Credito (DNI)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
 ;


-- -----------------------------------------------------
-- Table Distribuidor
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Distribuidor (
  NIF CHAR(9) NOT NULL,
  Teléfono INT NULL,
  Email VARCHAR(45) NULL,
  PRIMARY KEY (NIF))
 ;


-- -----------------------------------------------------
-- Table compra_clientecredito
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS compra_clientecredito (
  ID_ticket INT NOT NULL,
  Fecha_compra DATE NOT NULL,
  DNI CHAR(9) NOT NULL,
  PRIMARY KEY (ID_ticket, Fecha_compra, DNI),
  CONSTRAINT Compra_cc
    FOREIGN KEY (ID_ticket , Fecha_compra)
    REFERENCES Compra (ID_Ticket , Fecha_compra)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT Cliente_cc
    FOREIGN KEY (DNI)
    REFERENCES Cliente_Credito (DNI)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
 ;


-- -----------------------------------------------------
-- Table Ganadero
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Ganadero (
  DNI CHAR(9) NOT NULL,
  Nombre VARCHAR(45) NULL,
  Apellido1 VARCHAR(45) NULL,
  Apellido2 VARCHAR(45) NULL,
  Calle VARCHAR(45) NULL,
  Provincia VARCHAR(45) NULL,
  Codigo_Postal INT NULL,
  PRIMARY KEY (DNI))
 ;


-- -----------------------------------------------------
-- Table compra_ganadero
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS compra_ganadero (
  ID_ticket INT NOT NULL,
  Fecha_compra DATE NOT NULL,
  DNI CHAR(9) NOT NULL,
  PRIMARY KEY (ID_ticket, Fecha_compra, DNI),
  CONSTRAINT Compra_cc
    FOREIGN KEY (ID_ticket , Fecha_compra)
    REFERENCES Compra (ID_Ticket , Fecha_compra)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT Cliente_cc
    FOREIGN KEY (DNI)
    REFERENCES Ganadero (DNI)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
 ;


-- -----------------------------------------------------
-- Table Cliente_Contado
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Cliente_Contado (
  DNI CHAR(9) NOT NULL,
  Nombre VARCHAR(45) NULL,
  Apellido1 VARCHAR(45) NULL,
  Apellido2 VARCHAR(45) NULL,
  Calle VARCHAR(45) NULL,
  Provincia VARCHAR(45) NULL,
  Codigo_Postal INT NULL,
  PRIMARY KEY (DNI))
 ;


-- -----------------------------------------------------
-- Table Producto_compra
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Producto_compra (
  ID_Producto INT NOT NULL,
  Lote INT NOT NULL,
  Fecha_Compra DATE NOT NULL,
  ID_ticket INT NOT NULL,
  Peso FLOAT NULL,
  PRIMARY KEY (ID_Producto, Lote, Fecha_Compra, ID_ticket),
  CONSTRAINT Producto_pc
    FOREIGN KEY (ID_Producto , Lote)
    REFERENCES Producto (ID , Lote)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT Compra_pc
    FOREIGN KEY (Fecha_Compra , ID_ticket)
    REFERENCES Compra (Fecha_compra , ID_Ticket)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
 ;


-- -----------------------------------------------------
-- Table Producto_Pedido
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Producto_Pedido (
  Lote INT NOT NULL,
  ID_Producto INT NOT NULL,
  ID_pedido INT NOT NULL,
  PRIMARY KEY (Lote, ID_Producto, ID_pedido),
  CONSTRAINT Producto_pp
    FOREIGN KEY (Lote , ID_Producto)
    REFERENCES Producto (Lote , ID)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT Pedido_pp
    FOREIGN KEY (ID_pedido)
    REFERENCES Pedido (ID)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
 ;


-- -----------------------------------------------------
-- Table Productorlocal_pedido
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Productorlocal_pedido (
  NIF CHAR(9) NOT NULL,
  ID_Pedido INT NOT NULL,
  PRIMARY KEY (NIF, ID_Pedido),
  CONSTRAINT Productorlocal_plp
    FOREIGN KEY (NIF)
    REFERENCES Productor_local (NIF)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT Pedido_plp
    FOREIGN KEY (ID_Pedido)
    REFERENCES Pedido (ID)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
 ;


-- -----------------------------------------------------
-- Table Distribuidor_pedido
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Distribuidor_pedido (
  NIF CHAR(9) NOT NULL,
  ID_Pedido INT NOT NULL,
  Etiqueta_origen VARCHAR(45) NOT NULL,
  PRIMARY KEY (NIF, ID_Pedido),
  CONSTRAINT Distribuidor_dp
    FOREIGN KEY (NIF)
    REFERENCES Distribuidor (NIF)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT Pedido_dp
    FOREIGN KEY (ID_Pedido)
    REFERENCES Pedido (ID)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
 ;


-- -----------------------------------------------------
-- Table compra_clientecontado
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS compra_clientecontado (
  ID_ticket INT NOT NULL,
  Fecha_compra DATE NOT NULL,
  DNI CHAR(9) NOT NULL,
  PRIMARY KEY (ID_ticket, Fecha_compra, DNI),
  CONSTRAINT Compra_cc
    FOREIGN KEY (ID_ticket , Fecha_compra)
    REFERENCES Compra (ID_Ticket , Fecha_compra)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT Cliente_cc
    FOREIGN KEY (DNI)
    REFERENCES Cliente_Contado (DNI)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
 ;

```
#### Carga de los datos y pruebas
