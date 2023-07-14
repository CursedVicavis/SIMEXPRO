--*****Modo Transporte*****--
--Insert Modo de Transporte
INSERT INTO Adua.tbModoTransporte(motr_Descripcion,usua_UsuarioCreacion,motr_FechaCreacion)
VALUES	('Marítimo',1,'2023-07-14 08:48'),
		('Aéreo',1,'2023-07-14 08:48'),
		('Terrestre',1,'2023-07-14 08:48'),
		('Fluvial',1,'2023-07-14 08:48')

GO
--*****Vista*****--

CREATE OR ALTER VIEW Adua.VW_tbModoTransporte
AS
SELECT	modo.motr_Id, 
		modo.motr_Descripcion, 
		crea.usua_Nombre usua_UsuarioCreacion, 
		modo.motr_FechaCreacion, 
		modi.usua_Nombre usua_UsuarioModificacion, 
		modo.motr_FechaModificacion, 
		modo.motr_Estado
FROM Adua.tbModoTransporte modo INNER JOIN Acce.tbUsuarios crea 
ON crea.usua_Id = modo.usua_UsuarioCreacion		INNER JOIN  Acce.tbUsuarios modi 
ON modi.usua_Id = modo.usua_UsuarioModificacion 
GO
--*****Listado*****--
CREATE OR ALTER PROCEDURE Adua.UDP_tbModoTransporte_Listar
AS
BEGIN
SELECT * FROM Adua.VW_tbModoTransporte
WHERE motr_Estado = 1
END
GO
--*****Insertar*****--
CREATE OR ALTER PROCEDURE Adua.UDP_tbModoTransporte_Insertar
@motr_Descripcion		NVARCHAR(75),
@usua_UsuarioCreacion	INT,
@motr_FechaCreacion		DATETIME
AS
BEGIN
	BEGIN TRY 
		
		IF EXISTS (SELECT * FROM Adua.tbModoTransporte WHERE motr_Descripcion = @motr_Descripcion AND motr_Estado = 0)
			BEGIN
				UPDATE Adua.tbModoTransporte
				SET motr_Estado = 1,
				usua_UsuarioModificacion = @usua_UsuarioCreacion,
				motr_FechaModificacion = @motr_FechaCreacion
				WHERE motr_Descripcion = @motr_Descripcion
				SELECT 0
			END
		ELSE
			BEGIN
				INSERT INTO Adua.tbModoTransporte(motr_Descripcion,usua_UsuarioCreacion,motr_FechaCreacion)
				VALUES (
				@motr_Descripcion,
				@usua_UsuarioCreacion,
				@motr_FechaCreacion
				)
			END
		SELECT 1
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
--*****Editar*****--
CREATE OR ALTER PROCEDURE Adua.UDP_tbModoTransporte_Editar
@motr_Id					INT,
@motr_Descripcion			NVARCHAR(75),
@usua_UsuarioModificacion	INT,
@motr_FechaModificacion		DATETIME
AS
BEGIN
	BEGIN TRY 
		IF EXISTS (SELECT * FROM Adua.tbModoTransporte WHERE motr_Descripcion = @motr_Descripcion AND motr_Estado = 0)
			BEGIN
				UPDATE Adua.tbModoTransporte
				SET motr_Estado = 1,
					usua_UsuarioModificacion = @usua_UsuarioModificacion,
					motr_FechaModificacion = @motr_FechaModificacion
				WHERE motr_Descripcion = @motr_Descripcion
				SELECT 1
			END
		ELSE
			BEGIN
		UPDATE Adua.tbModoTransporte
		SET		motr_Descripcion = @motr_Descripcion,
				usua_UsuarioModificacion = @usua_UsuarioModificacion,
				motr_FechaModificacion = @motr_FechaModificacion
		WHERE	motr_Id = @motr_Id
		
		SELECT 1
			END
	END TRY 
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
--*****Eliminar*****--
CREATE OR ALTER PROCEDURE Adua.UDP_tbModoTransporte_Eliminar
@motr_Id					INT
AS
BEGIN
	BEGIN TRY
		UPDATE Adua.tbModoTransporte
		SET		motr_Estado = 0
		WHERE motr_Id = @motr_Id
		SELECT 1
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
--*****Tipos de documento*****--
--*****Vista*****--
CREATE OR ALTER VIEW Adua.VW_tbTipoDocumento
AS
SELECT	tido_Id, 
		tido_Descripcion, 
		crea.usua_Nombre usua_UsuarioCreacion, 
		tido_FechaCreacion, 
		modi.usua_Nombre usua_UsuarioModificacion, 
		tido_FechaModificacion, 
		tido_Estado 
