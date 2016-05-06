USE master
GO

IF EXISTS (SELECT * FROM SYSDATABASES WHERE NAME = 'GRH_PlazaVea')
	DROP DATABASE GRH_PlazaVea
GO
	
CREATE DATABASE GRH_PlazaVea
GO

USE GRH_PlazaVea
GO
/*
CREATE TABLE Contrato(
	InicioContrato DATE,
	FinContrato DATE,
	TiempoContrato VARCHAR(500),
	TipoContrato VARCHAR(500),
	FechaFirmaContrato DATE,
	SueldoBase DECIMAL(8,2),
	Estado VARCHAR(500)
)
GO

CREATE TABLE Sede(
	Nombre VARCHAR(500),
	Direccion VARCHAR(500)
)
GO

CREATE TABLE Turno(
	HoraInicio DATE,
	HoraFin DATE
)
GO

CREATE TABLE AreaTienda(
	Nombre VARCHAR(500),
	CapacidadColaboradores int
)
GO

CREATE TABLE Colaborador(
	ApellidoPaterno VARCHAR(500),
	ApellidoMaterno VARCHAR(500),
	Nombres VARCHAR(500),
	Dni VARCHAR(500),
	FechaNacimiento DATE,
	FechaAperturaFicha DATE,
	Sexo VARCHAR(500),
	Direccion VARCHAR(500),
	Telefono VARCHAR(500),
	CorreoPersonal VARCHAR(500),
	CorreoInstitucional VARCHAR(500),
	NroHijoMenores VARCHAR(500),
	EstadoCivil VARCHAR(500)
)
GO

CREATE TABLE Postulante(
	ApellidoPaterno VARCHAR(500),
	ApellidoMaterno VARCHAR(500),
	Nombres VARCHAR(500),
	Dni VARCHAR(500),
	Turno VARCHAR(500),
	FechaNacimiento DATE,
	Sexo VARCHAR(500),
	Direccion VARCHAR(500),
	Telefono VARCHAR(500),
	Correo VARCHAR(500)
)
GO

CREATE TABLE Convocatoria(
	NombreConvocatoria VARCHAR(500),
	FechaInicio DATE,
	FechaFin DATE,
	Estado VARCHAR(500),
	FechaMaxRecepcionCV VARCHAR(500),
	FechaPublicacionConvocatoria DATE,
	ListaDocumentosContrato VARCHAR(500)
)
GO

CREATE TABLE SolicitudPersonal(
	FechaSolicitud DATE,
	TipoSolicitud VARCHAR(500),
	Estado VARCHAR(500),
	FechaMaxAtenderse DATE
)
GO

CREATE TABLE Perfil(
	NombrePerfil VARCHAR(500),
	Descripcion VARCHAR(500),
	Sueldo DECIMAL(8,2)
)
GO

CREATE TABLE PerfilRequisito(
	Requisito VARCHAR(500)
)
GO

CREATE TABLE Examen(
	TipoExamen VARCHAR(500),
	Nombre VARCHAR(500)
)
GO

CREATE TABLE ExamenPregunta(
	Pregunta VARCHAR(500),
	TipoPregunta VARCHAR(500)
)
GO

CREATE TABLE PreguntaAlternativa(
	Alternativa VARCHAR(500),
	EsCorrecta  BIT,
	Puntaje INT DEFAULT 0
)
GO

CREATE TABLE PostulanteRespuesta(
	AlternativaRespuesta VARCHAR(500)
)
GO

CREATE TABLE ConvocatoriaPostulante(
	FechaPostulacion DATE,
	EstadoPostulante BIT
)
GO

CREATE TABLE SolicitudPerfil(
	CantidadSolicitada INT DEFAULT 1
)
GO

CREATE TABLE OrdenReclutamiento(
	Fecha DATE DEFAULT SYSDATETIME(),
	Estado VARCHAR(500),
	CantidadReclutar INT
)
GO

CREATE TABLE OrdenApoyo(
	FechaRegistro DATE DEFAULT SYSDATETIME(),
	Estado VARCHAR(500) DEFAULT 'Aprobado'
)
GO

CREATE TABLE ListaDocumento(
	Dni INT,
	PartidaMatrimonio INT,
	AntecedentesPenales INT,
	AntecedentesPoliciales INT
)
GO*/

/*
CREATE TABLE [dbo].[GRH_CONVOCATORIA](
	NCONVOCATORIACOD SMALLINT NOT NULL,
	CCONVOCATORIANOM VARCHAR(200) NOT NULL,
	DCONVOCATORIAFCHINI DATETIME NOT NULL,
	DCONVOCATORIAFCHFIN DATETIME NOT NULL,
	CCONVOCATORIAEST VARCHAR(200) NOT NULL,
	DCONVOCATORIAFCHLIMCV DATETIME NOT NULL
)
GO*/

