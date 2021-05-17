use db_tienda_virtual;


/*** AGREGA UN PRODUCTO A LA CANASTA ***/
DROP PROCEDURE sp_add_product_to_buy;
CREATE PROCEDURE sp_add_product_to_buy
@id_pdto INT,
@in_cantidad INT

AS
/*CREAR PROCEDIMIENTO ALMACENADO 
	-- SESSION
	-- TENER UN TOKEN UNICO 
	-- DESCONTAR STOCK DE LA TABLA // DEVOLVER EL STOCK EN CASO NO SE HAGA LA COMPRA 
	-- ELIMINAR LISTA 
*/
SELECT * FROM lista_productos
BEGIN
	DECLARE cursor_agregar CURSOR FOR 
		SELECT producto_id, cantidad, id_cesta FROM lista_productos
		DECLARE @id_producto NUMERIC,
				@cantidad NUMERIC,
				@id_cesta NUMERIC,
				@contador NUMERIC = 0 ,
				@nro_row NUMERIC
				BEGIN 
					OPEN cursor_agregar
					FETCH NEXT FROM cursor_agregar INTO @id_producto, @cantidad,@id_cesta
					WHILE @@FETCH_STATUS = 0
					BEGIN	
						IF(@id_producto = @id_pdto)
							BEGIN
								SELECT 'son iguales ' + CONVERT(varchar, @id_producto)					
								SELECT @cantidad +=1;
								UPDATE lista_productos SET cantidad = @cantidad  WHERE producto_id = @id_producto AND token = 'user001' AND id_cesta = @id_cesta;
								/*restar otra cantiadd del stock*/					
							END
						ELSE
							BEGIN
								SELECT @contador = @contador + 1;
							END
						FETCH NEXT FROM cursor_agregar INTO @id_producto, @cantidad,@id_cesta
					END					
					CLOSE cursor_agregar
					DEALLOCATE cursor_agregar
				END

	BEGIN
		SELECT @nro_row = COUNT(*) FROM lista_productos
	END
	IF( @contador >= @nro_row)
	BEGIN
		SELECT 'EL CONTADOR ES : ' + CONVERT(VARCHAR, @contador)
		INSERT INTO lista_productos(producto_id, cantidad) values(@id_pdto, 1)

	END
END
GO

--------------------------------------------------------------------------------

DROP PROCEDURE sp_add_product_to_buy;
CREATE PROCEDURE sp_add_product_to_buy
@id_pdto INT
AS
BEGIN
DECLARE  @prdto_canasta INT,
		 @cantidad_lleva INT,
		 @precio_lleva INT

select @prdto_canasta = id_pdto_stock,@cantidad_lleva = cantidad_lleva, @precio_lleva = precio_lleva from lista_productos WHERE id_pdto_stock =  @id_pdto 
IF(@prdto_canasta>0)
	BEGIN
	SET @cantidad_lleva = @cantidad_lleva +1;
	UPDATE lista_productos SET cantidad_lleva = @cantidad_lleva, Sub_total =(@cantidad_lleva*@precio_lleva)  Where id_pdto_stock =  @prdto_canasta
	END
	ELSE
	BEGIN
	SELECT *																				 FROM  stocks_and_price WHERE id_pdto_stock = 2
	SELECT @prdto_canasta = id_pdto_stock, @precio_lleva = price, @cantidad_lleva = cantidad from  stocks_and_price Where id_pdto_stock = @id_pdto
	
	INSERT INTO lista_productos(id_pdto_stock, cantidad_lleva, precio_lleva, token, Sub_total, total)
	VALUES(@id_pdto,1,@precio_lleva,'user001', @precio_lleva, @precio_lleva)
	END
END
GO


sp_add_product_to_buy 1

Select * from lista_productos
truncate table lista_productos
delete from lista_productos
--Declare @stock_disponible INT = 0,
		--@stock_solicitado INT, 
		--@Msg VARCHAR(255)


/*SELECT @stock_solicitado = cantidad, @stock_disponible = stock FROM PRODUCTO 
INNER JOIN stocks_and_price 
ON producto.id_product = stocks_and_price.id_producto
WHERE id_producto = @id_pdto
-- ver si hay estock del producto 
SET @stock_solicitado = @stock_solicitado+1;

IF(@stock_disponible>=@stock_solicitado)
	BEGIN 
		SELECT @Msg = 'hay stock'

		UPDATE PRODUCTO SET cantidad = @stock_solicitado WHERE  id_product = @id_pdto
		--Add a tabla lista_productos
		INSERT INTO lista_productos(producto_id,token,Sub_total) VALUES(@id_pdto, 'user001', 0)

	END
	ELSE
	BEGIN
		SELECT @Msg = 'No hay Stock'
	END
-- si hay stock agregar a canasta y rebajar stock de la tabla stocks_and_price
-- si no hay stock no hacer nada 
	SELECT @Msg +' '+ CONVERT(VARCHAR, @stock_disponible) +' '+ CONVERT(VARCHAR, @stock_solicitado)
	
END
*/
GO


SELECT * from stocks_and_price
INSERT INTO lista_productos(id_pdto_stock, cantidad_lleva, precio_lleva, token, Sub_total, Total)
VALUES (1,1,10000,'user001',10000,10000)

Select * from lista_productos
sp_add_product_to_buy 1000003

SELECT * from producto
SELECT * from lista_productos


sp_add_product_to_buy 1000003

select * from producto 



/*** Elimina los productos de un tipo A LA CANASTA ***/

DROP PROCEDURE sp_delete_produt_to_buy

CREATE PROCEDURE sp_delete_produt_to_buy
@id_pdto INT
AS
BEGIN
	DELETE FROM lista_productos WHERE producto_id = @id_pdto 
END


/*** MOSTRAR LA CANASTA ***/

DROP PROCEDURE sp_product_to_buy;
CREATE PROCEDURE sp_product_to_buy
 @token VARCHAR(255)
AS
BEGIN
	SELECT * FROM lista_productos 
	INNER JOIN stocks_and_price
	ON lista_productos.id_pdto_stock = stocks_and_price.id_pdto_stock
	INNER JOIN producto
	ON stocks_and_price.id_producto = producto.id_product
	INNER JOIN sizesProduct
	ON stocks_and_price.id_size = sizesProduct.id_size
	WHERE token =  @token
END
GO

sp_product_to_buy 'user001'

sp_product_to_buy


sp_product_to_buy 'user001'

select * from lista_productos





TRUNCATE TABLE lista_productos

select * from producto
select * from lista_productos


sp_add_product_to_buy 1000001
sp_add_product_to_buy 1000002
sp_add_product_to_buy 1000003
sp_add_product_to_buy 1000004


select * from lista_productos
sp_add_product_to_buy 1000005


sp_product_to_buy