FROM	Adua.tbTipoDocumento tido INNER JOIN Acce.tbUsuarios crea 
ON crea.usua_Id = tido.usua_UsuarioCreacion INNER JOIN  Acce.tbUsuarios modi 
ON modi.usua_Id = tido.usua_UsuarioModificacion
GO

--*****Listado*****--
CREATE OR ALTER PROCEDURE Adua.UDP_tbTipoDocumento_Listar
AS
BEGIN
SELECT * FROM Adua.VW_tbTipoDocumento
WHERE tido_Estado = 1
END
GO

--*****Insertar*****--
CREATE OR ALTER PROCEDURE Adua.UDP_tbTipoDocumento_Insertar
@tido_Id				CHAR(4),
@tido_Descripcion		NVARCHAR(50),
@usua_UsuarioCreacion	INT,
@tido_FechaCreacion			DATETIME
AS
BEGIN
	BEGIN TRY
	IF EXISTS (SELECT * FROM Adua.tbTipoDocumento WHERE tido_Descripcion = @tido_Descripcion OR tido_Id = @tido_Id AND tido_Estado = 0)
			BEGIN
				UPDATE Adua.tbTipoDocumento
				SET tido_Estado = 1,
				usua_UsuarioModificacion = @usua_UsuarioCreacion,
				tido_FechaModificacion = @tido_FechaCreacion
				WHERE @tido_Id = tido_Id
				SELECT 1
			END
		ELSE
			BEGIN
				INSERT INTO Adua.tbTipoDocumento (tido_Id,tido_Descripcion,usua_UsuarioCreacion,tido_FechaCreacion)
				VALUES (
				@tido_Id,
				@tido_Descripcion,
				@usua_UsuarioCreacion,
				@tido_FechaCreacion
				)
				SELECT 1
			END
	END TRY
	BEGIN CATCH
	SELECT 0
	END CATCH
END
GO

--*****Editar*****--
CREATE OR ALTER PROCEDURE Adua.UDP_tbTipoDocumento_Editar
@tido_Id					CHAR(4),
@tido_Descripcion			NVARCHAR(50),
@usua_UsuarioModificacion	INT,
@tido_FechaModificacion		DATETIME
AS
BEGIN
	BEGIN TRY
		IF EXISTS (SELECT * FROM Adua.tbTipoDocumento WHERE tido_Descripcion = @tido_Descripcion AND tido_Id = @tido_Id AND tido_Estado = 0)
			BEGIN
				UPDATE Adua.tbTipoDocumento
				SET tido_Estado = 1,
				usua_UsuarioModificacion = @usua_UsuarioModificacion,
				tido_FechaCreacion = @tido_FechaModificacion
				WHERE @tido_Id = tido_Id

				SELECT 1
			END
		ELSE
			BEGIN
				UPDATE Adua.tbTipoDocumento
				SET @tido_Descripcion = @tido_Descripcion,
				@usua_UsuarioModificacion = @usua_UsuarioModificacion,
				@tido_FechaModificacion = @tido_FechaModificacion
				WHERE tido_Id = @tido_Id

				SELECT 1
			END
	END TRY
BEGIN CATCH 
	SELECT 0
