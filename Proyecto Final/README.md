# Administración y Diseño de Bases de Datos
## Proyecto Final
### Alumnos: Carolina Álvarez Martín y Leonardo Dorta Bejarano
#### Requisitos
En el siguiente documento se encuentran los requisitos del sistema:
[Enlace al documento Requisitos del sistema](https://github.com/alu0100944723/ADBD/blob/master/Proyecto%20Final/Requisitos%20del%20sistema.pdf)
#### Modelo E/R
En el siguiente documento se encuentran las definiciones del diagrama E/R:
[Enlace al documento ERE](https://github.com/alu0100944723/ADBD/blob/master/Proyecto%20Final/ERE.pdf)
#### Modelo Relacional
En el siguiente documento se encuentran las definiciones del Modelo Relacional:
[Enlace al documento ](https://github.com/alu0100944723/ADBD/blob/master/Proyecto%20Final/GrafoRelacional.pdf)
#### Diagrama UML
[Enlace al documento ASIClases](http://github.com)
#### Scripts
[Enlace al Script](https://github.com/alu0100944723/ADBD/blob/master/Proyecto%20Final/Scrip_Cargadedatos.sql)
[Enlace al documento ScriptCreation](http://github.com) 
##### Código para la creación de las tablas:
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
##### Código para la inserción en las tablas:
```SQL

-- -----------------------------------------------------
-- Data for table Producto
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO Producto (ID, Lote, Variedad, Epoca, Fecha_Recogida, Fecha_Caducidad, Tipo, Precio_KG, Stock) VALUES (001, 1230, NULL, 'Verano', '20/06/2020', '30/06/2020', 'Fruta', 1.2, 12.5);
INSERT INTO Producto (ID, Lote, Variedad, Epoca, Fecha_Recogida, Fecha_Caducidad, Tipo, Precio_KG, Stock) VALUES (002, 4512, NULL, 'Verano', '23/06/2020', '03/07/2020', 'Verdura', 1.5, 8.2);
INSERT INTO Producto (ID, Lote, Variedad, Epoca, Fecha_Recogida, Fecha_Caducidad, Tipo, Precio_KG, Stock) VALUES (003, 4147, NULL, 'Verano', '14/06/2020', '24/06/2020', 'Fruta', 2.2, 25.7);
INSERT INTO Producto (ID, Lote, Variedad, Epoca, Fecha_Recogida, Fecha_Caducidad, Tipo, Precio_KG, Stock) VALUES (004, 7854, NULL, 'Verano', '18/06/2020', '28/06/2020', 'Verdura', 3.3, 6.5);
INSERT INTO Producto (ID, Lote, Variedad, Epoca, Fecha_Recogida, Fecha_Caducidad, Tipo, Precio_KG, Stock) VALUES (005, 1210, NULL, 'Verano', '16/06/2020', '27/06/2020', 'Fruta', 2.1, 7.12);
INSERT INTO Producto (ID, Lote, Variedad, Epoca, Fecha_Recogida, Fecha_Caducidad, Tipo, Precio_KG, Stock) VALUES (002, 6666, NULL, 'Verano', '30/06/2020', '12/07/2020', 'Verdura', 1.4, 8.9);

COMMIT;


-- -----------------------------------------------------
-- Data for table Productor_local
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO Productor_local (NIF, Teléfono, Email) VALUES ('78454511L', 789123654, 'dkljdas@ddd.com');

COMMIT;


-- -----------------------------------------------------
-- Data for table Pedido
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO Pedido (ID, Total, Cantidad) VALUES (001, NULL, 20);
INSERT INTO Pedido (ID, Total, Cantidad) VALUES (002, NULL, 8);
INSERT INTO Pedido (ID, Total, Cantidad) VALUES (003, NULL, 6);
INSERT INTO Pedido (ID, Total, Cantidad) VALUES (004, NULL, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table Compra
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO Compra (Fecha_compra, ID_Ticket, Importe) VALUES ('25/12/2018', 001, NULL);
INSERT INTO Compra (Fecha_compra, ID_Ticket, Importe) VALUES ('24/03/2019', 002, NULL);
INSERT INTO Compra (Fecha_compra, ID_Ticket, Importe) VALUES ('28/12/2019', 002, NULL);
INSERT INTO Compra (Fecha_compra, ID_Ticket, Importe) VALUES ('28/06/2020', 003, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table Empleado
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO Empleado (NSS, DNI, Salario, Turno, Fecha_inicio_contrato, Fecha_fin_contrato, Tipo) VALUES ('789456123578945', '46588811M',NULL , 'Tarde', '12/02/2018', '22/02/2020', 'Parcial');
INSERT INTO Empleado (NSS, DNI, Salario, Turno, Fecha_inicio_contrato, Fecha_fin_contrato, Tipo) VALUES ('789456123654784', '49855533O', NULL, 'Mañana', '25/06/2019', NULL, 'Fijo');

COMMIT;


-- -----------------------------------------------------
-- Data for table Cliente_Credito
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO Cliente_Credito (DNI, Nombre, Apellido1, Apellido2, Calle, Provincia, Codigo_Postal) VALUES ('47899955S', 'akd', 'fdfd', 'ddfd', 'fdfs', 'fdd', 98562);
INSERT INTO Cliente_Credito (DNI, Nombre, Apellido1, Apellido2, Calle, Provincia, Codigo_Postal) VALUES ('46255588L', 'dfks', 'fgr', 'dfdf', 'dfdd', 'ffd', 78542);

COMMIT;


-- -----------------------------------------------------
-- Data for table Pago
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO Pago (Fecha_Pago, Fecha_Compra, ID_Ticket, NSS_Empleado, DNI_CCredito, Fecha_Límite) VALUES ('25/12/2018', '25/12/2018', 001, '789456123578945', NULL, NULL);
INSERT INTO Pago (Fecha_Pago, Fecha_Compra, ID_Ticket, NSS_Empleado, DNI_CCredito, Fecha_Límite) VALUES ('29/03/2019', '24/03/2019', 002, '789456123578945', '47899955S', '09/04/2019');
INSERT INTO Pago (Fecha_Pago, Fecha_Compra, ID_Ticket, NSS_Empleado, DNI_CCredito, Fecha_Límite) VALUES ('28/12/2019', '28/12/2019', 002, '789456123654784', NULL, NULL);
INSERT INTO Pago (Fecha_Pago, Fecha_Compra, ID_Ticket, NSS_Empleado, DNI_CCredito, Fecha_Límite) VALUES ('28/06/2020', '28/06/2020', 003, '789456123654784', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table Distribuidor
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO Distribuidor (NIF, Teléfono, Email) VALUES ('78544412P', 987456321, 'efdokd@dkkd.com');
INSERT INTO Distribuidor (NIF, Teléfono, Email) VALUES ('54966688L', 985145821, 'dkjxhs@ksks.com');

COMMIT;


-- -----------------------------------------------------
-- Data for table compra_clientecredito
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO compra_clientecredito (ID_ticket, Fecha_compra, DNI) VALUES (002, '24/03/2019', '47899955S');

COMMIT;


-- -----------------------------------------------------
-- Data for table Ganadero
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO Ganadero (DNI, Nombre, Apellido1, Apellido2, Calle, Provincia, Codigo_Postal) VALUES ('46577788L', 'Ana', 'Sastre', 'Raste', 'jskl', 'soakl', 38521);
INSERT INTO Ganadero (DNI, Nombre, Apellido1, Apellido2, Calle, Provincia, Codigo_Postal) VALUES ('45899932M', 'Lucas', 'Morado', 'Liso', 'ssd', 'sl', 39521);

COMMIT;


-- -----------------------------------------------------
-- Data for table compra_ganadero
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO compra_ganadero (ID_ticket, Fecha_compra, DNI) VALUES (003, '28/06/2020', '46577788L');

COMMIT;


-- -----------------------------------------------------
-- Data for table Cliente_Contado
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO Cliente_Contado (DNI, Nombre, Apellido1, Apellido2, Calle, Provincia, Codigo_Postal) VALUES ('47522277K', 'Mario', 'sds', 'dds', 'dgfd', 'gfss', 36874);
INSERT INTO Cliente_Contado (DNI, Nombre, Apellido1, Apellido2, Calle, Provincia, Codigo_Postal) VALUES ('47566215L', 'Silvia', 'sd', 'dds', 'dfgfg', 'ffd', 38527);

COMMIT;


-- -----------------------------------------------------
-- Data for table Producto_compra
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO Producto_compra (ID_Producto, Lote, Fecha_Compra, ID_ticket, Peso) VALUES (001, 1230, '25/12/2018', 001, 2.5);
INSERT INTO Producto_compra (ID_Producto, Lote, Fecha_Compra, ID_ticket, Peso) VALUES (002, 4512, '25/12/2018', 001, 2.6);
INSERT INTO Producto_compra (ID_Producto, Lote, Fecha_Compra, ID_ticket, Peso) VALUES (003, 4147, '24/03/2019', 002, 1);
INSERT INTO Producto_compra (ID_Producto, Lote, Fecha_Compra, ID_ticket, Peso) VALUES (004, 7854, '24/03/2019', 002, 1.5);
INSERT INTO Producto_compra (ID_Producto, Lote, Fecha_Compra, ID_ticket, Peso) VALUES (005, 1210, '24/03/2019', 002, 2.2);
INSERT INTO Producto_compra (ID_Producto, Lote, Fecha_Compra, ID_ticket, Peso) VALUES (002, 6666, '28/12/2019', 002, 0.5);
INSERT INTO Producto_compra (ID_Producto, Lote, Fecha_Compra, ID_ticket, Peso) VALUES (001, 1230, '28/12/2019', 002, 3);
INSERT INTO Producto_compra (ID_Producto, Lote, Fecha_Compra, ID_ticket, Peso) VALUES (003, 4147, '28/12/2019', 002, 2.2);
INSERT INTO Producto_compra (ID_Producto, Lote, Fecha_Compra, ID_ticket, Peso) VALUES (004, 7854, '28/06/2020', 003, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table Producto_Pedido
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO Producto_Pedido (Lote, ID_Producto, ID_pedido) VALUES (1230, 001, 001);
INSERT INTO Producto_Pedido (Lote, ID_Producto, ID_pedido) VALUES (4512, 002, 001);
INSERT INTO Producto_Pedido (Lote, ID_Producto, ID_pedido) VALUES (4147, 003, 002);
INSERT INTO Producto_Pedido (Lote, ID_Producto, ID_pedido) VALUES (7854, 004, 003);
INSERT INTO Producto_Pedido (Lote, ID_Producto, ID_pedido) VALUES (1210, 005, 004);
INSERT INTO Producto_Pedido (Lote, ID_Producto, ID_pedido) VALUES (6666, 002, 002);

COMMIT;


-- -----------------------------------------------------
-- Data for table Productorlocal_pedido
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO Productorlocal_pedido (NIF, ID_Pedido) VALUES ('78454511L', 003);
INSERT INTO Productorlocal_pedido (NIF, ID_Pedido) VALUES ('78454511L', 004);

COMMIT;


-- -----------------------------------------------------
-- Data for table Distribuidor_pedido
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO Distribuidor_pedido (NIF, ID_Pedido, Etiqueta_origen) VALUES ('78544412P', 001, '1234565678');
INSERT INTO Distribuidor_pedido (NIF, ID_Pedido, Etiqueta_origen) VALUES ('54966688L', 002, '4785456647');

COMMIT;


-- -----------------------------------------------------
-- Data for table compra_clientecontado
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO compra_clientecontado (ID_ticket, Fecha_compra, DNI) VALUES (001, '25/12/2018', '47566215L');
INSERT INTO compra_clientecontado (ID_ticket, Fecha_compra, DNI) VALUES (002, '28/12/2019', '47566215L');

COMMIT;
```
#### Carga de los datos y pruebas
Dentro del siguiente documento se encuentran las pruebas de todos los scripts:
[Enlace al documento CSI8](http://github.com)
