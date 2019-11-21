CREATE TYPE Figura AS (
id integer,
nombre varchar(40),
color int,
Plano_Per REF(Plano));

CREATE TABLE Tabla_figura OF Figura(
 PRIMARY KEY (id),
UNIQUE (nombre),
Plano_Per NOT NULL
);




CREATE TYPE Plano AS (
id integer,
-- arquitecto varchar(40),
 num_figura integer,
dibujo BLOB,
Tiene_Fig REF(Figura)MULTISET,
Proyecto_Involu REF(Proyecto));


CREATE TABLE Tabla_plano OF Plano(
 PRIMARY KEY (id),
UNIQUE (nombre),
Tiene_Fig NOT NULL

);




CREATE TYPE Coordenadas AS (
EjeX integer,
EjeY integer);

CREATE TYPE Linea AS (
id integer,
Origen Coordenadas,
Final Coordenadas,
Longitud Number,
Pertenece_poligono REF(Poligono)
);

CREATE TABLE Tabla_Linea OF Linea(
 PRIMARY KEY (id),
Pertenece_poligono NOT NULL
);




CREATE TYPE Jefe_Proyecto AS (
codigo integer,
nombre varchar(40) ,
direccion direcc,
telefono int,
Dirige REF Proyecto

);

CREATE TYPE direcc AS (
calle varchar(40),
puerta varchar(40),
piso integer,
cod_potal integer);


CREATE TABLE Tabla_Jefe_Proyecto OF Jefe_Proyecto(
 PRIMARY KEY (codigo),
 UNIQUE (nombre)
);


CREATE TYPE Proyecto AS (
Nombre varchar(40),
codigo integer,
Fecha_fin date,
Dirigido_por REF Jefe_Proyecto
Plano_formado REF(PLano)MULTISET
);


CREATE TABLE Tabla_Proyecto OF Proyecto(
 UNIQUE (nombre)
 PRIMARE KEY (codigo)
 Dirigido_por NOT NULL
Plano_formado NOT NULL
);



CREATE TABLE Poligono(
num_lineas integer,
Formado_por NOT NULL REF(Linea)MULTISET 	
)INHERITS(Figura);

CREATE TABLE No_poligono(

)INHERITS(Figura);


