END CATCH
END
GO

--*****Eliminar*****--
CREATE OR ALTER PROCEDURE Adua.UDP_tbTipoDocumento_Eliminar
@tido_Id					CHAR(4)
AS
BEGIN
	BEGIN TRY
		UPDATE Adua.tbTipoDocumento
		SET tido_Estado = 0
		WHERE tido_Id = @tido_Id
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
--*****Tipos de Liquidacion*****--
--*****Vista*****--
CREATE OR ALTER VIEW Adua.VW_tbTipoLiquidacion
AS
SELECT	tipl_Id, 
		tipl_Descripcion, 
		crea.usua_Nombre usua_UsuarioCreacion, 
		tipl_FechaCreacion, 
		modi.usua_Nombre usua_UsuarioModificacion, 
		tipl_FechaModificacion, 
		tipl_Estado 
FROM	Adua.tbTipoLiquidacion tilin INNER JOIN Acce.tbUsuarios crea 
ON crea.usua_Id = tilin.usua_UsuarioCreacion INNER JOIN  Acce.tbUsuarios modi 
ON modi.usua_Id = tilin.usua_UsuarioModificacion
GO
--*****Listado*****--
CREATE OR ALTER PROCEDURE Adua.UDP_tbTipoLiquidacion_Listar
AS
BEGIN
SELECT * FROM Adua.VW_tbTipoLiquidacion
WHERE tipl_Estado = 1
END
GO

--*****Insertar*****--
CREATE OR ALTER PROCEDURE Adua.UDP_tbTipoLiquidacion_Insertar
@tipl_Descripcion		NVARCHAR(200),
@usua_UsuarioCreacion	INT,
@tipl_FechaCreacion		DATETIME
AS
BEGIN
		IF EXISTS (SELECT * FROM Adua.tbTipoLiquidacion WHERE tipl_Descripcion = @tipl_Descripcion AND tipl_Estado = 0)
			BEGIN
				UPDATE Adua.tbTipoLiquidacion
				SET tipl_Estado = 1,
				usua_UsuarioModificacion = @usua_UsuarioCreacion,
				tipl_FechaModificacion = @tipl_FechaCreacion
				WHERE tipl_Descripcion = @tipl_Descripcion

				SELECT 1
			END
		ELSE
			BEGIN
				INSERT INTO Adua.tbTipoLiquidacion (tipl_Descripcion,usua_UsuarioCreacion, tipl_FechaCreacion)
				VALUES (
				@tipl_Descripcion,		
				@usua_UsuarioCreacion,
				@tipl_FechaCreacion		
				)

				SELECT 1
			END
END
GO

--*****Editar*****--
CREATE OR ALTER PROCEDURE Adua.UDP_tbTipoLiquidacion_Editar
@tipl_Id					INT,
@tipl_Descripcion			NVARCHAR(200),
@usua_UsuarioModificacion	INT,
@tipl_FechaModificacion 	DATETIME
AS
BEGIN
	BEGIN TRY
		IF EXISTS (SELECT * FROM Adua.tbTipoLiquidacion WHERE tipl_Descripcion = @tipl_Descripcion AND tipl_Estado = 0)
			BEGIN
				UPDATE Adua.tbTipoLiquidacion
				SET tipl_Estado = 1,
				usua_UsuarioModificacion = @usua_UsuarioModificacion,
				tipl_FechaModificacion = @tipl_FechaModificacion
				WHERE tipl_Descripcion = @tipl_Descripcion

				SELECT 1
			END
		ELSE
			BEGIN
				UPDATE Adua.tbTipoLiquidacion
				SET tipl_Descripcion = @tipl_Descripcion,
				usua_UsuarioModificacion = @usua_UsuarioModificacion,
				tipl_FechaModificacion = @tipl_FechaModificacion
				WHERE tipl_Id = @tipl_Id
				SELECT 1
			END
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
--*****Eliminar*****--
CREATE OR ALTER PROCEDURE Adua.UDP_tbTipoLiquidacion_Eliminar
@tipl_Id					INT
AS
BEGIN
	BEGIN TRY
		UPDATE Adua.tbTipoLiquidacion
		SET tipl_Estado = 0
		WHERE tipl_Id = @tipl_Id
	END TRY
		BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
