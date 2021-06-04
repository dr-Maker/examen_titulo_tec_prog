use db_tienda_virtual;

/*** TRAE UN LISTADO DE PRODUCTOS DE FORMA ALEATOREA PARA EL INICIO ***/


DROP PROCEDURE sp_list_products_aleatory
CREATE PROCEDURE sp_list_products_aleatory
@page INT
AS
/*hacer inner join con la categoria para poder llenar el objeto en la instacia del objeton negoccio Producto*/
	SELECT DISTINCT id_product ,categoria.id_category , name_category, name_product, id_brand, brand,pdto_description, imagen, price FROM producto
	INNER JOIN categoria
	ON producto.id_category = categoria.id_category
	INNER JOIN stocks_and_price
	ON producto.id_product = stocks_and_price.id_producto
	INNER JOIN marca
	ON producto.id_brand = marca.id_marca
	ORDER BY id_product ASC OFFSET @page ROWS FETCH NEXT 6 ROWS ONLY
GO



/***************************************************************************/

DROP PROCEDURE sp_count_product_inicio
CREATE PROCEDURE sp_count_product_inicio
AS
	Select  COUNT(DISTINCT producto.id_product) as cantidad_product FROM producto
	INNER JOIN categoria
	ON producto.id_category = categoria.id_category
	INNER JOIN stocks_and_price
	ON producto.id_product = stocks_and_price.id_producto
	INNER JOIN marca
	ON producto.id_brand = marca.id_marca
GO

sp_count_product_inicio

SELECT * FROM lista_productos

/*** TRAE UN LISTADO DE PRODUCTOS SEGUN SEA SU CATEGORIA ***/

DROP PROCEDURE sp_list_products_by_category
CREATE PROCEDURE sp_list_products_by_category
@category INT,
@page INT
AS
/*hacer inner join con la categoria para poder llenar el objeto en la instacia del objeton negoccio Producto*/
	
	SELECT DISTINCT id_product ,categoria.id_category , name_category, name_product, id_brand, brand,pdto_description, imagen, price FROM producto
	INNER JOIN categoria
	ON producto.id_category = categoria.id_category
	INNER JOIN stocks_and_price
	ON producto.id_product = stocks_and_price.id_producto
	INNER JOIN marca
	ON producto.id_brand = marca.id_marca
	WHERE producto.id_category = @category
	ORDER BY id_product ASC OFFSET @page ROWS FETCH NEXT 6 ROWS ONLY
GO


sp_list_products_by_category

DROP PROCEDURE sp_count_products_by_category
CREATE PROCEDURE sp_count_products_by_category
@category INT
AS

	SELECT COUNT(DISTINCT producto.id_product) as cantidad_product FROM producto
	INNER JOIN categoria
	ON producto.id_category = categoria.id_category
	INNER JOIN stocks_and_price
	ON producto.id_product = stocks_and_price.id_producto
	INNER JOIN marca
	ON producto.id_brand = marca.id_marca
	WHERE producto.id_category = @category
GO



sp_get_product 1000001 


/*** TRAE UN PRODUCTO  ***/
DROP PROCEDURE sp_get_product
CREATE PROCEDURE sp_get_product
@id_product INT
AS
	SELECT DISTINCT id_product ,categoria.id_category, name_category, name_product, id_brand, brand,pdto_description, imagen, price, cantidad FROM producto 
	INNER JOIN categoria
	ON producto.id_category = categoria.id_category
	INNER JOIN stocks_and_price
	ON producto.id_product = stocks_and_price.id_producto
	INNER JOIN marca
	ON producto.id_brand = marca.id_marca
	WHERE id_product = @id_product
GO

SELECT * from stocks_and_price
sp_get_product 1000001

DROP PROCEDURE sp_get_list_size
CREATE PROCEDURE sp_get_list_size
@id_product INT
AS
SELECT * FROM stocks_and_price 
INNER JOIN sizesProduct
ON stocks_and_price.id_size = sizesProduct.id_size
INNER JOIN producto
ON stocks_and_price.id_producto = producto.id_product
INNER JOIN marca
ON producto.id_brand = marca.id_marca
WHERE id_producto = @id_product
ORDER BY sizesProduct.id_size ASC
GO


sp_get_list_size 1000001



