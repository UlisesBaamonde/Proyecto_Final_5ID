USE [master]
GO
/****** Object:  Database [ProyectoFinalNewLife]    Script Date: 10/7/2023 11:55:34 ******/
CREATE DATABASE [ProyectoFinalNewLife]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProyectoFinalNewLife', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ProyectoFinalNewLife.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProyectoFinalNewLife_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ProyectoFinalNewLife_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ProyectoFinalNewLife] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProyectoFinalNewLife].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProyectoFinalNewLife] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProyectoFinalNewLife] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProyectoFinalNewLife] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProyectoFinalNewLife] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProyectoFinalNewLife] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProyectoFinalNewLife] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProyectoFinalNewLife] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProyectoFinalNewLife] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProyectoFinalNewLife] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProyectoFinalNewLife] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProyectoFinalNewLife] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProyectoFinalNewLife] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProyectoFinalNewLife] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProyectoFinalNewLife] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProyectoFinalNewLife] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProyectoFinalNewLife] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProyectoFinalNewLife] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProyectoFinalNewLife] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProyectoFinalNewLife] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProyectoFinalNewLife] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProyectoFinalNewLife] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProyectoFinalNewLife] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProyectoFinalNewLife] SET RECOVERY FULL 
GO
ALTER DATABASE [ProyectoFinalNewLife] SET  MULTI_USER 
GO
ALTER DATABASE [ProyectoFinalNewLife] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProyectoFinalNewLife] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProyectoFinalNewLife] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProyectoFinalNewLife] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProyectoFinalNewLife] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ProyectoFinalNewLife', N'ON'
GO
ALTER DATABASE [ProyectoFinalNewLife] SET QUERY_STORE = OFF
GO
USE [ProyectoFinalNewLife]
GO
/****** Object:  User [Ulises]    Script Date: 10/7/2023 11:55:34 ******/
CREATE USER [Ulises] FOR LOGIN [Ulises] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Cliente]    Script Date: 10/7/2023 11:55:34 ******/
CREATE USER [Cliente] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [alumno]    Script Date: 10/7/2023 11:55:34 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Ulises]
GO
ALTER ROLE [db_owner] ADD MEMBER [Cliente]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 10/7/2023 11:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Contraseña] [varchar](100) NOT NULL,
	[Dni] [int] NOT NULL,
	[FotoPerfil] [varchar](max) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Documento]    Script Date: 10/7/2023 11:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Archivo] [varchar](max) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[IdTramite] [int] NOT NULL,
	[RutaArchivo] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Documento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Etiqueta]    Script Date: 10/7/2023 11:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Etiqueta](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Etiqueta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gestor]    Script Date: 10/7/2023 11:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gestor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripción] [varchar](max) NOT NULL,
	[Dni] [int] NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Contraseña] [varchar](100) NOT NULL,
	[FotoPerfil] [varchar](max) NULL,
 CONSTRAINT [PK_Gestor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Peticion]    Script Date: 10/7/2023 11:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Peticion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdGestor] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Peticion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resena]    Script Date: 10/7/2023 11:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resena](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdGestor] [int] NOT NULL,
	[CantEstrellas] [int] NOT NULL,
	[Texto] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Reseña] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDeTramite]    Script Date: 10/7/2023 11:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDeTramite](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
 CONSTRAINT [PK_TipoDeTramite] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tramite]    Script Date: 10/7/2023 11:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tramite](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdGestor] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdPais] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripción] [varchar](max) NOT NULL,
	[IdTipoTramite] [int] NOT NULL,
 CONSTRAINT [PK_Tramite] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TramiteXEtiqueta]    Script Date: 10/7/2023 11:55:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TramiteXEtiqueta](
	[IdTramite] [int] NOT NULL,
	[IdEtiqueta] [int] NOT NULL,
	[Observaciones] [varchar](max) NOT NULL,
	[FechaActualizacion] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([Id], [Nombre], [Email], [Contraseña], [Dni], [FotoPerfil]) VALUES (3, N'Rodrigo', N'ulibaamonde@gmail.com', N'daleboca2018', 45443545, N'https://www.labsaenzrenauld.com/wp-content/uploads/2020/10/Perfil-hombre-ba%CC%81sico_738242395.jpg')
INSERT [dbo].[Cliente] ([Id], [Nombre], [Email], [Contraseña], [Dni], [FotoPerfil]) VALUES (4, N'Daniel', N'ulibaamonde@gmail.com', N'daleboca2018', 45960404, N'foto.png')
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[Documento] ON 

INSERT [dbo].[Documento] ([Id], [Archivo], [Nombre], [IdTramite], [RutaArchivo]) VALUES (1, N'dni.png', N'DNI', 1, N'.../files/documents/dni.png')
INSERT [dbo].[Documento] ([Id], [Archivo], [Nombre], [IdTramite], [RutaArchivo]) VALUES (2, N'pasaporte.jpeg', N'Pasaporte', 1, N'.../files/documents/pasaporte.jpeg')
SET IDENTITY_INSERT [dbo].[Documento] OFF
GO
SET IDENTITY_INSERT [dbo].[Etiqueta] ON 

INSERT [dbo].[Etiqueta] ([Id], [Nombre]) VALUES (1, N'En proceso')
INSERT [dbo].[Etiqueta] ([Id], [Nombre]) VALUES (3, N'Recien enviados los documentos')
SET IDENTITY_INSERT [dbo].[Etiqueta] OFF
GO
SET IDENTITY_INSERT [dbo].[Gestor] ON 

INSERT [dbo].[Gestor] ([Id], [Nombre], [Descripción], [Dni], [Email], [Contraseña], [FotoPerfil]) VALUES (1, N'Jose', N'Gestor con 30 años de experiencia en el ambiente laboral. Especialista en las ciudadanías portuguesa, italiana. polaca, y española. Poseo contactos en las embajadas y consulados de estos países. Aviso todos los detalles del tramite.', 84350249, N'jsadjkajds@gmail.com', N'qwiepofjnmnfsd', N'https://blogs.imf-formacion.com/blog/prevencion-riesgos-laborales/wp-content/uploads/2019/05/perfil-gestor-sistemas-calidad.jpg')
INSERT [dbo].[Gestor] ([Id], [Nombre], [Descripción], [Dni], [Email], [Contraseña], [FotoPerfil]) VALUES (2, N'Julian', N'sadasdasda', 45452343, N'jsadjkajds@gmail.com', N'qwiepofjnmnfsd', NULL)
SET IDENTITY_INSERT [dbo].[Gestor] OFF
GO
SET IDENTITY_INSERT [dbo].[Resena] ON 

INSERT [dbo].[Resena] ([Id], [IdCliente], [IdGestor], [CantEstrellas], [Texto]) VALUES (2, 3, 1, 4, N'sjkjsadkjaskdjskadkasjdkjasdkjasdkjaskjaksjd')
SET IDENTITY_INSERT [dbo].[Resena] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoDeTramite] ON 