--*****Estado Boletin*****--
--*****Vista*****--
CREATE OR ALTER VIEW Adua.VW_tbEstadoBoletin
AS
SELECT	esbo_Id, 
		esbo_Descripcion, 
		crea.usua_Nombre usua_UsuarioCreacion, 
		esbo_FechaCreacion, 
		modi.usua_Nombre usua_UsuarioModificacion, 
		esbo_FechaModificacion, 
		esbo_Estadoo 
FROM Adua.tbEstadoBoletin esbo INNER JOIN Acce.tbUsuarios crea 
ON crea.usua_Id = esbo.usua_UsuarioCreacion INNER JOIN  Acce.tbUsuarios modi 
ON modi.usua_Id = esbo.usua_UsuarioModificacion
GO
--*****Listado*****--
CREATE OR ALTER PROCEDURE Adua.UDP_tbEstadoBoletin_Listar
AS
BEGIN
SELECT * FROM Adua.VW_tbEstadoBoletin
WHERE esbo_Estadoo = 1
END 
GO
--*****Insertar*****--
CREATE OR ALTER PROCEDURE Adua.UDP_tbEstadoBoletin_Insertar
@esbo_Descripcion		NVARCHAR(200),
@usua_UsuarioCreacion	INT,
@esbo_FechaCreacion		DATETIME
AS
BEGIN
	BEGIN TRY
		IF EXISTS (SELECT * FROM Adua.tbEstadoBoletin WHERE esbo_Descripcion = @esbo_Descripcion AND esbo_Estadoo = 0)
			BEGIN
				UPDATE Adua.tbEstadoBoletin 
				SET usua_UsuarioModificacion = @usua_UsuarioCreacion,
				esbo_FechaModificacion = @esbo_FechaCreacion
				WHERE esbo_Descripcion = @esbo_Descripcion
				SELECT 1
			END
		ELSE
			BEGIN 
				INSERT INTO Adua.tbEstadoBoletin(esbo_Descripcion,usua_UsuarioCreacion,esbo_FechaCreacion)
				VALUES (
				@esbo_Descripcion,		
				@usua_UsuarioCreacion,	
				@esbo_FechaCreacion					
				)
				SELECT 1
			END
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
--*****Editar*****--
CREATE OR ALTER PROCEDURE Adua.UDP_tbEstadoBoletin_Editar
@esbo_Id					NVARCHAR(200),
@esbo_Descripcion			INT,
@usua_UsuarioModificacion	INT,
@esbo_FechaModificacion		DATETIME
AS
BEGIN
	BEGIN TRY
		IF EXISTS(SELECT * FROM Adua.tbEstadoBoletin WHERE esbo_Descripcion = @esbo_Descripcion AND esbo_Id = @esbo_Id AND esbo_Estadoo = 0)
		BEGIN
			UPDATE Adua.tbEstadoBoletin
			SET esbo_Estadoo = 1,
			usua_UsuarioModificacion = @usua_UsuarioModificacion,
			esbo_FechaModificacion = @esbo_FechaModificacion
			WHERE esbo_Descripcion = @esbo_Descripcion
			SELECT 1
		END
		ELSE
			BEGIN
			UPDATE  Adua.tbEstadoBoletin
			SET esbo_Descripcion = @esbo_Descripcion,
			usua_UsuarioModificacion = @usua_UsuarioModificacion,
			esbo_FechaModificacion = @esbo_FechaModificacion
			WHERE esbo_Id = @esbo_Id
			SELECT 1
			END
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
--*****Eliminar*****--