--REVISAR 
/*
CREATE TABLE [dbo].[GRH_COLABORADOR](
	NCODCOLABORADOR INT NOT NULL,
	CAPELLIDOPATERNO VARCHAR(100) NOT NULL,
	CAPELLIDOMATERNO VARCHAR(100) NOT NULL,
	CNOMBRE VARCHAR(100) NOT NULL,
	CDNI VARCHAR(10) NOT NULL,
	DFECHANACIMIENTO DATE  NOT NULL,
	DFECHAAPERTURAFICHA DATE  NOT NULL,
	CSEXO VARCHAR(1)  NOT NULL,
	CDIRECCION VARCHAR(100) NOT NULL,
	CTELEFONO VARCHAR(20)  NOT NULL,
	CCORREOPERSONAL VARCHAR(100)  NOT NULL,
	CCORREOINSTITUCIONAL VARCHAR(100)  NOT NULL,
	CNROHIJOSMENORES VARCHAR(20) NOT NULL,
	CESTADOCIVIL VARCHAR(20) NOT NULL
)GO

CREATE TABLE [dbo].[GRH_POSTULANTE](
	NCODIGOPOSTULANTE INT NOT NULL,
	CAPELLIDOPATERNO VARCHAR(200) NOT NULL,
	CAPELLIDOMATERNO VARCHAR(200) NOT NULL,
	CNOMBRE VARCHAR(200) NOT NULL,
	CDNI VARCHAR(10) NOT NULL,
	CTURNO VARCHAR(50) NOT NULL,
	DFECHANACIMIENTO DATE NOT NULL,
	CSEXO VARCHAR(1) NOT NULL,
	CDIRECCION VARCHAR(200) NOT NULL,
	CTELEFONO VARCHAR(20) NOT NULL,
	CCORREO VARCHAR(200) NOT NULL
)*/

/*
CREATE TABLE [dbo].[GRH_POSTULANTERESPUESTA](
	NEXAMENCOD SMALLINT NOT NULL,
	NPREGUNTACOD SMALLINT NOT NULL,
	NALTERNATIVACOD SMALLINT NOT NULL,
	CALTERNATIVARESPUESTA VARCHAR(200) NOT NULL
)
GO*/



CREATE TABLE [dbo].[GRH_EXAMEN](
	NEXAMENCOD SMALLINT IDENTITY NOT NULL,
	CEXAMENNOM VARCHAR(200) NOT NULL,
	CEXAMENDESC VARCHAR(200) NOT NULL,
	CEXAMENEST VARCHAR(3) NOT NULL,
	NEXAMENTIPO SMALLINT NOT NULL,
	DEXAMENFCHCREACION DATE DEFAULT SYSDATETIME(),
	DEXAMENACTUALIZADO DATE
)
GO

CREATE TABLE [dbo].[GRH_EXAMENPREGUNTA](
	NEXAMENCOD SMALLINT NOT NULL,
	NPREGUNTACOD SMALLINT NOT NULL,
	CPREGUNTADES VARCHAR(250) NOT NULL,
	CPREGUNTATIPO VARCHAR(3) NOT NULL,
	CPREGUNTAEST VARCHAR(3) NOT NULL
)
GO

CREATE TABLE [dbo].[GRH_PREGUNTAALTERNATIVA](
	NEXAMENCOD SMALLINT NOT NULL,
	NPREGUNTACOD SMALLINT NOT NULL,
	NALTERNATIVACOD SMALLINT NOT NULL,
	CALTERNATIVADESC VARCHAR(250) NOT NULL,
	NALTERNATIVACORRECTA BIT NOT NULL,
	NALTERNATIVAPUNTAJE SMALLINT NOT NULL,
	CALTERNATIVAEST VARCHAR(3) NOT NULL
)
GO

/*
DROP TABLE GRH_PREGUNTAALTERNATIVA
DROP TABLE GRH_EXAMENPREGUNTA
DROP TABLE GRH_EXAMEN
*/

--PRIMARY KEYS
ALTER TABLE [dbo].[GRH_EXAMEN] ADD CONSTRAINT pk_GRH_EXAMEN_NEXAMENCOD PRIMARY KEY (NEXAMENCOD) 
WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO

ALTER TABLE [dbo].[GRH_EXAMENPREGUNTA] ADD CONSTRAINT pk_GRH_EXAMENPREGUNTA_NPREGUNTACOD PRIMARY KEY (NEXAMENCOD, NPREGUNTACOD) 
WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO

