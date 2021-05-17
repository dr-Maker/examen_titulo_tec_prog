use db_tienda_virtual;

/***REGIESTO CATEGORIA***/
/****************************************************/

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

/*** EDITA CATEGORIAS EXISTENTES ***/
DROP PROCEDURE sp_edit_category
CREATE PROCEDURE sp_edit_category
@id_category INT,
@category VARCHAR(255)
AS
	UPDATE categoria SET name_category = @category WHERE id_category = @id_category 
GO


/*** ELIMINA CATEGORIAS EXISTENTES ***/
DROP PROCEDURE sp_deleted_category
CREATE PROCEDURE sp_deleted_category
@id_category INT
AS
	DELETE FROM categoria WHERE id_category = @id_category
	
GO

sp_deleted_category 101