CREATE OR ALTER PROCEDURE Adua.UDP_tbEstadoBoletin_Eliminar
@esbo_Id INT
AS
BEGIN
BEGIN TRY
	UPDATE Adua.tbEstadoBoletin
	SET esbo_Estadoo = 0
	WHERE esbo_Id = @esbo_Id
	SELECT 1
END TRY
BEGIN CATCH
	SELECT 0
END CATCH
END
GO

--*****Procesos*****--
--*****Vista*****--

CREATE OR ALTER VIEW Prod.VW_tbProceso
AS
SELECT	proc_Id, 
		proc_Descripcion, 
		crea.usua_Nombre usua_UsuarioCreacion, 
		proc_FechaCreacion, 
		modi.usua_Nombre usua_UsuarioModificacion, 
		proc_FechaModificacion, 
		proc_Estado 
FROM Prod.tbProcesos pro INNER JOIN Acce.tbUsuarios crea 
ON crea.usua_Id = pro.usua_UsuarioCreacion INNER JOIN  Acce.tbUsuarios modi 
ON modi.usua_Id = pro.usua_UsuarioModificacion 
GO
--*****Listado*****--
CREATE OR ALTER PROCEDURE Prod.UDP_tbProcesos_Listar
AS
BEGIN
SELECT * FROM Prod.VW_tbProceso 
WHERE proc_Estado = 1
END
GO

--*****Insertar*****--
CREATE OR ALTER PROCEDURE Prod.UDP_tbProcesos_Insertar
@proc_Descripcion		NVARCHAR(200),
@usua_UsuarioCreacion	INT,
@proc_FechaCreacion		DATETIME
AS
BEGIN
	BEGIN TRY
		IF EXISTS (SELECT * FROM Prod.tbProcesos WHERE proc_Descripcion = @proc_Descripcion AND proc_Estado = 0)
			BEGIN
				UPDATE Prod.tbProcesos
				SET proc_Estado = 1,
				usua_UsuarioModificacion = @usua_UsuarioCreacion,
				proc_FechaModificacion = @proc_FechaCreacion
				WHERE proc_Descripcion = @proc_Descripcion
				SELECT 1
			END
		ELSE
			BEGIN
				INSERT INTO Prod.tbProcesos(proc_Descripcion,usua_UsuarioCreacion,proc_FechaCreacion)
				VALUES (
				@proc_Descripcion,		
				@usua_UsuarioCreacion,	
				@proc_FechaCreacion
				)
				SELECT 1
			END
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO

--*****Editar*****--
CREATE OR ALTER PROCEDURE Prod.UDP_tbProcesos_Editar
@proc_ID				INT,
@proc_Descripcion		NVARCHAR(200),
@usua_UsuarioModificacion	INT,
@proc_FechaCreacion		DATETIME
AS
BEGIN
	BEGIN TRY
		IF EXISTS (SELECT * FROM Prod.tbProcesos WHERE proc_Descripcion = @proc_Descripcion AND proc_Estado = 0)
			BEGIN
				UPDATE Prod.tbProcesos
				SET proc_Estado = 1,
				usua_UsuarioModificacion = @usua_UsuarioModificacion,
				proc_FechaModificacion = @proc_FechaCreacion
				WHERE proc_Descripcion = @proc_Descripcion
				SELECT 1
			END
		ELSE
			BEGIN
				UPDATE Prod.tbProcesos
				SET proc_Descripcion = @proc_Descripcion,
				usua_UsuarioModificacion = @usua_UsuarioModificacion,
				proc_FechaModificacion = @proc_FechaCreacion
				WHERE proc_ID = @proc_ID
				SELECT 1
			END
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO

--*****Eliminar*****--
CREATE OR ALTER PROCEDURE Prod.UDP_tbProcesos_Eliminar
@proc_ID	INT
AS
BEGIN
	BEGIN TRY
		UPDATE Prod.tbProcesos
		SET proc_Estado = 0
		WHERE proc_ID = @proc_ID
	END TRY
	BEGIN CATCH 
		SELECT 0
	END CATCH