ALTER TABLE [dbo].[GRH_PREGUNTAALTERNATIVA] ADD CONSTRAINT pk_GRH_PREGUNTAALTERNATIVA_NALTERNATIVACOD PRIMARY KEY (NEXAMENCOD, NPREGUNTACOD, NALTERNATIVACOD)
WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO

--FOREIGN KEYS

ALTER TABLE [dbo].[GRH_EXAMENPREGUNTA] ADD FOREIGN KEY (NEXAMENCOD) REFERENCES [dbo].[GRH_EXAMEN](NEXAMENCOD)

ALTER TABLE [dbo].[GRH_PREGUNTAALTERNATIVA] ADD FOREIGN KEY (NEXAMENCOD, NPREGUNTACOD) REFERENCES [dbo].[GRH_EXAMENPREGUNTA](NEXAMENCOD, NPREGUNTACOD)


	--INGRESAR DATOS
	INSERT INTO GRH_EXAMEN (CEXAMENNOM, CEXAMENDESC, CEXAMENEST, NEXAMENTIPO) VALUES ('Examen Prueba 01','PRUEBA 01','ACT',1)
	INSERT INTO GRH_EXAMEN (CEXAMENNOM, CEXAMENDESC, CEXAMENEST, NEXAMENTIPO) VALUES ('Examen Prueba 02','PRUEBA 02','ACT',1)
	INSERT INTO GRH_EXAMEN (CEXAMENNOM, CEXAMENDESC, CEXAMENEST, NEXAMENTIPO) VALUES ('Examen Prueba 03','PRUEBA 03','ACT',1)
	INSERT INTO GRH_EXAMEN (CEXAMENNOM, CEXAMENDESC, CEXAMENEST, NEXAMENTIPO) VALUES ('Examen Prueba 04','PRUEBA 04','ACT',1)
	INSERT INTO GRH_EXAMEN (CEXAMENNOM, CEXAMENDESC, CEXAMENEST, NEXAMENTIPO) VALUES ('Examen Prueba 05','PRUEBA 05','ACT',1)
	
	INSERT INTO GRH_EXAMENPREGUNTA (NEXAMENCOD, NPREGUNTACOD, CPREGUNTADES, CPREGUNTATIPO, CPREGUNTAEST) VALUES (1, 1, 'PREGUNTA 1 MULTIPLES ALTERNATIVAS', 'MUL', 'ACT')
	INSERT INTO GRH_EXAMENPREGUNTA (NEXAMENCOD, NPREGUNTACOD, CPREGUNTADES, CPREGUNTATIPO, CPREGUNTAEST) VALUES (1, 2, 'PREGUNTA 2 UNICA ALTERNATIVA', 'UNI', 'ACT')
	INSERT INTO GRH_EXAMENPREGUNTA (NEXAMENCOD, NPREGUNTACOD, CPREGUNTADES, CPREGUNTATIPO, CPREGUNTAEST) VALUES (1, 3, 'PREGUNTA 3 UNICA ALTERNATIVA', 'UNI', 'ACT')
	INSERT INTO GRH_EXAMENPREGUNTA (NEXAMENCOD, NPREGUNTACOD, CPREGUNTADES, CPREGUNTATIPO, CPREGUNTAEST) VALUES (1, 4, 'PREGUNTA 4 MULTIPLES ALTERNATIVAS', 'MUL', 'ACT')
	
	INSERT INTO GRH_PREGUNTAALTERNATIVA (NEXAMENCOD, NPREGUNTACOD, NALTERNATIVACOD, CALTERNATIVADESC, NALTERNATIVACORRECTA, NALTERNATIVAPUNTAJE, CALTERNATIVAEST)
	VALUES (1, 1, 1, 'ALTERNATIVA MULTIPLE 1', 1, 20, 'ACT')
	INSERT INTO GRH_PREGUNTAALTERNATIVA (NEXAMENCOD, NPREGUNTACOD, NALTERNATIVACOD, CALTERNATIVADESC, NALTERNATIVACORRECTA, NALTERNATIVAPUNTAJE, CALTERNATIVAEST)
	VALUES (1, 1, 2, 'ALTERNATIVA MULTIPLE 2', 0, 0, 'ACT')
	INSERT INTO GRH_PREGUNTAALTERNATIVA (NEXAMENCOD, NPREGUNTACOD, NALTERNATIVACOD, CALTERNATIVADESC, NALTERNATIVACORRECTA, NALTERNATIVAPUNTAJE, CALTERNATIVAEST)
	VALUES (1, 1, 3, 'ALTERNATIVA MULTIPLE 3', 0, 0, 'ACT')
	
	INSERT INTO GRH_PREGUNTAALTERNATIVA (NEXAMENCOD, NPREGUNTACOD, NALTERNATIVACOD, CALTERNATIVADESC, NALTERNATIVACORRECTA, NALTERNATIVAPUNTAJE, CALTERNATIVAEST)
	VALUES (1, 2, 1, 'ALTERNATIVA UNICA 1', 1, 20, 'ACT')

	INSERT INTO GRH_PREGUNTAALTERNATIVA (NEXAMENCOD, NPREGUNTACOD, NALTERNATIVACOD, CALTERNATIVADESC, NALTERNATIVACORRECTA, NALTERNATIVAPUNTAJE, CALTERNATIVAEST)
	VALUES (1, 3, 1, 'ALTERNATIVA UNICA 1', 1, 20, 'ACT')
	
	INSERT INTO GRH_PREGUNTAALTERNATIVA (NEXAMENCOD, NPREGUNTACOD, NALTERNATIVACOD, CALTERNATIVADESC, NALTERNATIVACORRECTA, NALTERNATIVAPUNTAJE, CALTERNATIVAEST)
	VALUES (1, 4, 1, 'ALTERNATIVA MULTIPLE 1', 0, 0, 'ACT')
	INSERT INTO GRH_PREGUNTAALTERNATIVA (NEXAMENCOD, NPREGUNTACOD, NALTERNATIVACOD, CALTERNATIVADESC, NALTERNATIVACORRECTA, NALTERNATIVAPUNTAJE, CALTERNATIVAEST)
	VALUES (1, 4, 2, 'ALTERNATIVA MULTIPLE 2', 0, 0, 'ACT')
	INSERT INTO GRH_PREGUNTAALTERNATIVA (NEXAMENCOD, NPREGUNTACOD, NALTERNATIVACOD, CALTERNATIVADESC, NALTERNATIVACORRECTA, NALTERNATIVAPUNTAJE, CALTERNATIVAEST)
	VALUES (1, 4, 3, 'ALTERNATIVA MULTIPLE 3', 1, 20, 'ACT')
	
	
	SELECT NALTERNATIVACOD, CALTERNATIVADESC, NALTERNATIVACORRECTA, NALTERNATIVAPUNTAJE FROM GRH_PREGUNTAALTERNATIVA
	WHERE NEXAMENCOD = 2

	SELECT NEXAMENCOD, NPREGUNTACOD, CPREGUNTADES, CPREGUNTATIPO, CPREGUNTAEST FROM GRH_EXAMENPREGUNTA
	WHERE NEXAMENCOD = 2

	SELECT ISNULL(MAX(NPREGUNTACOD), 0) + 1 FROM GRH_EXAMENPREGUNTA
	WHERE NEXAMENCOD = 1

	SELECT ISNULL(MAX(NALTERNATIVACOD),0) + 1 FROM GRH_PREGUNTAALTERNATIVA
	WHERE NEXAMENCOD = 2 AND NPREGUNTACOD = 1


	SELECT NEXAMENCOD, CEXAMENNOM, CEXAMENDESC, CEXAMENEST, NEXAMENTIPO FROM GRH_EXAMEN
	
	UPDATE GRH_EXAMEN SET CEXAMENEST = 'ACT'
	
