--CREATE DATABASE db_tienda_virtual;

use db_tienda_virtual;


DROP TABLE region;
CREATE TABLE region(
id_region INT IDENTITY(1,1) PRIMARY KEY,
nombre_region VARCHAR(255) NOT NULL
)


DROP TABLE provincia;
CREATE TABLE provincia(
id_provincia INT IDENTITY(1,1) PRIMARY KEY,
id_region INT NOT NULL,
nombre_provincia VARCHAR(255) NOT NULL,
FOREIGN KEY (id_region) REFERENCES region(id_region)
)


DROP TABLE comuna;
CREATE TABLE comuna(
id_comuna INT IDENTITY(1,1) PRIMARY KEY,
id_provincia INT NOT NULL,
nombre_comuna VARCHAR(255) NOT NULL,
FOREIGN KEY (id_provincia) REFERENCES provincia(id_provincia)
)


DROP TABLE sexo;

CREATE TABLE sexo(
id_sexo INT IDENTITY(0,1) PRIMARY KEY,
nombre_sexo VARCHAR(50) NOT NULL
)


DROP TABLE usuario


CREATE TABLE usuario(
 id INT IDENTITY(10001,1) PRIMARY KEY, 
 first_name VARCHAR(255) NOT NULL,
 second_name VARCHAR(255) NULL,
 father_lastname VARCHAR(255) NOT NULL,
 mother_lastname VARCHAR(255) NULL,
 pass VARCHAR(500) NOT NULL,
 username VARCHAR(255) NOT NULL UNIQUE,
 email VARCHAR(255) NOT NULL UNIQUE,
 user_role VARCHAR(255) DEFAULT('user') NOT NULL,
 birthday DATE NOT NULL,
 sex_id int NOT NULL,
 home_address VARCHAR(255) NOT NULL,
 comuna_id INT NOT NULL,
 register_date DATETIME NOT NULL,
 FOREIGN KEY (sex_id) REFERENCES sexo(id_sexo),
 FOREIGN KEY (comuna_id) REFERENCES comuna(id_comuna)
 )




DROP TABLE categoria;

 CREATE TABLE categoria(
 id_category INT IDENTITY(101,1) PRIMARY KEY,
 name_category VARCHAR(255) NOT NULL
)


DROP TABLE producto

CREATE TABLE producto
(
id_product INT IDENTITY(1000001,1) PRIMARY KEY,
id_category INT NOT NULL,
name_product VARCHAR(255) NOT NULL,
brand VARCHAR(255) NOT NULL,
size VARCHAR(15) NOT NULL,
stock INT NOT NULL,
price INT NOT NULL,
pdto_description VARCHAR(500) DEFAULT 'Producto' NOT NULL,
arribal_date DATETIME  NULL,
imagen VARCHAR(500) DEFAULT 'not_photo.jpg'  NOT NULL,
FOREIGN KEY (id_category) REFERENCES categoria(id_category)
)


DROP TABLE lista_productos;

CREATE TABLE lista_productos(
id_cesta INT IDENTITY(1000000001, 1) PRIMARY KEY,
producto_id INT,
token VARCHAR(500) DEFAULT 'user001' NOT NULL,
cantidad INT DEFAULT 0 NOT NULL
FOREIGN KEY (producto_id) REFERENCES producto(id_product)
)



CREATE TABLE carrito(
id_carrito
id_persona
Total 
)


CREATE TABLE pedidos (

)



