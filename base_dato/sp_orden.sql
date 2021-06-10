use db_tienda_virtual; 

DROP PROCEDURE sp_make_order
CREATE PROCEDURE sp_make_order
@token VARCHAR(255),
@id_usuario INT
AS
DECLARE @nro_orden_carrito INT,
		@Total INT = 0,
		@nombre VARCHAR(255),
		@apellido VARCHAR(255),
		@username VARCHAR(255),
		@fechaNacimiento DATETIME,
		@telefono VARCHAR(255),
		@email VARCHAR(255),
		@genero VARCHAR(255),
		@idUsuario INT, 
		@idComuna INT,
		@direccion VARCHAR(255)

SELECT  @nombre = first_name,
		@apellido = father_lastname, 
		@username = username , 
		@fechaNacimiento = birthday , 
		@email = email, 
		@telefono = telefono,
		@genero= nombre_sexo,
		@idComuna = comuna_id,
		@direccion = home_address
		FROM usuario
		INNER JOIN sexo
		ON usuario.sex_id = sexo.id_sexo
		WHERE id = @id_usuario


INSERT INTO orden_usuario(id_usuario, Nombre, Apellido, username, fechaNacimiento, email, telefono ,genero, id_comuna, direccion)
VALUES(@id_usuario, @nombre, @apellido, @username, @fechaNacimiento, @email, @telefono,  @genero, @idComuna, @direccion)


SELECT @idUsuario = id FROM orden_usuario
WHERE username = @username and email = @email
ORDER BY id DESC 
OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY


--LLENAMOS EL CARRITO
SELECT * FROM orden_carrito
INSERT INTO orden_carrito(id_persona, token ,fecha_pedido,Total, direccion_envío, id_comuna)VALUES(@idUsuario, @token ,GETDATE(), 0, @direccion, @idComuna);


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
		imagen,
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
		@imagen VARCHAR(255),
		@cantidad_lleva NUMERIC,
		@precio_lleva NUMERIC	
				BEGIN 
					OPEN cursor_make_order
					FETCH NEXT FROM cursor_make_order INTO @Id_Cesta, @id_producto,@id_pdto_stock,@name_product,@pdto_description,@name_category,@brand,@size,@imagen,@cantidad_lleva,@precio_lleva 	
					WHILE @@FETCH_STATUS = 0
					BEGIN	



		INSERT INTO orden_carrito_compra(id_carrito,id_producto,id_stock,nombre_producto,descripcion,categoria, imagen, marca, talla, cantidad, precio, subTotal)
		VALUES(@nro_orden_carrito, @id_producto,@id_pdto_stock,@name_product,@pdto_description, @name_category,@imagen, @brand,@size, @cantidad_lleva, @precio_lleva, (@cantidad_lleva*@precio_lleva) )

		SET @Total = @Total + (@cantidad_lleva*@precio_lleva);  
						-- eliminar datos de la tabal lista_producto
		DELETE FROM lista_productos WHERE id_cesta = @id_cesta
						FETCH NEXT FROM cursor_make_order  INTO @Id_Cesta,@id_producto,@id_pdto_stock,@name_product,@pdto_description,@name_category,@brand,@size,@imagen,@cantidad_lleva,@precio_lleva 
					END					
					CLOSE cursor_make_order
					DEALLOCATE cursor_make_order
				END
	UPDATE orden_carrito SET Total = @Total WHERE id_cesta = @nro_orden_carrito
GO

sp_make_order '2021-06-0501:55:18????s?D??YN.??.?', 10003

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




sp_update_user_order 10003 ,'2021-06-0501:55:18????s?D??YN.??.?'

UPDATE lista_productos SET id_usuario = 10001
sp_make_order 'user001', 10001

select * from orden_usuario
select * from orden_carrito_compra
select * from orden_carrito
select * from lista_productos
select * from usuario
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


sp_get_order '2021-06-0808:14:49??*?_W?q???Q??'

select * from 






/*
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
*/


sp_list_orders_pending

select * from orden_estado_pedido


SELECT * FROM orden_estado_pedido
sp_list_order 'admin'
sp_list_order 'admin'

select * from usuario



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
WHERE token = '28/05/2021 13:22:38???@ ?????L'



select * from lista_productos
sp_get_order '28/05/2021 13:22:38???@ ?????L'

======================================================

