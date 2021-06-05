use db_tienda_virtual;

/*** MUESTRA LISTA DE STOCK PRODUCTO DEL SISTEMA  ***/
DROP PROCEDURE sp_list_stock
CREATE PROCEDURE sp_list_stock
AS
	SELECT * FROM producto 
	INNER JOIN stocks_and_price
	ON producto.id_product = stocks_and_price.id_producto
	INNER JOIN sizesProduct
	ON stocks_and_price.id_size = sizesProduct.id_size
	INNER JOIN marca
	ON marca.id_marca = producto.id_brand
	ORDER BY producto.id_product, sizesProduct.id_size ASC
GO

sp_list_stock

/*** MUESTRA LISTA DE PRODUCTOS QUE NO ESTAN EN STOCK ***/
DROP PROCEDURE sp_list_products_out_stock
CREATE PROCEDURE sp_list_products_out_stock
AS
	SELECT DISTINCT id_product, id_category, name_product, id_brand, pdto_description, imagen FROM producto 
	LEFT JOIN stocks_and_price
	ON producto.id_product = stocks_and_price.id_producto 
	
GO


DROP PROCEDURE sp_insert_product_stock
CREATE PROCEDURE sp_insert_product_stock
@id_producto INT,
@id_size INT
AS
	INSERT INTO stocks_and_price(id_producto,price ,cantidad, id_size)  VALUES ( @id_producto , 0 , 0 ,@id_size)
GO

sp_insert_product_stock 1000008, 12



DROP PROCEDURE sp_update_product_stock
CREATE PROCEDURE sp_update_product_stock
@id_producto INT,
@price INT,
@stock INT
AS
	UPDATE stocks_and_price SET price = @price , cantidad = @stock WHERE id_pdto_stock = @id_producto
GO

SELECT * FROM stocks_and_price
sp_update_product_stock 1, 10000, 2 


/***TRIGER QUE INSERTA UN PRODUCTO AL STOCK***/
DROP TRIGGER Insert_Product_Stock 
CREATE TRIGGER Insert_Product_Stock 
on producto
for INSERT
AS 
BEGIN
DECLARE @id_producto INT;
SELECT @id_producto = id_product FROM inserted
INSERT INTO stocks_and_price(id_producto,price ,cantidad, id_size)  VALUES ( @id_producto , 0,0 ,8)
END

SELECT * FROM producto
SELECT * FROM stocks_and_price

INSERT INTO stocks_and_price (id_producto, price, cantidad, id_size) VALUES ( 1000001, 0 , 0 , 8)
/*
id_producto INT NOT NULL,
stock INT NOT NULL,
id_size INT NOT NULL,
*/
SELECT * FROM producto
SELECT * FROM stocks_and_price
select * from sizesProduct

UPDATE stocks_and_price SET id_size = 4 WHERE id_pdto_stock = 1
UPDATE stocks_and_price SET id_size = 5 WHERE id_pdto_stock = 2

/*********************************************/
/*********************************************/

DROP PROCEDURE sp_get_stock
CREATE PROCEDURE sp_get_stock
@id_stock INT
AS
	SELECT * FROM producto 
	INNER JOIN stocks_and_price
	ON producto.id_product = stocks_and_price.id_producto
	INNER JOIN sizesProduct
	ON stocks_and_price.id_size = sizesProduct.id_size
	INNER JOIN marca
	ON marca.id_marca = producto.id_brand
	WHERE id_pdto_stock = @id_stock
GO

sp_get_stock 1

SELECT * FROM stocks_and_price 
sp_get_stock 1


sp_list_stock

