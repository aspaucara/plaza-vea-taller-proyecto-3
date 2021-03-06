USE [master]
GO
/****** Object:  Database [SGS_PlazaVea]    Script Date: 07/04/2016 09:25:02 p.m. ******/
CREATE DATABASE [SGS_PlazaVea]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SGS_PlazaVea', FILENAME = N'C:\SGS_PlazaVea_Proyecto\BD\Data\SGS_PlazaVea.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SGS_PlazaVea_log', FILENAME = N'C:\SGS_PlazaVea_Proyecto\BD\Data\SGS_PlazaVea_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SGS_PlazaVea] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SGS_PlazaVea].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SGS_PlazaVea] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SGS_PlazaVea] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SGS_PlazaVea] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SGS_PlazaVea] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SGS_PlazaVea] SET ARITHABORT OFF 
GO
ALTER DATABASE [SGS_PlazaVea] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SGS_PlazaVea] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [SGS_PlazaVea] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SGS_PlazaVea] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SGS_PlazaVea] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SGS_PlazaVea] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SGS_PlazaVea] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SGS_PlazaVea] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SGS_PlazaVea] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SGS_PlazaVea] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SGS_PlazaVea] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SGS_PlazaVea] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SGS_PlazaVea] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SGS_PlazaVea] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SGS_PlazaVea] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SGS_PlazaVea] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SGS_PlazaVea] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SGS_PlazaVea] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SGS_PlazaVea] SET RECOVERY FULL 
GO
ALTER DATABASE [SGS_PlazaVea] SET  MULTI_USER 
GO
ALTER DATABASE [SGS_PlazaVea] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SGS_PlazaVea] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SGS_PlazaVea] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SGS_PlazaVea] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SGS_PlazaVea', N'ON'
GO
USE [SGS_PlazaVea]
GO
/****** Object:  User [NT AUTHORITY\NETWORK SERVICE]    Script Date: 07/04/2016 09:25:02 p.m. ******/
CREATE USER [NT AUTHORITY\NETWORK SERVICE] FOR LOGIN [NT AUTHORITY\NETWORK SERVICE] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [NT AUTHORITY\LOCAL SERVICE]    Script Date: 07/04/2016 09:25:02 p.m. ******/
CREATE USER [NT AUTHORITY\LOCAL SERVICE] FOR LOGIN [NT AUTHORITY\LOCAL SERVICE] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [IIS AppPool\DefaultAppPool]    Script Date: 07/04/2016 09:25:02 p.m. ******/
CREATE USER [IIS AppPool\DefaultAppPool] FOR LOGIN [IIS AppPool\DefaultAppPool] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [IIS AppPool\Classic .NET AppPool]    Script Date: 07/04/2016 09:25:02 p.m. ******/
CREATE USER [IIS AppPool\Classic .NET AppPool] FOR LOGIN [IIS AppPool\Classic .NET AppPool] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [NT AUTHORITY\NETWORK SERVICE]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [NT AUTHORITY\NETWORK SERVICE]
GO
ALTER ROLE [db_datareader] ADD MEMBER [NT AUTHORITY\LOCAL SERVICE]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [NT AUTHORITY\LOCAL SERVICE]
GO
ALTER ROLE [db_datareader] ADD MEMBER [IIS AppPool\DefaultAppPool]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [IIS AppPool\DefaultAppPool]
GO
ALTER ROLE [db_datareader] ADD MEMBER [IIS AppPool\Classic .NET AppPool]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [IIS AppPool\Classic .NET AppPool]
GO
/****** Object:  Table [dbo].[SBTipoDoc]    Script Date: 07/04/2016 09:25:02 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SBTipoDoc](
	[TipDocCod] [smallint] NOT NULL,
	[TipDocDesc] [varchar](40) NOT NULL,
	[TipDocEst] [varchar](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TipDocCod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SBUbigeo]    Script Date: 07/04/2016 09:25:03 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SBUbigeo](
	[UbigeoDpto] [char](2) NOT NULL,
	[UbigeoProv] [char](2) NOT NULL,
	[UbigeoDto] [char](2) NOT NULL,
	[UbigeoDptoDesc] [varchar](100) NOT NULL,
	[UbigeoProvDesc] [varchar](100) NOT NULL,
	[UbigeoDtoDesc] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UbigeoDpto] ASC,
	[UbigeoProv] ASC,
	[UbigeoDto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SMConvocatoria]    Script Date: 07/04/2016 09:25:03 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SMConvocatoria](
	[ConvocatoriaCod] [smallint] NOT NULL,
	[ConvocatoriaNom] [smallint] NOT NULL,
	[ConvocatoriaFchIni] [smallint] NOT NULL,
	[ConvocatoriaFchFin] [smallint] NOT NULL,
	[ConvocatoriaEst] [varchar](3) NOT NULL,
	[ConvocatoriaFchLimCV] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ConvocatoriaCod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SMConvocatoriaSMListaDocumento]    Script Date: 07/04/2016 09:25:03 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SMConvocatoriaSMListaDocumento](
	[ConvocatoriaCod] [smallint] NOT NULL,
	[ListaDocCod] [smallint] NOT NULL,
	[ListaDocDesc] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[ConvocatoriaCod] ASC,
	[ListaDocCod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SMExamen]    Script Date: 07/04/2016 09:25:03 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SMExamen](
	[ExamenCod] [smallint] IDENTITY(1,1) NOT NULL,
	[ExamenNom] [varchar](200) NOT NULL,
	[ExamenDesc] [varchar](200) NULL,
	[ExamenEst] [varchar](3) NOT NULL,
	[ExamenTipo] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ExamenCod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SMExamenSMExamenPregunta]    Script Date: 07/04/2016 09:25:03 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SMExamenSMExamenPregunta](
	[ExamenCod] [smallint] NOT NULL,
	[PreguntaCod] [smallint] NOT NULL,
	[PreguntaDesc] [varchar](250) NOT NULL,
	[PreguntaTipo] [varchar](3) NOT NULL,
	[PreguntaEst] [varchar](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ExamenCod] ASC,
	[PreguntaCod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SMExamenSMExamenPreguntaPregun]    Script Date: 07/04/2016 09:25:03 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SMExamenSMExamenPreguntaPregun](
	[ExamenCod] [smallint] NOT NULL,
	[PreguntaCod] [smallint] NOT NULL,
	[AlternativoCod] [smallint] NOT NULL,
	[AlternativaDesc] [varchar](200) NOT NULL,
	[AlternativaCorrecta] [bit] NOT NULL,
	[AlternativaPuntaje] [smallint] NOT NULL,
	[AlternativaEst] [varchar](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ExamenCod] ASC,
	[PreguntaCod] ASC,
	[AlternativoCod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SMPersona]    Script Date: 07/04/2016 09:25:03 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SMPersona](
	[TipDocCod] [smallint] NOT NULL,
	[NroDoc] [varchar](20) NOT NULL,
	[PersonaNom] [varchar](25) NOT NULL,
	[PersonaApePat] [varchar](20) NOT NULL,
	[PersonaApeMat] [varchar](20) NOT NULL,
	[PersonaFchNac] [datetime] NOT NULL,
	[PersonaSexo] [char](1) NOT NULL,
	[PersonaDireccion] [varchar](200) NOT NULL,
	[PersonaTelefono] [varchar](20) NOT NULL,
	[PersonaCorreo] [varchar](100) NOT NULL,
	[UbigeoDpto] [char](2) NOT NULL,
	[UbigeoProv] [char](2) NOT NULL,
	[UbigeoDto] [char](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TipDocCod] ASC,
	[NroDoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SMPostulante]    Script Date: 07/04/2016 09:25:03 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SMPostulante](
	[PostulandoCod] [varchar](10) NOT NULL,
	[NroDoc] [varchar](20) NULL,
	[TipDocCod] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[PostulandoCod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SMPostulantePostulanteConvoca1]    Script Date: 07/04/2016 09:25:03 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SMPostulantePostulanteConvoca1](
	[PostulandoCod] [varchar](10) NOT NULL,
	[ConvocatoriaCod] [smallint] NOT NULL,
	[PosListaDocCod] [smallint] NOT NULL,
	[PosListaDocPorcentaje] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[PostulandoCod] ASC,
	[ConvocatoriaCod] ASC,
	[PosListaDocCod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SMPostulantePostulanteConvoca2]    Script Date: 07/04/2016 09:25:03 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SMPostulantePostulanteConvoca2](
	[PostulandoCod] [varchar](10) NOT NULL,
	[ConvocatoriaCod] [smallint] NOT NULL,
	[AlternativoCodRpta] [smallint] NOT NULL,
	[ExamenCod] [smallint] NOT NULL,
	[PreguntaCod] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PostulandoCod] ASC,
	[ConvocatoriaCod] ASC,
	[AlternativoCodRpta] ASC,
	[ExamenCod] ASC,
	[PreguntaCod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SMPostulantePostulanteConvocat]    Script Date: 07/04/2016 09:25:03 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SMPostulantePostulanteConvocat](
	[PostulandoCod] [varchar](10) NOT NULL,
	[ConvocatoriaCod] [smallint] NOT NULL,
	[PostulacionFch] [datetime] NULL,
	[PostulacionEst] [varchar](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[PostulandoCod] ASC,
	[ConvocatoriaCod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[SMExamen] ON 

GO
INSERT [dbo].[SMExamen] ([ExamenCod], [ExamenNom], [ExamenDesc], [ExamenEst], [ExamenTipo]) VALUES (1, N'Examen 1', N'Des 1
', N'ACT', 1)
GO
INSERT [dbo].[SMExamen] ([ExamenCod], [ExamenNom], [ExamenDesc], [ExamenEst], [ExamenTipo]) VALUES (2, N'aaa', N'bbb', N'ACT', 1)
GO
INSERT [dbo].[SMExamen] ([ExamenCod], [ExamenNom], [ExamenDesc], [ExamenEst], [ExamenTipo]) VALUES (3, N'Examen Psicotécnico Operario', N'Decripcion', N'ACT', 1)
GO
INSERT [dbo].[SMExamen] ([ExamenCod], [ExamenNom], [ExamenDesc], [ExamenEst], [ExamenTipo]) VALUES (4, N'Examen Psicotécnico Operario', N'Decripcion', N'ACT', 1)
GO
SET IDENTITY_INSERT [dbo].[SMExamen] OFF
GO
INSERT [dbo].[SMExamenSMExamenPregunta] ([ExamenCod], [PreguntaCod], [PreguntaDesc], [PreguntaTipo], [PreguntaEst]) VALUES (1, 1, N'pregunta 1', N'UOP', N'ACT')
GO
INSERT [dbo].[SMExamenSMExamenPregunta] ([ExamenCod], [PreguntaCod], [PreguntaDesc], [PreguntaTipo], [PreguntaEst]) VALUES (1, 2, N'preg 2', N'UOP', N'ACT')
GO
INSERT [dbo].[SMExamenSMExamenPregunta] ([ExamenCod], [PreguntaCod], [PreguntaDesc], [PreguntaTipo], [PreguntaEst]) VALUES (2, 1, N'xxx', N'1', N'1')
GO
INSERT [dbo].[SMExamenSMExamenPregunta] ([ExamenCod], [PreguntaCod], [PreguntaDesc], [PreguntaTipo], [PreguntaEst]) VALUES (3, 1, N'Cual es su hooby?', N'1', N'1')
GO
INSERT [dbo].[SMExamenSMExamenPregunta] ([ExamenCod], [PreguntaCod], [PreguntaDesc], [PreguntaTipo], [PreguntaEst]) VALUES (4, 1, N'Cual es su hooby?', N'1', N'1')
GO
INSERT [dbo].[SMExamenSMExamenPreguntaPregun] ([ExamenCod], [PreguntaCod], [AlternativoCod], [AlternativaDesc], [AlternativaCorrecta], [AlternativaPuntaje], [AlternativaEst]) VALUES (1, 1, 1, N'Alternativa 1', 1, 2, N'ACT')
GO
INSERT [dbo].[SMExamenSMExamenPreguntaPregun] ([ExamenCod], [PreguntaCod], [AlternativoCod], [AlternativaDesc], [AlternativaCorrecta], [AlternativaPuntaje], [AlternativaEst]) VALUES (2, 1, 1, N'Alternativa 1', 1, 2, N'ACT')
GO
INSERT [dbo].[SMExamenSMExamenPreguntaPregun] ([ExamenCod], [PreguntaCod], [AlternativoCod], [AlternativaDesc], [AlternativaCorrecta], [AlternativaPuntaje], [AlternativaEst]) VALUES (3, 1, 1, N'Ollanta', 1, 2, N'')
GO
INSERT [dbo].[SMExamenSMExamenPreguntaPregun] ([ExamenCod], [PreguntaCod], [AlternativoCod], [AlternativaDesc], [AlternativaCorrecta], [AlternativaPuntaje], [AlternativaEst]) VALUES (4, 1, 1, N'Ollanta', 1, 2, N'')
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [ISMPERSONA2]    Script Date: 07/04/2016 09:25:03 p.m. ******/
CREATE NONCLUSTERED INDEX [ISMPERSONA2] ON [dbo].[SMPersona]
(
	[UbigeoDpto] ASC,
	[UbigeoProv] ASC,
	[UbigeoDto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [ISMPOSTULANTE1]    Script Date: 07/04/2016 09:25:03 p.m. ******/
CREATE NONCLUSTERED INDEX [ISMPOSTULANTE1] ON [dbo].[SMPostulante]
(
	[TipDocCod] ASC,
	[NroDoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ISMPOSTULANTEPOSTULANTECONVOC4]    Script Date: 07/04/2016 09:25:03 p.m. ******/
CREATE NONCLUSTERED INDEX [ISMPOSTULANTEPOSTULANTECONVOC4] ON [dbo].[SMPostulantePostulanteConvoca1]
(
	[ConvocatoriaCod] ASC,
	[PosListaDocCod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ISMPOSTULANTEPOSTULANTECONVOC7]    Script Date: 07/04/2016 09:25:03 p.m. ******/
CREATE NONCLUSTERED INDEX [ISMPOSTULANTEPOSTULANTECONVOC7] ON [dbo].[SMPostulantePostulanteConvoca2]
(
	[ExamenCod] ASC,
	[PreguntaCod] ASC,
	[AlternativoCodRpta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ISMPOSTULANTEPOSTULANTECONVOC1]    Script Date: 07/04/2016 09:25:03 p.m. ******/
CREATE NONCLUSTERED INDEX [ISMPOSTULANTEPOSTULANTECONVOC1] ON [dbo].[SMPostulantePostulanteConvocat]
(
	[ConvocatoriaCod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMConvocatoriaSMListaDocumento]  WITH CHECK ADD  CONSTRAINT [ISMCONVOCATORIASMLISTADOCUMEN1] FOREIGN KEY([ConvocatoriaCod])
REFERENCES [dbo].[SMConvocatoria] ([ConvocatoriaCod])
GO
ALTER TABLE [dbo].[SMConvocatoriaSMListaDocumento] CHECK CONSTRAINT [ISMCONVOCATORIASMLISTADOCUMEN1]
GO
ALTER TABLE [dbo].[SMExamenSMExamenPregunta]  WITH CHECK ADD  CONSTRAINT [ISMEXAMENSMEXAMENPREGUNTA1] FOREIGN KEY([ExamenCod])
REFERENCES [dbo].[SMExamen] ([ExamenCod])
GO
ALTER TABLE [dbo].[SMExamenSMExamenPregunta] CHECK CONSTRAINT [ISMEXAMENSMEXAMENPREGUNTA1]
GO
ALTER TABLE [dbo].[SMExamenSMExamenPreguntaPregun]  WITH CHECK ADD  CONSTRAINT [ISMEXAMENSMEXAMENPREGUNTAPREG1] FOREIGN KEY([ExamenCod], [PreguntaCod])
REFERENCES [dbo].[SMExamenSMExamenPregunta] ([ExamenCod], [PreguntaCod])
GO
ALTER TABLE [dbo].[SMExamenSMExamenPreguntaPregun] CHECK CONSTRAINT [ISMEXAMENSMEXAMENPREGUNTAPREG1]
GO
ALTER TABLE [dbo].[SMPersona]  WITH CHECK ADD  CONSTRAINT [ISMPERSONA1] FOREIGN KEY([TipDocCod])
REFERENCES [dbo].[SBTipoDoc] ([TipDocCod])
GO
ALTER TABLE [dbo].[SMPersona] CHECK CONSTRAINT [ISMPERSONA1]
GO
ALTER TABLE [dbo].[SMPersona]  WITH CHECK ADD  CONSTRAINT [ISMPERSONA2] FOREIGN KEY([UbigeoDpto], [UbigeoProv], [UbigeoDto])
REFERENCES [dbo].[SBUbigeo] ([UbigeoDpto], [UbigeoProv], [UbigeoDto])
GO
ALTER TABLE [dbo].[SMPersona] CHECK CONSTRAINT [ISMPERSONA2]
GO
ALTER TABLE [dbo].[SMPostulante]  WITH CHECK ADD  CONSTRAINT [GX_0008000G] FOREIGN KEY([TipDocCod])
REFERENCES [dbo].[SBTipoDoc] ([TipDocCod])
GO
ALTER TABLE [dbo].[SMPostulante] CHECK CONSTRAINT [GX_0008000G]
GO
ALTER TABLE [dbo].[SMPostulante]  WITH CHECK ADD  CONSTRAINT [ISMPOSTULANTE1] FOREIGN KEY([TipDocCod], [NroDoc])
REFERENCES [dbo].[SMPersona] ([TipDocCod], [NroDoc])
GO
ALTER TABLE [dbo].[SMPostulante] CHECK CONSTRAINT [ISMPOSTULANTE1]
GO
ALTER TABLE [dbo].[SMPostulantePostulanteConvoca1]  WITH CHECK ADD  CONSTRAINT [ISMPOSTULANTEPOSTULANTECONVOC4] FOREIGN KEY([ConvocatoriaCod], [PosListaDocCod])
REFERENCES [dbo].[SMConvocatoriaSMListaDocumento] ([ConvocatoriaCod], [ListaDocCod])
GO
ALTER TABLE [dbo].[SMPostulantePostulanteConvoca1] CHECK CONSTRAINT [ISMPOSTULANTEPOSTULANTECONVOC4]
GO
ALTER TABLE [dbo].[SMPostulantePostulanteConvoca1]  WITH CHECK ADD  CONSTRAINT [ISMPOSTULANTEPOSTULANTECONVOC5] FOREIGN KEY([PostulandoCod], [ConvocatoriaCod])
REFERENCES [dbo].[SMPostulantePostulanteConvocat] ([PostulandoCod], [ConvocatoriaCod])
GO
ALTER TABLE [dbo].[SMPostulantePostulanteConvoca1] CHECK CONSTRAINT [ISMPOSTULANTEPOSTULANTECONVOC5]
GO
ALTER TABLE [dbo].[SMPostulantePostulanteConvoca2]  WITH CHECK ADD  CONSTRAINT [ISMPOSTULANTEPOSTULANTECONVOC7] FOREIGN KEY([ExamenCod], [PreguntaCod], [AlternativoCodRpta])
REFERENCES [dbo].[SMExamenSMExamenPreguntaPregun] ([ExamenCod], [PreguntaCod], [AlternativoCod])
GO
ALTER TABLE [dbo].[SMPostulantePostulanteConvoca2] CHECK CONSTRAINT [ISMPOSTULANTEPOSTULANTECONVOC7]
GO
ALTER TABLE [dbo].[SMPostulantePostulanteConvoca2]  WITH CHECK ADD  CONSTRAINT [ISMPOSTULANTEPOSTULANTECONVOC8] FOREIGN KEY([PostulandoCod], [ConvocatoriaCod])
REFERENCES [dbo].[SMPostulantePostulanteConvocat] ([PostulandoCod], [ConvocatoriaCod])
GO
ALTER TABLE [dbo].[SMPostulantePostulanteConvoca2] CHECK CONSTRAINT [ISMPOSTULANTEPOSTULANTECONVOC8]
GO
ALTER TABLE [dbo].[SMPostulantePostulanteConvocat]  WITH CHECK ADD  CONSTRAINT [ISMPOSTULANTEPOSTULANTECONVOC1] FOREIGN KEY([ConvocatoriaCod])
REFERENCES [dbo].[SMConvocatoria] ([ConvocatoriaCod])
GO
ALTER TABLE [dbo].[SMPostulantePostulanteConvocat] CHECK CONSTRAINT [ISMPOSTULANTEPOSTULANTECONVOC1]
GO
ALTER TABLE [dbo].[SMPostulantePostulanteConvocat]  WITH CHECK ADD  CONSTRAINT [ISMPOSTULANTEPOSTULANTECONVOC2] FOREIGN KEY([PostulandoCod])
REFERENCES [dbo].[SMPostulante] ([PostulandoCod])
GO
ALTER TABLE [dbo].[SMPostulantePostulanteConvocat] CHECK CONSTRAINT [ISMPOSTULANTEPOSTULANTECONVOC2]
GO
USE [master]
GO
ALTER DATABASE [SGS_PlazaVea] SET  READ_WRITE 
GO