END
GO

--*****AREA*****--
--*****Vista*****--
CREATE OR ALTER VIEW Prod.VW_tbArea
AS
SELECT	tipa_Id, 
		tipa_area, 
		pro.proc_Id, 
		pro.proc_Descripcion,
		crea.usua_Nombre usua_UsuarioCreacion, 
		tipa_FechaCreacion, 
		modi.usua_Nombre usua_UsuarioModificacion , 
		tipa_FechaModificacion, 
		tipa_Estado 
FROM Prod.tbArea area INNER JOIN Prod.tbProcesos pro 
ON area.proc_Id = pro.proc_Id  INNER JOIN Acce.tbUsuarios crea 
ON crea.usua_Id = pro.usua_UsuarioCreacion INNER JOIN  Acce.tbUsuarios modi 
ON modi.usua_Id = pro.usua_UsuarioModificacion
GO

--*****Listado*****--
CREATE OR ALTER PROCEDURE Prod.UDP_tbArea_Listar
AS
BEGIN
	SELECT * FROM Prod.VW_tbArea
	WHERE tipa_Estado = 1
END
GO

--*****Insertar*****--
CREATE OR ALTER PROCEDURE Prod.UDP_tbArea_Insertar
@tipa_area				NVARCHAR(200),
@proc_Id				INT,
@usua_UsuarioCreacion	INT,
@tipa_FechaCreacion		DATETIME
AS
BEGIN
	BEGIN TRY
		IF EXISTS (SELECT * FROM Prod.tbArea WHERE tipa_area = @tipa_area AND proc_Id = @proc_Id)
			BEGIN 
				UPDATE Prod.tbArea
				SET tipa_Estado = 1,
				usua_UsuarioModificacion = @usua_UsuarioCreacion
				tipa_FechaModificacion = @tipa_FechaCreacion
				WHERE tipa_area = @tipa_area
				SELECT 1
			END
		ELSE
			BEGIN
				INSERT INTO Prod.tbArea(tipa_area,proc_Id,usua_UsuarioCreacion,tipa_FechaCreacion)
				VALUES (
				@tipa_area,				
				@proc_Id,				
				@usua_UsuarioCreacion,	
				@tipa_FechaCreacion				
				)
				SELECT 1
			END
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO

--*****Editar*****--

CREATE OR ALTER PROCEDURE Prod.UDP_tbArea_Editar
@tipa_Id					INT,
@tipa_area					NVARCHAR(200),
@proc_Id					INT,
@usua_UsuarioModificacion	INT,
@tipa_FechaModificacion		DATETIME
AS
BEGIN
	BEGIN TRY
		IF EXISTS (SELECT * FROM Prod.tbArea WHERE tipa_area = @tipa_area AND proc_Id = @proc_Id)
			BEGIN 
				UPDATE Prod.tbArea
				SET tipa_Estado = 1,
				usua_UsuarioModificacion = @usua_UsuarioModificacion,
				tipa_FechaModificacion = @tipa_FechaModificacion
				WHERE tipa_area = @tipa_area
				SELECT 1
			END
		ELSE
			BEGIN
				UPDATE Prod.tbArea
				SET tipa_area = @tipa_area,
				proc_Id = @proc_Id,
				usua_UsuarioModificacion = @usua_UsuarioModificacion,
				tipa_FechaModificacion = @tipa_FechaModificacion
				WHERE tipa_Id = @tipa_Id	
				SELECT 1
			END
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO

--*****Eliminar*****--
CREATE OR ALTER PROCEDURE Prod.UDP_tbArea_Eliminar
@tipa_Id					INT
AS
BEGIN
	BEGIN TRY
		UPDATE Prod.tbArea
		SET tipa_Estado = 0
		WHERE tipa_Id = @tipa_Id
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO