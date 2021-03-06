use db_tienda_virtual;

/*** AGREGA UN PRODUCTO AL SISTEMA  ***/
DROP PROCEDURE sp_insert_product
CREATE PROCEDURE sp_insert_product
@category_id INT,
@name VARCHAR(255),
@brand_id INT,
@descrption VARCHAR(255),
@imagen VARCHAR(500)
AS
INSERT INTO producto(id_category, name_product, id_brand, pdto_description, arribal_date, imagen)
VALUES              (@category_id , @name, @brand_id, @descrption, GETDATE(), @imagen);

GO

/***  Lista de Productos  ***/
DROP PROCEDURE sp_List_product
CREATE PROCEDURE sp_List_product
AS
	SELECT * FROM producto
	INNER JOIN categoria
	ON producto.id_category = categoria.id_category
	INNER JOIN marca
	ON producto.id_brand = marca.id_marca
GO

select * from categoria

/***  Trae un Producto  ***/
DROP PROCEDURE sp_get_product
CREATE PROCEDURE sp_get_product
@id_product INT
AS
	SELECT  DISTINCT id_product, producto.id_category, name_category, COUNT(cantidad) as cantidad, name_product, id_brand, brand,pdto_description, imagen, price FROM producto
	INNER JOIN categoria
	ON producto.id_category = categoria.id_category
	INNER JOIN marca
	ON producto.id_brand = marca.id_marca
	LEFT JOIN stocks_and_price
	ON producto.id_product = stocks_and_price.id_producto
	WHERE id_product =   @id_product
	GROUP BY id_product, producto.id_category,id_brand, brand, price, name_category,name_product, pdto_description, imagen

GO

select * from stocks_and_price

sp_get_product 1000001

/***************************************************/
DROP PROCEDURE sp_get_product_whit_stocks
CREATE PROCEDURE sp_get_product_whit_stocks
@id_producto INT
AS
	SELECT  * FROM producto
	INNER JOIN categoria
	ON producto.id_category = categoria.id_category
	INNER JOIN marca
	ON producto.id_brand = marca.id_marca
	LEFT JOIN stocks_and_price
	ON producto.id_product = stocks_and_price.id_producto
	INNER JOIN sizesProduct
	ON stocks_and_price.id_size = sizesProduct.id_size
	WHERE producto.id_product = @id_producto
GO


sp_get_product_whit_stocks 1000001

SELECT * FROM stocks_and_price
SELECT * FROM producto

/***  Actualiza un Producto  ***/
DROP PROCEDURE sp_update_product
CREATE PROCEDURE sp_update_product
@id_product INT,
@id_Category INT,
@name_product VARCHAR(255),
@id_Brand INT,
@pdto_description VARCHAR(255),
@imagen VARCHAR(255)
AS
	UPDATE producto SET id_category = @id_Category, name_product = @name_product, 
	id_brand = @id_Brand, pdto_description = @pdto_description, imagen = @imagen WHERE id_product = @id_product
GO

sp_update_product 1000010,105,'Zapatilla Deportiva', 1,'modificacion de la zapatilla'

/***  Elimina un Producto  ***/
DROP PROCEDURE sp_delete_product
CREATE PROCEDURE sp_delete_product
@id_product INT
AS
	DELETE FROM producto WHERE id_product =  @id_product 	
GO

DROP PROCEDURE sp_delete_all_product_cart
CREATE PROCEDURE sp_delete_all_product_cart
@token VARCHAR(255)
AS
DELETE lista_productos WHERE token = @token
GO


DROP PROCEDURE sp_delete_one_kind_product_cart
CREATE PROCEDURE sp_delete_one_kind_product_cart
@token VARCHAR(255),
@id_product INT
AS
select * from lista_productos
DELETE lista_productos WHERE token = @token AND id_pdto_stock = @id_product
GO

DROP PROCEDURE sp_rest_a_prodct_of_list
CREATE PROCEDURE sp_rest_a_prodct_of_list
AS

GO

truncate table lista_productos
select * from lista_productos




	
select * from lista_productos



select * from provincia Where id_region = 1 



select * from region


sp_get_product 1000001

select * from usuario


sp_product_to_buy '26/05/2021 23:09:23??(?Ta9b?????'

