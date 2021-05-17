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

/***  Trae un Producto  ***/
DROP PROCEDURE sp_get_product
CREATE PROCEDURE sp_get_product
@id_product INT
AS
	SELECT * FROM producto
	INNER JOIN categoria
	ON producto.id_category = categoria.id_category
	INNER JOIN marca
	ON producto.id_brand = marca.id_marca
	WHERE id_product = @id_product
GO

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
	id_brand = @id_Brand, pdto_description = @pdto_description WHERE id_product = @id_product
GO

/***  Elimina un Producto  ***/
DROP PROCEDURE sp_delete_product
CREATE PROCEDURE sp_delete_product
@id_product INT
AS
	DELETE FROM producto WHERE id_product =  @id_product 	
GO








