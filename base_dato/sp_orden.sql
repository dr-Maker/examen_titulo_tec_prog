use db_tienda_virtual;

DROP PROCEDURE sp_make_order
CREATE PROCEDURE sp_make_order
@token VARCHAR(255),
@id_usuario INT
AS
DECLARE @nro_orden_carrito INT,
--NECESITAMOS RECIBIR EL USUARIO y token por parametro
		@Total INT = 0,
		@nombre VARCHAR(255),
		@apellido VARCHAR(255),
		@username VARCHAR(255),
		@fechaNacimiento DATETIME,
		@email VARCHAR(255),
		@genero VARCHAR(255),
		@idUsuario INT, 
		@idComuna INT,
		@direccion VARCHAR(255)

--AGREGAR UN IF SI ES NULL COMIENZA EN 0 SINO SE TOMA EL ULTIMO ID Y SE LE SUMA 1
--SELECT id_cesta FROM orden_carrito
/*
SELECT /*@nro_orden_carrito =*/ COUNT(*) FROM orden_carrito
SET @nro_orden_carrito = @nro_orden_carrito +1;
*/
-- NECESITAMOS LLENAR LA TABLA USUARIO CON LOS DATOS DE QUIEN COMPRA
SELECT  @nombre = first_name,
		@apellido = father_lastname, 
		@username = username , 
		@fechaNacimiento = birthday , 
		@email = email, 
		@genero= nombre_sexo,
		@idComuna = comuna_id,
		@direccion = home_address
		FROM usuario
		INNER JOIN sexo
		ON usuario.sex_id = sexo.id_sexo
		WHERE id = @id_usuario

		Select * from orden_usuario

INSERT INTO orden_usuario(Nombre, Apellido, username, fechaNacimiento, email, genero, id_comuna, direccion)
VALUES(@nombre, @apellido, @username, @fechaNacimiento, @email, @genero, @idComuna, @direccion)


SELECT @idUsuario = id FROM orden_usuario
WHERE username = @username and email = @email
ORDER BY id DESC 
OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY


--LLENAMOS EL CARRITO
INSERT INTO orden_carrito(id_persona, token ,fecha_pedido,Total)VALUES(@idUsuario, @token ,GETDATE(), 0);


SELECT @nro_orden_carrito = id_cesta FROM orden_carrito
WHERE id_persona = @idUsuario
ORDER BY id_cesta DESC 
OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY


--RECORER TODA LA lista_productos e insertar en las tablas correspondiente de productos que lleva
DECLARE cursor_make_order CURSOR FOR 
		SELECT
		id_cesta,
		id_producto,
		lista_productos.id_pdto_stock, 
		name_product,
		pdto_description,
		name_category,
		brand,
		size,
		cantidad_lleva,
		precio_lleva
		FROM lista_productos
		INNER JOIN stocks_and_price
		ON lista_productos.id_pdto_stock = stocks_and_price.id_pdto_stock
		INNER JOIN producto
		ON stocks_and_price.id_producto = producto.id_product
		INNER JOIN categoria
		ON producto.id_category = categoria.id_category
		INNER JOIN marca
		ON producto.id_brand = marca.id_marca
		INNER JOIN sizesProduct
		ON stocks_and_price.id_size = sizesProduct.id_size
		WHERE token = @token and id_usuario = @id_usuario

		DECLARE 
		@Id_Cesta NUMERIC,
		@id_producto NUMERIC,
		@id_pdto_stock NUMERIC, 
		@name_product VARCHAR(255),
		@pdto_description VARCHAR(500),
		@name_category VARCHAR(255),
		@brand VARCHAR(255),
		@size VARCHAR(255),
		@cantidad_lleva NUMERIC,
		@precio_lleva NUMERIC	
				BEGIN 
					OPEN cursor_make_order
					FETCH NEXT FROM cursor_make_order INTO @Id_Cesta, @id_producto,@id_pdto_stock,@name_product,@pdto_description,@name_category,@brand,@size,@cantidad_lleva,@precio_lleva 	
					WHILE @@FETCH_STATUS = 0
					BEGIN	

						-- INSERTAR DATOS EN tabla orden producto

		-- No se puede insertar un valor explícito en la columna de identidad de la tabla 'orden_carrito' cuando IDENTITY_INSERT es OFF.
		-- Instrucción INSERT en conflicto con la restricción FOREIGN KEY 'FK__orden_car__id_ca__40257DE4'. El conflicto ha aparecido en la base de datos 'db_tienda_virtual', tabla 'dbo.orden_carrito', column 'id_cesta'.
		
	

		/*
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
		*/


		INSERT INTO orden_carrito_compra(id_carrito,id_producto,id_stock,nombre_producto,descripcion,categoria, marca, talla, cantidad, precio, subTotal)
		VALUES(@nro_orden_carrito, @id_producto,@id_pdto_stock,@name_product,@pdto_description, @name_category,@brand,@size, @cantidad_lleva, @precio_lleva, (@cantidad_lleva*@precio_lleva) )

		SET @Total = @Total + (@cantidad_lleva*@precio_lleva);  
						-- eliminar datos de la tabal lista_producto
		DELETE FROM lista_productos WHERE id_cesta = @id_cesta
						FETCH NEXT FROM cursor_make_order  INTO @Id_Cesta,@id_producto,@id_pdto_stock,@name_product,@pdto_description,@name_category,@brand,@size,@cantidad_lleva,@precio_lleva 
					END					
					CLOSE cursor_make_order
					DEALLOCATE cursor_make_order
				END
	UPDATE orden_carrito SET Total = @Total WHERE id_cesta = @nro_orden_carrito

