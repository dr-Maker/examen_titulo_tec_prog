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
 --telefono
 user_role VARCHAR(255) DEFAULT('user') NOT NULL,
 birthday DATETIME NOT NULL,
 sex_id int NOT NULL,
 home_address VARCHAR(255) NOT NULL,
 comuna_id INT NOT NULL,
 register_date DATETIME NOT NULL,
 FOREIGN KEY (sex_id) REFERENCES sexo(id_sexo),
 FOREIGN KEY (comuna_id) REFERENCES comuna(id_comuna)
 )


 CREATE TABLE categoria(
 id_category INT IDENTITY(101,1) PRIMARY KEY,
 name_category VARCHAR(255) NOT NULL
)

CREATE TABLE marca(
id_marca INT IDENTITY(1,1) PRIMARY KEY,
brand VARCHAR(255) NOT NULL
)

CREATE TABLE tipo_talla(
id INT IDENTITY(1,1) PRIMARY KEY,
tipo VARCHAR(255) NOT NULL,
)

DROP TABLE sizesProduct
CREATE TABLE sizesProduct(
id_size INT IDENTITY(1,1) PRIMARY KEY,
id_tipo INT NOT NULL,
size VARCHAR(255) NOT NULL,
FOREIGN KEY (id_tipo) REFERENCES tipo_talla(id)
)


DROP TABLE producto
CREATE TABLE producto
(
id_product INT IDENTITY(1000001,1) PRIMARY KEY,
id_category INT NOT NULL,
name_product VARCHAR(255) NOT NULL,
id_brand INT NOT NULL,
pdto_description VARCHAR(500) DEFAULT 'Producto' NOT NULL,
arribal_date DATETIME  NULL,
imagen VARCHAR(500) DEFAULT 'not_photo.jpg'  NOT NULL,
FOREIGN KEY (id_category) REFERENCES categoria(id_category),
FOREIGN KEY (id_brand) REFERENCES marca(id_marca),
)

DROP TABLE stocks_and_price
----------------------------------------------------------------------------


CREATE TABLE stocks_and_price(
id_pdto_stock  INT IDENTITY(1,1) PRIMARY KEY,
id_producto INT NOT NULL,
price INT NOT NULL,
cantidad INT DEFAULT 0 NOT NULL,
id_size INT NOT NULL,
FOREIGN KEY (id_producto) REFERENCES producto(id_product),
FOREIGN KEY (id_size) REFERENCES sizesProduct(id_size)
)


DROP TABLE lista_productos;
CREATE TABLE lista_productos(
id_cesta INT IDENTITY(1000000001, 1) PRIMARY KEY,
id_pdto_stock INT,
cantidad_lleva INT,
precio_lleva INT,
token VARCHAR(500) DEFAULT 'user001' NOT NULL,
Sub_total INT DEFAULT 0 NOT NULL,
Total INT DEFAULT 0 NOT NULL,
id_usuario INT,
FOREIGN KEY (id_pdto_stock) REFERENCES stocks_and_price(id_pdto_stock)
)


--------------------------------------------- PEDIDO -------------------------------------------
DROP TABLE orden_usuario;
CREATE TABLE orden_usuario(
id INT IDENTITY(1, 1) PRIMARY KEY,
--id usuario
Nombre VARCHAR(255) NOT NULL,
Apellido VARCHAR(255) NOT NULL,
username VARCHAR(255) NOT NULL,
fechaNacimiento DATETIME NOT NULL,
email VARCHAR(255) NOT NULL,
genero VARCHAR(255),
id_region INT,
id_comuna INT NOT NULL,
direccion VARCHAR(250) NOT NULL
)

DROP TABLE orden_medio_pago;
CREATE TABLE orden_medio_pago(
id_tipo_medio_pago INT IDENTITY(1, 1) PRIMARY KEY,
medio_pago VARCHAR(255)
)

DROP TABLE orden_id_estado_pago;
CREATE TABLE orden_id_estado_pago(
id_estado_pago INT IDENTITY(1, 1) PRIMARY KEY,
estado_pago VARCHAR(255)
)

DROP TABLE orden_estado_pedido;
CREATE TABLE orden_estado_pedido(
id_envio INT IDENTITY(1, 1) PRIMARY KEY,
estado_pedido VARCHAR(255)
)

DROP TABLE orden_carrito;
CREATE TABLE orden_carrito(
id_cesta INT IDENTITY(1, 1) PRIMARY KEY,
id_persona INT NOT NULL,
fecha_pedido DATETIME NOT NULL,
fecha_entrega DATETIME ,
id_tipo_medio_pago INT DEFAULT 1 NOT NULL,
id_estado_pago INT DEFAULT 1 NOT NULL,
id_envio INT DEFAULT 1 NOT NULL,
token VARCHAR(255) NOT NULL,
--direccion envio
-- id comuna
Total INT NOT NULL,
FOREIGN KEY (id_persona) REFERENCES orden_usuario(id),
FOREIGN KEY (id_tipo_medio_pago) REFERENCES orden_medio_pago(id_tipo_medio_pago),
FOREIGN KEY (id_estado_pago) REFERENCES orden_id_estado_pago(id_estado_pago),
FOREIGN KEY (id_envio) REFERENCES orden_estado_pedido(id_envio)
)

DROP TABLE orden_carrito_compra;
CREATE TABLE orden_carrito_compra(
id INT IDENTITY(1, 1) PRIMARY KEY,
id_carrito INT NOT NULL,
id_producto INT NOT NULL,
id_stock INT NOT NULL,
nombre_producto VARCHAR(255) NOT NULL,
descripcion VARCHAR(500) NOT NULL,
categoria VARCHAR(255) NOT NULL,
marca VARCHAR(500) NOT NULL,
talla VARCHAR(500) NOT NULL,
cantidad INT NOT NULL,
precio INT NOT NULL,
subTotal INT NOT NULL,
FOREIGN KEY (id_carrito) REFERENCES orden_carrito(id_cesta)
)