INSERT [dbo].[TipoDeTramite] ([Id], [Descripcion]) VALUES (1, N'Ciudadania')
SET IDENTITY_INSERT [dbo].[TipoDeTramite] OFF
GO
SET IDENTITY_INSERT [dbo].[Tramite] ON 

INSERT [dbo].[Tramite] ([Id], [IdGestor], [IdCliente], [IdPais], [Nombre], [Descripción], [IdTipoTramite]) VALUES (1, 1, 3, 34, N'Ciudadania española', N'sdfskdfjskdjfksd', 1)
INSERT [dbo].[Tramite] ([Id], [IdGestor], [IdCliente], [IdPais], [Nombre], [Descripción], [IdTipoTramite]) VALUES (4, 2, 4, 54, N'asfdadsadas', N'xcvxcvxcvxvc', 1)
INSERT [dbo].[Tramite] ([Id], [IdGestor], [IdCliente], [IdPais], [Nombre], [Descripción], [IdTipoTramite]) VALUES (5, 1, 3, 35, N'sdfksdofsofd', N'sdfskfjksdfjksdjfksdjfskdfj', 1)
INSERT [dbo].[Tramite] ([Id], [IdGestor], [IdCliente], [IdPais], [Nombre], [Descripción], [IdTipoTramite]) VALUES (6, 1, 3, 56, N'saasdasdasdd', N'cxskdanasdansd', 1)
INSERT [dbo].[Tramite] ([Id], [IdGestor], [IdCliente], [IdPais], [Nombre], [Descripción], [IdTipoTramite]) VALUES (7, 1, 4, 45, N'sadasdasdas', N'vcxcvxcv', 1)
SET IDENTITY_INSERT [dbo].[Tramite] OFF
GO
INSERT [dbo].[TramiteXEtiqueta] ([IdTramite], [IdEtiqueta], [Observaciones], [FechaActualizacion]) VALUES (1, 1, N'Los documentos ya fueron mandados a la Aduana para su comprobasion', CAST(N'2023-06-05T00:00:00.000' AS DateTime))
INSERT [dbo].[TramiteXEtiqueta] ([IdTramite], [IdEtiqueta], [Observaciones], [FechaActualizacion]) VALUES (5, 1, N'asdashjdaksdsasad', CAST(N'2023-06-05T00:00:00.000' AS DateTime))
INSERT [dbo].[TramiteXEtiqueta] ([IdTramite], [IdEtiqueta], [Observaciones], [FechaActualizacion]) VALUES (6, 1, N'sadjaksdjaksjdasd', CAST(N'2023-06-05T00:00:00.000' AS DateTime))
INSERT [dbo].[TramiteXEtiqueta] ([IdTramite], [IdEtiqueta], [Observaciones], [FechaActualizacion]) VALUES (7, 1, N'sdifhsjdfhjsdfhjsdf', CAST(N'2023-07-10T00:00:00.000' AS DateTime))
GO
ALTER TABLE [dbo].[Documento]  WITH CHECK ADD  CONSTRAINT [FK_Documento_Tramite] FOREIGN KEY([IdTramite])
REFERENCES [dbo].[Tramite] ([Id])
GO
ALTER TABLE [dbo].[Documento] CHECK CONSTRAINT [FK_Documento_Tramite]
GO
ALTER TABLE [dbo].[Peticion]  WITH CHECK ADD  CONSTRAINT [FK_Peticion_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([Id])
GO
ALTER TABLE [dbo].[Peticion] CHECK CONSTRAINT [FK_Peticion_Cliente]
GO
ALTER TABLE [dbo].[Peticion]  WITH CHECK ADD  CONSTRAINT [FK_Peticion_Gestor] FOREIGN KEY([IdGestor])
REFERENCES [dbo].[Gestor] ([Id])
GO
ALTER TABLE [dbo].[Peticion] CHECK CONSTRAINT [FK_Peticion_Gestor]
GO
ALTER TABLE [dbo].[Resena]  WITH CHECK ADD  CONSTRAINT [FK_Reseña_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([Id])
GO
ALTER TABLE [dbo].[Resena] CHECK CONSTRAINT [FK_Reseña_Cliente]
GO
ALTER TABLE [dbo].[Resena]  WITH CHECK ADD  CONSTRAINT [FK_Reseña_Gestor] FOREIGN KEY([IdGestor])
REFERENCES [dbo].[Gestor] ([Id])
GO
ALTER TABLE [dbo].[Resena] CHECK CONSTRAINT [FK_Reseña_Gestor]
GO
ALTER TABLE [dbo].[Tramite]  WITH CHECK ADD  CONSTRAINT [FK_Tramite_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([Id])
GO
ALTER TABLE [dbo].[Tramite] CHECK CONSTRAINT [FK_Tramite_Cliente]
GO
ALTER TABLE [dbo].[Tramite]  WITH CHECK ADD  CONSTRAINT [FK_Tramite_Gestor] FOREIGN KEY([IdGestor])
REFERENCES [dbo].[Gestor] ([Id])
GO
ALTER TABLE [dbo].[Tramite] CHECK CONSTRAINT [FK_Tramite_Gestor]
GO
ALTER TABLE [dbo].[Tramite]  WITH CHECK ADD  CONSTRAINT [FK_Tramite_TipoDeTramite] FOREIGN KEY([IdTipoTramite])
REFERENCES [dbo].[TipoDeTramite] ([Id])
GO
ALTER TABLE [dbo].[Tramite] CHECK CONSTRAINT [FK_Tramite_TipoDeTramite]
GO
ALTER TABLE [dbo].[TramiteXEtiqueta]  WITH CHECK ADD  CONSTRAINT [FK_TramiteXEtiqueta_Etiqueta] FOREIGN KEY([IdEtiqueta])
REFERENCES [dbo].[Etiqueta] ([Id])
GO
ALTER TABLE [dbo].[TramiteXEtiqueta] CHECK CONSTRAINT [FK_TramiteXEtiqueta_Etiqueta]
GO
ALTER TABLE [dbo].[TramiteXEtiqueta]  WITH CHECK ADD  CONSTRAINT [FK_TramiteXEtiqueta_Tramite] FOREIGN KEY([IdTramite])
REFERENCES [dbo].[Tramite] ([Id])
GO
ALTER TABLE [dbo].[TramiteXEtiqueta] CHECK CONSTRAINT [FK_TramiteXEtiqueta_Tramite]
GO
USE [master]
GO
ALTER DATABASE [ProyectoFinalNewLife] SET  READ_WRITE 
GO