/*
CREATE FUNCTION fn_ExamenExiste (
	@ExamenCod SMALLINT
) RETURNS BOOLEAN
AS
BEGIN
DECLARE @@NroExa INT
	SELECT @@NroExa = COUNT(*) FROM GRH_EXAMEN
	WHERE NEXAMENCOD = @ExamenCod
	IF(@@NroExa = 0)
		NULL
	ELSE
		NULL
END*/


--Procedimientos Almacenados
GO
CREATE PROCEDURE sp_AgregarExamen
	@ExamenNom VARCHAR(200),
	@ExamenDesc VARCHAR(200),
	@ExamenTipo SMALLINT
AS
BEGIN
	INSERT INTO GRH_EXAMEN (CEXAMENNOM, CEXAMENDESC, CEXAMENEST, NEXAMENTIPO) VALUES (@ExamenNom, @ExamenDesc,'ACT',@ExamenTipo)
	SELECT MAX(NEXAMENCOD) FROM GRH_EXAMEN
END
GO




UPDATE GRH_EXAMEN SET CEXAMENEST = 'ACT'
WHERE NEXAMENCOD = 5
UPDATE GRH_EXAMENPREGUNTA SET CPREGUNTAEST = 'ACT'
WHERE NEXAMENCOD = 1


SELECT * FROM GRH_EXAMEN
	