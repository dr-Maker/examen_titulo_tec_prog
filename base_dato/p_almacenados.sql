use db_tienda_virtual;

/******Procedimientos almacenados******/

/***REGIESTO RE USUARIO - INSERTA UN NUEVO USUARIO***/


DROP PROCEDURE sp_insert_user

CREATE PROCEDURE sp_insert_user
@first_name VARCHAR(255), 
@second_name VARCHAR(255), 
@father_lastname VARCHAR(255), 
@mother_lastname VARCHAR(255),
@pass VARCHAR(255),
@user VARCHAR(255),
@email VARCHAR(255),
@birthdate DATETIME,
@sex INT,
@comuna INT,
@direccion VARCHAR(255)
AS
INSERT INTO usuario(first_name,second_name,father_lastname,mother_lastname,pass,username,email, birthday,sex_id, comuna_id, home_address, register_date) 
		     VALUES(@first_name, @second_name, @father_lastname, @mother_lastname, CONVERT(VARCHAR(255),HASHBYTES('MD5', @pass), 2) ,@user, @email,@birthdate, @sex, @comuna, @direccion, GETDATE())
GO



truncate table usuario
select * from usuario

UPDATE usuario SET user_role = 'admin' WHERE id = 10002



/*** VALIDA UN USUARIO PARA VER SI PUEDE ENTRAR AL SISTMEA ***/

DROP PROCEDURE sp_validate_user

CREATE PROCEDURE sp_validate_user
@username VARCHAR(255),
@pass VARCHAR(255)

AS
	SELECT first_name as nombre, second_name as nombre_dos, father_lastname as apellido_pat, mother_lastname as apellido_mat, username, email, user_role as rol, '*********' as pass FROM usuario WHERE  username = @username   AND pass = CONVERT(varchar(255),HASHBYTES('MD5',@pass),2)  ; 
	
GO

sp_validate_user  d_maker , 12345

select * from usuario


/*** INSERTA UNA CATEGORIA DE PRODUCTO ***/


DROP PROCEDURE sp_insert_category

CREATE PROCEDURE sp_insert_category
@category VARCHAR(255)
AS
	INSERT INTO categoria(name_category) VALUES(@category);
GO


/*** TRAE EL LISTADO DE CATEGORIAS EXISTENTES ***/

DROP PROCEDURE sp_list_category

CREATE PROCEDURE sp_list_category
AS
	select * from categoria 
GO

sp_list_category


truncate table categoria
/*crear sp_ productos aleatorios*/


/*** TRAE UN LISTADO DE PRODUCTOS DE FORMA ALEATOREA PARA EL INICIO ***/


DROP PROCEDURE sp_list_products_aleatory

CREATE PROCEDURE sp_list_products_aleatory
AS
/*hacer inner join con la categoria para poder llenar el objeto en la instacia del objeton negoccio Producto*/
	SELECT * FROM producto
	INNER JOIN categoria
	ON producto.id_category = categoria.id_category
	ORDER BY id_product ASC OFFSET 0 ROWS FETCH NEXT 6 ROWS ONLY
GO



/*** TRAE UN LISTADO DE PRODUCTOS SEGUN SEA SU CATEGORIA ***/

DROP PROCEDURE sp_list_products_by_category
CREATE PROCEDURE sp_list_products_by_category
@category INT
AS
/*hacer inner join con la categoria para poder llenar el objeto en la instacia del objeton negoccio Producto*/
	SELECT * FROM producto WHERE id_category = @category
	ORDER BY id_product ASC OFFSET 0 ROWS FETCH NEXT 6 ROWS ONLY
GO





/*** TRAE UN PRODUCTO  ***/

DROP PROCEDURE sp_get_product
CREATE PROCEDURE sp_get_product
@id_product INT
AS
	SELECT * FROM producto WHERE id_product = @id_product
GO

sp_get_product 1000003

select * from producto



