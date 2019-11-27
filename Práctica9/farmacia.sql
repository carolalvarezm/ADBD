CREATE TYPE Compra as (


);


CREATE TYPE Medicamento as (

);

CREATE TYPE Familia as (
	nombre varchar[20],
	incompatibilidad varchar[20],
	enfermedad_prescribe REF(Enfermedad) MULTISET 
	
);

CREATE TABLE Tabla_Familia of Familia(
	PRIMARY KEY (nombre),
	enfermedad_prescribe NOT NULL
);


CREATE TYPE Enfermedad as (
	nombre varchar(30),
	 familia_prescribe REF(Familia) MULTISET
);

CREATE TABLE Tabla_Enfermedad of Enfermedad(
	PRIMARY KEY (nombre)
);



CREATE TYPE Cliente_credito as (

);


CREATE TYPE Laboratorio as (

);

CREATE TYPE Pago_Credito as (

);


CREATE TYPE Comprado as (

);


CREATE TYPE Propio as (

);


CREATE TYPE Libre as (

);


CREATE TYPE Receta as (

);


CREATE TYPE Vendido_MC as (

);