DROP PROCEDURE sp_update_address_user_order
CREATE PROCEDURE sp_update_address_user_order
@id INT,
@id_region INT,
@id_comuna INT,
@direccion VARCHAR(255)
AS
UPDATE orden_usuario
SET id_region = @id_region,
id_comuna =@id_comuna,
direccion = @direccion
WHERE id = @id
GO


======================================
DROP PROCEDURE sp_payment_method 
CREATE PROCEDURE sp_payment_method
@cesta INT,
@id_tipo_medio_pago INT,
@id_estado_pago INT
AS
UPDATE orden_carrito
SET id_tipo_medio_pago = @id_tipo_medio_pago,
id_estado_pago = @id_estado_pago
WHERE id_cesta = @cesta
GO

DROP PROCEDURE sp_update_state_send 
CREATE PROCEDURE sp_update_state_send
@cesta INT,
@id_envio INT
AS
UPDATE orden_carrito
SET id_envio = @id_envio
WHERE id_cesta = @cesta
GO

sp_update_state_send 1, 3

SELECT * FROM orden_usuario;
SELECT * FROM orden_carrito
select * from comuna
SELECT * FROM orden_medio_pago
SELECT * FROM orden_id_estado_pago




sp_get_order '2021-06-0805:44:16?????G??Q?i??D??' 


DROP PROCEDURE sp_list_order
CREATE PROCEDURE sp_list_order
@user VARCHAR(255)
AS
DECLARE cursor_get_orders CURSOR FOR 
		SELECT
		id_cesta,
		id_producto,
		nombre_producto,
		descripcion,
		talla,
		marca,
		cantidad,
		precio,
		subTotal,
		fecha_pedido,
		estado_pago,
		estado_pedido,
		direccion 
		FROM orden_carrito
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
		DECLARE 
		@id_Cesta NUMERIC,
		@id_producto NUMERIC,
		@nombre_producto VARCHAR(255),
		@pdto_description VARCHAR(500),
		@talla VARCHAR(255),
		@marca VARCHAR(255),
		@cantidad NUMERIC,
		@precio NUMERIC,
		@subTotal NUMERIC,
		@fecha_pedido DATETIME,
		@Estado_pago VARCHAR(255),
		@Estado_pedido VARCHAR(255),
		@direccion VARCHAR(255)
				BEGIN 
					OPEN cursor_get_orders
					FETCH NEXT FROM cursor_get_orders INTO @id_Cesta, @id_producto, @nombre_producto, @pdto_description, @talla, @marca, @cantidad, @precio, @subTotal, @fecha_pedido, @Estado_pago, @Estado_pedido, @direccion 	
					WHILE @@FETCH_STATUS = 0
					BEGIN	
					SELECT 'hola'
					FETCH NEXT FROM cursor_get_orders  INTO @id_Cesta, @id_producto, @nombre_producto, @pdto_description, @talla, @marca, @cantidad, @precio, @subTotal, @fecha_pedido, @Estado_pago, @Estado_pedido, @direccion 
					END					
					CLOSE cursor_get_orders
					DEALLOCATE cursor_get_orders
				END
GO


sp_list_order 'admin'

-- order by id_cesta , mas reciente y por estado


DROP VIEW v_orders
CREATE VIEW v_orders
	AS
	SELECT id_cesta,
		id_producto,
		nombre_producto,
		descripcion,
		talla,
		marca,
		cantidad,
		precio,
		subTotal,
		fecha_pedido,
		username,
		imagen,
		Total,
		estado_pago,
		estado_pedido,
		direccion, 
		nombre_comuna,
		fecha_pedido
		FROM orden_carrito
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
	INNER JOIN comuna
	ON orden_carrito.id_comuna = comuna.id_comuna
	GROUP BY id_cesta,
		id_producto,
		nombre_producto,
		descripcion,
		talla,
		marca,
		cantidad,
		precio,
		subTotal,
		fecha_pedido,
		username,
		imagen,
		Total,
		estado_pago,
		estado_pedido,
		direccion, 
		nombre_comuna,
		fecha_pedido
GO




SELECT COUNT(id_carrito) as cesta_count from orden_carrito_compra 
GROUP BY id_carrito


SELECT * from v_orders
SELECT * from orden_carrito_compra



