CREATE TYPE Compra as (
	importe float[],
	fecha date,
	hora time
	compra_del_cliente REF(compra_cliente)MULTISET,
	compra_pago_credito REF(Pago_Credito)MULTISET,
	venta_compra REF(Vendido_MC)MULTISET
	
);

CREATE TABLE Table_Compra of Compra(
	PRIMARY KEY (fecha,hora),
	venta_compra NOT NULL
);


CREATE TYPE Medicamento as (
	precio int,
	tiopo_igic float,
	posologia varchar[20],
	nombre varchar[20],
	codigo int,
	familia_pertenece REF(Familia)
	venta_medicamento REF(Vendido_MC)
);



CREATE TABLE Table_Medicamento of Medicamento(
	PRIMARY KEY (codigo),
	familia_pertenece NOT NULL
);


CREATE TYPE Vendido_MC as (
	Unidades int,
	igic float,
	importe float,
	fecha_compra date,
	codigo_medicamento int,
	compra_vendidoMC REF(compra),
	Vendido_mc_medicamento REF(Medicamento) 
);

CREATE TABLE Table_Vendido_MC of Vendido_MC(
	compra_vendidoMC NOT NULL,
	PRIMARY KEY(fecha_compra,codigo_medicamento),
	FOREIGN KEY(fecha_compra)
	   REFERENCES Table_Compra (fecha)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,

    FOREIGN KEY(codigo_medicamento)
	  REFERENCES Table_Medicamento (codigo)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);




CREATE TYPE Familia as (
	nombre varchar[20],
	incompatibilidad varchar[20],
	enfermedad_prescribe REF(Enfermedad) MULTISET 
	familia_medicamento REF(Medicamento) MULTISET 
);

CREATE TABLE Tabla_Familia of Familia(
	PRIMARY KEY (nombre),
	enfermedad_prescribe NOT NULL,
	familia_medicamento NOT NULL
);


CREATE TYPE Enfermedad as (
	nombre varchar(30),
	 familia_prescribe REF(Familia) MULTISET
);

CREATE TABLE Tabla_Enfermedad of Enfermedad(
	PRIMARY KEY (nombre)
);



CREATE TYPE Cliente_credito as (
	codigo int,
	nombre varchar[20],
	dia_pagos int
	compra_cliente REF(Compra),
	pago_credito_cliente REF(Pago_Credito)


);

CREATE TABLE Table_Cliente_credito of Cliente_credito(
	PRIMARY KEY(codigo),
	compra_cliente,
	pago_credito_cliente NOT NULL
);


CREATE TYPE Laboratorio as (
	lab_comprado REF(Comprado)MULTISET,
	codigo int,
	nombre varchar[20],
	telefono int,
	contacto varchar[20],
	direccion direccion

);

CREATE TABLE Table_Laboratorio of Laboratorio(
	PRIMARY KEY(codigo),
);

CREATE TYPE Pago_Credito as (
	fecha date,
	cantidad_abonada float,
	mes int,
	anio int,
	fecha_compra date,
	hora time,
	compra REF(compra)
);

CREATE TABLE Table_pago_credito of Pago_Credito(
	PRIMARY KEY(mes,anio,fecha_compra,hora),
	compra NOT NULL,
	FOREIGN KEY(fecha_compra,hora)
	   REFERENCES Compra (fecha,hora)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);


CREATE TABLE Comprado(
	comprado_laboratorio REF(Laboratorio)
)INHERITS(Medicamentos);


CREATE TABLE Propio(

)INHERITS(Medicamentos);


CREATE TABLE Libre(

)INHERITS(Medicamentos);

CREATE TABLE Receta(

)INHERITS(Medicamentos);

CREATE TYPE direccion AS (
  calle     text,
  numero    INTEGER,
  provincia text,
  cp        text
);


