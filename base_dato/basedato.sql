CREATE DATABASE db_tienda_virtual;

use db_tienda_virtual;

DROP TABLE usuario

CREATE TABLE usuario(
 id INT IDENTITY(10001,1) PRIMARY KEY, 
 first_name VARCHAR(255) NOT NULL,
 second_name VARCHAR(255) NULL,
 father_lastname VARCHAR(255) NOT NULL,
 mother_lastname VARCHAR(255) NULL,
 pass VARCHAR(500) NOT NULL,
 username VARCHAR(255) NOT NULL,
 email VARCHAR(255) NOT NULL,
 user_role VARCHAR(255) DEFAULT('user') NOT NULL
 )


 birthday DATETIME NOT NULL,
 sex VARCHAR(10) NOT NULL,
 region VARCHAR(255) NOT NULL,
 provincia VARCHAR(255) NOT NULL,
 comuna VARCHAR(255) NOT NULL,
 home_address VARCHAR(255) NOT NULL,

 register_date DATETIME NOT NULL,
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


SELECT * FROM categoria

SELECT * FROM producto

INSERT INTO producto(id_category, name_product,brand, size,stock, price, arribal_date) VALUES 
				    (101, 'Poleron Rojo','VANS','M', 10, 15000, GETDATE());
INSERT INTO producto(id_category, name_product,brand, size,stock, price, arribal_date) VALUES 
				    (101, 'Poleron Azul','VANS','L', 10, 15000, GETDATE());
INSERT INTO producto(id_category, name_product,brand, size,stock, price, arribal_date) VALUES 
				    (101, 'Poleron Amarillo','VANS','XL', 10, 15000, GETDATE());




/******Procedimientos almacenados******/
DROP PROCEDURE sp_insert_user

CREATE PROCEDURE sp_insert_user
@first_name VARCHAR(255), 
@second_name VARCHAR(255), 
@father_lastname VARCHAR(255), 
@mother_lastname VARCHAR(255),
@pass VARCHAR(255),
@user VARCHAR(255),
@email VARCHAR(255)
AS
INSERT INTO usuario(first_name,second_name,father_lastname,mother_lastname,pass,username,email) 
		     VALUES(@first_name, @second_name, @father_lastname, @mother_lastname, CONVERT(VARCHAR(255),HASHBYTES('MD5', @pass), 2) ,@user, @email)
GO

truncate table usuario
select * from usuario

UPDATE usuario SET user_role = 'admin' WHERE id = 10002


DROP PROCEDURE sp_validate_user

CREATE PROCEDURE sp_validate_user
@username VARCHAR(255),
@pass VARCHAR(255)

AS
	SELECT first_name as nombre, second_name as nombre_dos, father_lastname as apellido_pat, mother_lastname as apellido_mat, username, email, user_role as rol, '*********' as pass FROM usuario WHERE  username = @username   AND pass = CONVERT(varchar(255),HASHBYTES('MD5',@pass),2)  ; 
	
GO

sp_validate_user  d_maker , 12345

select * from usuario


DROP PROCEDURE sp_insert_category

CREATE PROCEDURE sp_insert_category
@category VARCHAR(255)
AS
	INSERT INTO categoria(name_category) VALUES(@category);
GO

DROP PROCEDURE sp_list_category

CREATE PROCEDURE sp_list_category
AS
	select * from categoria
GO

sp_list_category


truncate table categoria
/*crear sp_ productos aleatorios*/




DROP PROCEDURE sp_list_products_by_category

CREATE PROCEDURE sp_list_products_aleatory
AS
/*hacer inner join con la categoria para poder llenar el objeto en la instacia del objeton negoccio Producto*/
	SELECT * FROM producto
GO


DROP PROCEDURE sp_list_products_by_category
CREATE PROCEDURE sp_list_products_by_category
@category INT
AS
/*hacer inner join con la categoria para poder llenar el objeto en la instacia del objeton negoccio Producto*/
	SELECT * FROM producto WHERE id_category = @category
GO

DROP PROCEDURE sp_get_product
CREATE PROCEDURE sp_get_product
@id_product INT
AS
	SELECT * FROM producto WHERE id_product = @id_product
GO



DROP PROCEDURE sp_insert_product

CREATE PROCEDURE sp_insert_product
@category_id INT,
@name VARCHAR(255),
@brand VARCHAR(255),
@size VARCHAR(15),
@stock INT,
@price INT,
@imagen VARCHAR(500)
AS
INSERT INTO producto(id_category, name_product,brand, size,stock, price, arribal_date, imagen) VALUES 
				    (@category_id, @name, @brand, @size, @stock, @price , GETDATE(), @imagen);
GO



select * from categoria

UPDATE categoria SET name_category = 'Chaquetas' WHERE id_category = 104


select * from categoria

select * from producto

sp_get_product 1000005