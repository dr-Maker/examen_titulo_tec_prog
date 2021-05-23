use db_tienda_virtual;

/******Procedimientos almacenados******/

/***REGIESTO RE USUARIO - INSERTA UN NUEVO USUARIO***/
/****************************************************/
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
	SELECT id as id_user, first_name as nombre, second_name as nombre_dos, father_lastname as apellido_pat, mother_lastname as apellido_mat, username, email, user_role as rol, '*********' as pass FROM usuario WHERE  username = @username   AND pass = CONVERT(varchar(255),HASHBYTES('MD5',@pass),2)  ; 
	
GO

sp_validate_user  d_maker , 12345
select * from usuario


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


SELECT * from sizesProduct
SELECT * from tipo_talla