/*** AGREGA UN PRODUCTO AL SISTEMA  ***/


DROP PROCEDURE sp_insert_product

CREATE PROCEDURE sp_insert_product
@category_id INT,
@name VARCHAR(255),
@brand_id INT,
@price INT,
@descrption VARCHAR(255),
@imagen VARCHAR(500)
AS
INSERT INTO producto(id_category, name_product, id_brand, price, pdto_description, arribal_date, imagen)
VALUES              (@category_id , @name, @brand_id, @price, @descrption, GETDATE(), @imagen);

GO

sp_insert_product 101, 'producto franela', 1, 30000  ,'detalle' ,'not_photo.jpg'

DROP TRIGGER Insert_Product_Stock 

CREATE TRIGGER Insert_Product_Stock 
on producto
for INSERT
AS 
BEGIN
DECLARE @id_producto INT;
SELECT @id_producto = id_product FROM inserted
INSERT INTO stocks_and_price(id_producto, stock, id_size)  VALUES ( @id_producto , 0 ,8)
END


select * from sizesProduct
SELECT * FROM producto
select * from stocks_and_price

/*


id_producto INT NOT NULL,
stock INT NOT NULL,
id_size INT NOT NULL,

*/





truncate table producto
select * from producto
select * from categoria
select * from marca
select * from sizesProduct

update producto set imagen = 'not_photo.jpg' where id_product = 1000003





select * from categoria

UPDATE categoria SET name_category = 'Chaquetas' WHERE id_category = 104


select * from categoria

select * from producto

sp_get_product 1000005




SELECT * FROM producto



/*** Modifica STOCK A UN UN PRODUCTO DEL SISTEMA  ***/
DROP PROCEDURE sp_edit_stock

CREATE PROCEDURE sp_edit_stock
AS
	
GO




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
GO












/*** AGREGA UN PRODUCTO A LA CANASTA ***/

DROP PROCEDURE sp_add_product_to_buy;


CREATE PROCEDURE sp_add_product_to_buy
@id_pdto INT
AS
/*CREAR PROCEDIMIENTO ALMACENADO 
	-- SESSION
	-- TENER UN TOKEN UNICO 
	-- DESCONTAR STOCK DE LA TABLA // DEVOLVER EL STOCK EN CASO NO SE HAGA LA COMPRA 
	-- ELIMINAR LISTA 
*/
	/*FOREACH*/
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
 @token VARCHAR(255) = 'user001'
AS
BEGIN

	SELECT * FROM lista_productos 
	INNER JOIN producto
	ON lista_productos.producto_id = producto.id_product
	WHERE token =  @token

END
GO

sp_product_to_buy








TRUNCATE TABLE lista_productos

select * from producto
select * from lista_productos


sp_add_product_to_buy 1000001
sp_add_product_to_buy 1000002
sp_add_product_to_buy 1000003
sp_add_product_to_buy 1000004


select * from lista_productos
sp_add_product_to_buy 1000005



	




	
sp_add_product_to_buy 1000002

select * from lista_productos

select * from categoria


/**Seleccionar comuna***/
DROP PROCEDURE sp_select_comuna

CREATE PROCEDURE sp_select_comuna
@in_region INT,
@in_provincia INT,
@in_comuna INT
AS
BEGIN

	SELECT region.id_region, nombre_region, provincia.id_provincia, nombre_provincia ,id_comuna, nombre_comuna FROM region 
	INNER JOIN provincia
	ON region.id_region = provincia.id_region
	INNER JOIN comuna
	ON provincia.id_provincia = comuna.id_provincia
	WHERE (region.id_region = @in_region or @in_region = 0) AND
	(provincia.id_provincia = @in_provincia or @in_provincia = 0) AND
	(comuna.id_comuna = @in_comuna  or @in_comuna  = 0)

END

sp_select_comuna 7,0,0

select * from region
select * from provincia
select * from provincia
select * from comuna