DROP PROCEDURE sp_list_order
CREATE PROCEDURE sp_list_order
@user VARCHAR(255)
AS
SELECT COUNT(id_carrito) as cesta_count, username , v_orders.id_cesta, v_orders.id_producto, 
v_orders.nombre_producto, v_orders.descripcion, v_orders.talla, v_orders.marca, v_orders.cantidad, v_orders.precio, v_orders.direccion,
v_orders.imagen, v_orders.subTotal, v_orders.Total, v_orders.estado_pago, v_orders.estado_pedido, v_orders.nombre_comuna,
v_orders.fecha_pedido
from orden_carrito_compra 
INNER JOIN v_orders
ON v_orders.id_cesta = orden_carrito_compra.id_carrito
WHERE username = @user
GROUP BY id_cesta, username, v_orders.id_cesta, v_orders.id_producto,
v_orders.nombre_producto, v_orders.descripcion, v_orders.talla, v_orders.marca, v_orders.cantidad, v_orders.precio, v_orders.direccion,
v_orders.imagen, v_orders.subTotal, v_orders.Total, v_orders.estado_pago, v_orders.estado_pedido, v_orders.nombre_comuna,
v_orders.fecha_pedido
GO

sp_list_order 'admin'


SELECT * FROM orden_carrito

DROP VIEW v_orders_whit_user
CREATE VIEW v_orders_whit_user
	AS
	SELECT id_cesta,
		id_producto,
		nombre_producto,
		descripcion,
		talla,
		marca,
		cantidad,
		precio,
		subTotal,
		fecha_pedido,
		username,
		imagen,
		Total,
		estado_pago,
		orden_carrito.id_envio,
		estado_pedido,
		direccion, 
		nombre_comuna,
		Nombre,
		Apellido,
		telefono,
		email
		FROM orden_carrito
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
	INNER JOIN comuna
	ON orden_carrito.id_comuna = comuna.id_comuna
	GROUP BY id_cesta,
		id_producto,
		nombre_producto,
		descripcion,
		talla,
		marca,
		cantidad,
		precio,
		subTotal,
		fecha_pedido,
		username,
		imagen,
		Total,
		estado_pago,
		orden_carrito.id_envio,
		estado_pedido,
		direccion, 
		nombre_comuna,
		Nombre,
		Apellido,
		telefono,
		email
GO


select * from v_orders_whit_user


DROP PROCEDURE sp_list_orders_pending
CREATE PROCEDURE sp_list_orders_pending
AS
SELECT COUNT(id_carrito) as cesta_count, username , v_orders_whit_user.id_cesta, v_orders_whit_user.id_producto, 
v_orders_whit_user.nombre_producto, v_orders_whit_user.descripcion, v_orders_whit_user.talla, v_orders_whit_user.marca, v_orders_whit_user.cantidad, v_orders_whit_user.precio, v_orders_whit_user.direccion,
v_orders_whit_user.imagen, v_orders_whit_user.subTotal, v_orders_whit_user.Total, v_orders_whit_user.estado_pago, v_orders_whit_user.id_envio ,v_orders_whit_user.estado_pedido, v_orders_whit_user.nombre_comuna,
v_orders_whit_user.fecha_pedido
from orden_carrito_compra 
INNER JOIN v_orders_whit_user
ON v_orders_whit_user.id_cesta = orden_carrito_compra.id_carrito
WHERE v_orders_whit_user.id_envio <> 6
GROUP BY id_cesta, username, v_orders_whit_user.id_cesta, v_orders_whit_user.id_producto,
v_orders_whit_user.nombre_producto, v_orders_whit_user.descripcion, v_orders_whit_user.talla, v_orders_whit_user.marca, v_orders_whit_user.cantidad, v_orders_whit_user.precio, v_orders_whit_user.direccion,
v_orders_whit_user.imagen, v_orders_whit_user.subTotal, v_orders_whit_user.Total, v_orders_whit_user.estado_pago, v_orders_whit_user.id_envio, v_orders_whit_user.estado_pedido, v_orders_whit_user.nombre_comuna,
v_orders_whit_user.fecha_pedido
GO

sp_list_orders_pending

/*
DROP PROCEDURE sp_list_orders_pending
CREATE PROCEDURE sp_list_orders_pending
AS
DECLARE @contador INT, 
@id_carrito INT
SELECT @contador = COUNT(orden_carrito_compra.id_carrito) as cantidad_id, orden_carrito_compra.id_carrito from orden_carrito_compra GROUP BY id_carrito
SELECT @contador, orden_carrito_compra.id_carrito,
id_producto, categoria, nombre_producto, marca, precio, descripcion, cantidad, talla, subTotal, Total,
Nombre, Apellido, email, fecha_pedido, estado_pago, estado_pedido
FROM orden_carrito
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


-- order by id_cesta , mas reciente y por estado
GO
*/

SELECT * FROM usuario