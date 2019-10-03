# Histórico de las pruebas con postgresql

usuario@ubuntu:/home$ sudo su postgres
postgres@ubuntu:/home$ psql
postgres=# CREATE DATABASE pract1;
CREATE DATABASE
postgres=# \l
                                  List of databases
   Name    |  Owner   | Encoding |   Collate   |    Ctype    |   Access privileges   
-----------+----------+----------+-------------+-------------+-----------------------
 postgres  | postgres | UTF8     | es_ES.UTF-8 | es_ES.UTF-8 | 
 pract1    | postgres | UTF8     | es_ES.UTF-8 | es_ES.UTF-8 | 
 template0 | postgres | UTF8     | es_ES.UTF-8 | es_ES.UTF-8 | =c/postgres          +
           |          |          |             |             | postgres=CTc/postgres
 template1 | postgres | UTF8     | es_ES.UTF-8 | es_ES.UTF-8 | =c/postgres          +
           |          |          |             |             | postgres=CTc/postgres
(4 rows)

postgres=# \c pract1 postgres
You are now connected to database "pract1" as user "postgres".
pract1=# create table usuarios(
pract1(# nombre varchar(30),
pract1(# clave varchar(10)
pract1(# );
CREATE TABLE
pract1=# \dt
          List of relations
 Schema |   Name   | Type  |  Owner   
--------+----------+-------+----------
 public | usuarios | table | postgres
(1 row)

pract1=# insert into usuarios (nombre,clave) values ('Isa','asdf');
INSERT 0 1
pract1=# insert into usuarios (nombre,clave) values ('Pablo','sjdsj');
INSERT 0 1
pract1=# insert into usuarios (nombre,clave) values ('Ana','dhsjsaj');
INSERT 0 1

pract1=# \s historico.md
could not save history to file "historico.md": Permiso denegado
pract1-# \q