GO

/*=================================*/
select * from lista_productos

DROP PROCEDURE sp_update_user_order
CREATE PROCEDURE sp_update_user_order
@id_usuario INT,
@token VARCHAR(255)
--HACER UN SELECT ON INNER JOIN DE LA TABLA orden_carrito
AS
	UPDATE lista_productos SET id_usuario = @id_usuario WHERE token = @token
GO


UPDATE lista_productos SET id_usuario = 10001
sp_make_order 'user001', 10001

select * from orden_usuario
select * from orden_carrito_compra
select * from orden_carrito
select * from lista_productos
truncate table lista_productos

SELECT * FROM orden_carrito


INSERT INTO orden_carrito(id_persona,fecha_pedido,Total)VALUES
					(1, GETDATE(),0);


/*
select * from lista_productos
INNER JOIN stocks_and_price
ON lista_productos.id_pdto_stock = stocks_and_price.id_pdto_stock
INNER JOIN producto
ON stocks_and_price.id_producto = producto.id_product
INNER JOIN categoria
ON producto.id_category = categoria.id_category
INNER JOIN marca
ON producto.id_brand = marca.id_marca
INNER JOIN sizesProduct
ON stocks_and_price.id_size = sizesProduct.id_size
WHERE token = 'user001' and id_usuario IS NULL

SELECT * from sizesProduct
SELECT * from stocks_and_price
*/

/**********************

CREATE TABLE orden_usuario(
Nombre VARCHAR(255) NOT NULL,
Apellido VARCHAR(255) NOT NULL,
username VARCHAR(255) NOT NULL,
fechaNacimiento DATETIME NOT NULL,
email VARCHAR(255) NOT NULL,
genero VARCHAR(255),
)

CREATE TABLE orden_carrito(
Total INT NOT NULL,
)

CREATE TABLE orden_carrito_compra(
id_producto INT NOT NULL,
id_stock INT NOT NULL,
nombre_producto VARCHAR(255) NOT NULL,
descripcion VARCHAR(500) NOT NULL,
categoria VARCHAR(255) NOT NULL,
marca VARCHAR(500) NOT NULL,
talla VARCHAR(500) NOT NULL,
cantidad INT NOT NULL,
precio INT NOT NULL
)
***********************/


sp_make_order




DROP PROCEDURE sp_get_order
CREATE PROCEDURE sp_get_order
--HACER UN SELECT ON INNER JOIN DE LA TABLA orden_carrito
AS
GO

DROP PROCEDURE sp_pay_order
CREATE PROCEDURE sp_pay_order
AS
--ACTUALIZAR ESTADO DE PAGO
GO

/*======================GET ORDEN========================================*/

DROP PROCEDURE sp_get_order
CREATE PROCEDURE sp_get_order
@token VARCHAR(255)
AS
SELECT * FROM orden_carrito
INNER JOIN orden_carrito_compra
ON orden_carrito.id_cesta = orden_carrito_compra.id_carrito
INNER JOIN orden_usuario
ON orden_carrito.id_persona = orden_usuario.id
INNER JOIN comuna
ON orden_usuario.id_comuna = comuna.id_comuna
INNER JOIN provincia
ON comuna.id_provincia = provincia.id_provincia
INNER JOIN region
ON provincia.id_region = region.id_region
WHERE token = @token
GO

sp_get_order 3

select * from 


DROP PROCEDURE sp_list_order
CREATE PROCEDURE sp_list_order
@user VARCHAR(255)
AS
SELECT * FROM orden_carrito
INNER JOIN orden_carrito_compra
ON orden_carrito.id_cesta = orden_carrito_compra.id_carrito
INNER JOIN orden_usuario
ON orden_carrito.id_persona = orden_usuario.id
INNER JOIN orden_medio_pago
ON orden_carrito.id_tipo_medio_pago = orden_medio_pago.id_tipo_medio_pago
INNER JOIN orden_id_estado_pago
ON orden_id_estado_pago.id_estado_pago = orden_carrito.id_estado_pago
INNER JOIN orden_estado_pedido
ON orden_estado_pedido.id_envio = orden_carrito.id_envio
WHERE username = @user
-- order by id_cesta , mas reciente y por estado
GO


DROP PROCEDURE sp_list_orders_pending
CREATE PROCEDURE sp_list_orders_pending
AS
SELECT * FROM orden_carrito
INNER JOIN orden_carrito_compra
ON orden_carrito.id_cesta = orden_carrito_compra.id_carrito
INNER JOIN orden_usuario
ON orden_carrito.id_persona = orden_usuario.id
INNER JOIN orden_medio_pago
ON orden_carrito.id_tipo_medio_pago = orden_medio_pago.id_tipo_medio_pago
INNER JOIN orden_id_estado_pago
ON orden_id_estado_pago.id_estado_pago = orden_carrito.id_estado_pago
INNER JOIN orden_estado_pedido
ON orden_estado_pedido.id_envio = orden_carrito.id_envio
WHERE orden_estado_pedido.id_envio <> 6
-- order by id_cesta , mas reciente y por estado
GO

select * from orden_estado_pedido


SELECT * FROM orden_estado_pedido
sp_list_order 'admin'
sp_list_order 'admin'

select * from usuario