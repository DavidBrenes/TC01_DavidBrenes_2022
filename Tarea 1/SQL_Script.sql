USE [Tarea01]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tel]') AND type in (N'U'))
ALTER TABLE [dbo].[tel] DROP CONSTRAINT IF EXISTS [FK_tel_Empleado]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Error]') AND type in (N'U'))
ALTER TABLE [dbo].[Error] DROP CONSTRAINT IF EXISTS [FK_Error_Proyecto_Correcccion]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Error]') AND type in (N'U'))
ALTER TABLE [dbo].[Error] DROP CONSTRAINT IF EXISTS [FK_Error_Impacto]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Error]') AND type in (N'U'))
ALTER TABLE [dbo].[Error] DROP CONSTRAINT IF EXISTS [FK_Error_App_Servidor]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Empleado_Proyecto]') AND type in (N'U'))
ALTER TABLE [dbo].[Empleado_Proyecto] DROP CONSTRAINT IF EXISTS [FK_Empleado_Proyecto_Proyecto_Correcccion]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Empleado_Proyecto]') AND type in (N'U'))
ALTER TABLE [dbo].[Empleado_Proyecto] DROP CONSTRAINT IF EXISTS [FK_Empleado_Proyecto_Employee_Role]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Empleado_Proyecto]') AND type in (N'U'))
ALTER TABLE [dbo].[Empleado_Proyecto] DROP CONSTRAINT IF EXISTS [FK_Empleado_Proyecto_Empleado]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Empleado]') AND type in (N'U'))
ALTER TABLE [dbo].[Empleado] DROP CONSTRAINT IF EXISTS [FK_Empleado_Departamento]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[email]') AND type in (N'U'))
ALTER TABLE [dbo].[email] DROP CONSTRAINT IF EXISTS [FK_email_Empleado]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Departamento]') AND type in (N'U'))
ALTER TABLE [dbo].[Departamento] DROP CONSTRAINT IF EXISTS [FK_Departamento_Empleado]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[App_Servidor]') AND type in (N'U'))
ALTER TABLE [dbo].[App_Servidor] DROP CONSTRAINT IF EXISTS [FK_App_Servidor_Servidor]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[App_Servidor]') AND type in (N'U'))
ALTER TABLE [dbo].[App_Servidor] DROP CONSTRAINT IF EXISTS [FK_App_Servidor_Server_Role]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[App_Servidor]') AND type in (N'U'))
ALTER TABLE [dbo].[App_Servidor] DROP CONSTRAINT IF EXISTS [FK_App_Servidor_App]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[App]') AND type in (N'U'))
ALTER TABLE [dbo].[App] DROP CONSTRAINT IF EXISTS [FK_App_Departamento]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[App]') AND type in (N'U'))
ALTER TABLE [dbo].[App] DROP CONSTRAINT IF EXISTS [FK_App_App_Type]
GO
/****** Object:  Table [dbo].[tel]    Script Date: 4/9/2022 23:01:49 ******/
DROP TABLE IF EXISTS [dbo].[tel]
GO
/****** Object:  Table [dbo].[Servidor]    Script Date: 4/9/2022 23:01:49 ******/
DROP TABLE IF EXISTS [dbo].[Servidor]
GO
/****** Object:  Table [dbo].[Server_Role]    Script Date: 4/9/2022 23:01:49 ******/
DROP TABLE IF EXISTS [dbo].[Server_Role]
GO
/****** Object:  Table [dbo].[Proyecto_Correcccion]    Script Date: 4/9/2022 23:01:49 ******/
DROP TABLE IF EXISTS [dbo].[Proyecto_Correcccion]
GO
/****** Object:  Table [dbo].[Impacto]    Script Date: 4/9/2022 23:01:49 ******/
DROP TABLE IF EXISTS [dbo].[Impacto]
GO
/****** Object:  Table [dbo].[Error]    Script Date: 4/9/2022 23:01:49 ******/
DROP TABLE IF EXISTS [dbo].[Error]
GO
/****** Object:  Table [dbo].[Employee_Role]    Script Date: 4/9/2022 23:01:49 ******/
DROP TABLE IF EXISTS [dbo].[Employee_Role]
GO
/****** Object:  Table [dbo].[Empleado_Proyecto]    Script Date: 4/9/2022 23:01:49 ******/
DROP TABLE IF EXISTS [dbo].[Empleado_Proyecto]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 4/9/2022 23:01:49 ******/
DROP TABLE IF EXISTS [dbo].[Empleado]
GO
/****** Object:  Table [dbo].[email]    Script Date: 4/9/2022 23:01:49 ******/
DROP TABLE IF EXISTS [dbo].[email]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 4/9/2022 23:01:49 ******/
DROP TABLE IF EXISTS [dbo].[Departamento]
GO
/****** Object:  Table [dbo].[App_Type]    Script Date: 4/9/2022 23:01:49 ******/
DROP TABLE IF EXISTS [dbo].[App_Type]
GO
/****** Object:  Table [dbo].[App_Servidor]    Script Date: 4/9/2022 23:01:49 ******/
DROP TABLE IF EXISTS [dbo].[App_Servidor]
GO
/****** Object:  Table [dbo].[App]    Script Date: 4/9/2022 23:01:49 ******/
DROP TABLE IF EXISTS [dbo].[App]
GO
/****** Object:  Table [dbo].[App]    Script Date: 4/9/2022 23:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[App](
	[codigo] [varchar](50) NOT NULL,
	[nombre] [varchar](80) NOT NULL,
	[num_Patente] [varchar](50) NOT NULL,
	[descripcion] [varchar](300) NULL,
	[fecha_Prod] [date] NULL,
	[fecha_exp_lic] [date] NOT NULL,
	[id_type] [int] NOT NULL,
	[codigo_departamento] [varchar](50) NOT NULL,
 CONSTRAINT [PK_App] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[App_Servidor]    Script Date: 4/9/2022 23:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[App_Servidor](
	[cod_App] [varchar](50) NOT NULL,
	[numSerie_Servidor] [varchar](50) NOT NULL,
	[rol_servidor] [int] NULL,
 CONSTRAINT [PK_App_Servidor] PRIMARY KEY CLUSTERED 
(
	[cod_App] ASC,
	[numSerie_Servidor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[App_Type]    Script Date: 4/9/2022 23:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[App_Type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_App_Type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 4/9/2022 23:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[codigo] [varchar](50) NOT NULL,
	[nombre] [varchar](80) NOT NULL,
	[id_empleado_dirige] [int] NULL,
 CONSTRAINT [PK_Departamento] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[email]    Script Date: 4/9/2022 23:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[email](
	[id_empleado] [int] NOT NULL,
	[email] [varchar](80) NOT NULL,
 CONSTRAINT [PK_email] PRIMARY KEY CLUSTERED 
(
	[id_empleado] ASC,
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 4/9/2022 23:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[id] [int] NOT NULL,
	[nombre1] [varchar](30) NOT NULL,
	[nombre2] [varchar](30) NULL,
	[apellido1] [varchar](30) NOT NULL,
	[apellido2] [varchar](30) NULL,
	[nacimiento] [date] NULL,
	[esta_activo] [bit] NOT NULL,
	[edad]  AS (datepart(year,getdate())-datepart(year,[nacimiento])),
	[cod_depart_trabaja] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado_Proyecto]    Script Date: 4/9/2022 23:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado_Proyecto](
	[id_Empleado] [int] NOT NULL,
	[id_Proyecto] [varchar](50) NOT NULL,
	[rol_empleado] [int] NOT NULL,
 CONSTRAINT [PK_Empleado_Proyecto] PRIMARY KEY CLUSTERED 
(
	[id_Empleado] ASC,
	[id_Proyecto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee_Role]    Script Date: 4/9/2022 23:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[rol] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Employee_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Error]    Script Date: 4/9/2022 23:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Error](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[detalle] [varchar](500) NULL,
	[fecha_hora] [datetime2](7) NULL,
	[id_Impacto] [int] NULL,
	[numSerie_Servidor] [varchar](50) NULL,
	[cod_App] [varchar](50) NULL,
	[id_Proyecto_Correccion] [varchar](50) NULL,
 CONSTRAINT [PK_Error] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Impacto]    Script Date: 4/9/2022 23:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Impacto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[impacto] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Impacto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proyecto_Correcccion]    Script Date: 4/9/2022 23:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proyecto_Correcccion](
	[id] [varchar](50) NOT NULL,
	[nombre] [varchar](80) NOT NULL,
	[f_inicio] [datetime2](3) NOT NULL,
	[f_final] [datetime2](3) NOT NULL,
	[esfuerzo_esp] [int] NOT NULL,
	[esfuerzo_real] [int] NOT NULL,
	[descripcion] [varchar](500) NULL,
 CONSTRAINT [PK_Proyecto_Correcccion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Server_Role]    Script Date: 4/9/2022 23:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Server_Role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[rol] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Server_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servidor]    Script Date: 4/9/2022 23:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servidor](
	[numSerie] [varchar](50) NOT NULL,
	[marca] [varchar](50) NOT NULL,
	[modelo] [varchar](50) NOT NULL,
	[memoria] [varchar](50) NULL,
	[fechaCompra] [date] NOT NULL,
	[procesamiento] [varchar](50) NULL,
	[almacenamiento] [varchar](50) NULL,
 CONSTRAINT [PK_Servidor] PRIMARY KEY CLUSTERED 
(
	[numSerie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tel]    Script Date: 4/9/2022 23:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tel](
	[id_empleado] [int] NOT NULL,
	[telefono] [int] NOT NULL,
 CONSTRAINT [PK_tel] PRIMARY KEY CLUSTERED 
(
	[id_empleado] ASC,
	[telefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[App] ([codigo], [nombre], [num_Patente], [descripcion], [fecha_Prod], [fecha_exp_lic], [id_type], [codigo_departamento]) VALUES (N'4WR', N'4WayRecon', N'QK6A', N'Reconciliate Payroll Data', CAST(N'2010-03-10' AS Date), CAST(N'2022-10-05' AS Date), 2, N'RE9153')
GO
INSERT [dbo].[App] ([codigo], [nombre], [num_Patente], [descripcion], [fecha_Prod], [fecha_exp_lic], [id_type], [codigo_departamento]) VALUES (N'DMS', N'DailyManagementSystem', N'7ETR', N'Tool for employees to keep track of their tasks over the day', CAST(N'2006-06-06' AS Date), CAST(N'2023-05-25' AS Date), 3, N'EG4567')
GO
INSERT [dbo].[App] ([codigo], [nombre], [num_Patente], [descripcion], [fecha_Prod], [fecha_exp_lic], [id_type], [codigo_departamento]) VALUES (N'DTU', N'DailyTaxesUS', N'SXFP', N'Automation for daily taxes payment in USA', CAST(N'2022-06-09' AS Date), CAST(N'2023-12-31' AS Date), 1, N'RE9153')
GO
INSERT [dbo].[App] ([codigo], [nombre], [num_Patente], [descripcion], [fecha_Prod], [fecha_exp_lic], [id_type], [codigo_departamento]) VALUES (N'OPL', N'Overpayments Letter', N'XNSS', N'Sends overpayments letter to USA employees', CAST(N'2023-03-01' AS Date), CAST(N'2023-12-31' AS Date), 1, N'RE9153')
GO
INSERT [dbo].[App] ([codigo], [nombre], [num_Patente], [descripcion], [fecha_Prod], [fecha_exp_lic], [id_type], [codigo_departamento]) VALUES (N'PMC', N'Project Management Control Center', N'NHLE', N'Keeps track of projects development', CAST(N'1999-03-10' AS Date), CAST(N'2023-03-10' AS Date), 3, N'EG4567')
GO
INSERT [dbo].[App] ([codigo], [nombre], [num_Patente], [descripcion], [fecha_Prod], [fecha_exp_lic], [id_type], [codigo_departamento]) VALUES (N'RST', N'Rightsizing Tool', N'N9TT', N'Workload Assessment System', CAST(N'2017-03-01' AS Date), CAST(N'2022-12-07' AS Date), 2, N'EG4567')
GO
INSERT [dbo].[App_Servidor] ([cod_App], [numSerie_Servidor], [rol_servidor]) VALUES (N'4WR', N'33FI', 3)
GO
INSERT [dbo].[App_Servidor] ([cod_App], [numSerie_Servidor], [rol_servidor]) VALUES (N'DMS', N'72IU', 3)
GO
INSERT [dbo].[App_Servidor] ([cod_App], [numSerie_Servidor], [rol_servidor]) VALUES (N'DMS', N'ETEV', 1)
GO
INSERT [dbo].[App_Servidor] ([cod_App], [numSerie_Servidor], [rol_servidor]) VALUES (N'DTU', N'RANC', 3)
GO
INSERT [dbo].[App_Servidor] ([cod_App], [numSerie_Servidor], [rol_servidor]) VALUES (N'OPL', N'ETEV', 2)
GO
INSERT [dbo].[App_Servidor] ([cod_App], [numSerie_Servidor], [rol_servidor]) VALUES (N'PMC', N'33FI', 1)
GO
INSERT [dbo].[App_Servidor] ([cod_App], [numSerie_Servidor], [rol_servidor]) VALUES (N'PMC', N'72IU', 2)
GO
INSERT [dbo].[App_Servidor] ([cod_App], [numSerie_Servidor], [rol_servidor]) VALUES (N'RST', N'72IU', 3)
GO
SET IDENTITY_INSERT [dbo].[App_Type] ON 
GO
INSERT [dbo].[App_Type] ([id], [tipo]) VALUES (1, N'negocio')
GO
INSERT [dbo].[App_Type] ([id], [tipo]) VALUES (2, N'utilitaria')
GO
INSERT [dbo].[App_Type] ([id], [tipo]) VALUES (3, N'legacy')
GO
SET IDENTITY_INSERT [dbo].[App_Type] OFF
GO
INSERT [dbo].[Departamento] ([codigo], [nombre], [id_empleado_dirige]) VALUES (N'EG4567', N'Productividad', 4)
GO
INSERT [dbo].[Departamento] ([codigo], [nombre], [id_empleado_dirige]) VALUES (N'RE9153', N'Contabilidad', 5)
GO
INSERT [dbo].[email] ([id_empleado], [email]) VALUES (1, N'bruce_notBatman_wayne@batman.com')
GO
INSERT [dbo].[email] ([id_empleado], [email]) VALUES (2, N'neverland_18@gmail.com')
GO
INSERT [dbo].[email] ([id_empleado], [email]) VALUES (3, N'majortom@nasa.com')
GO
INSERT [dbo].[email] ([id_empleado], [email]) VALUES (4, N'Neutron_Jimmy@genius.com')
GO
INSERT [dbo].[Empleado] ([id], [nombre1], [nombre2], [apellido1], [apellido2], [nacimiento], [esta_activo], [cod_depart_trabaja]) VALUES (1, N'Bruce', N'Thomas', N'Wayne', N'', CAST(N'1982-02-19' AS Date), 1, N'EG4567')
GO
INSERT [dbo].[Empleado] ([id], [nombre1], [nombre2], [apellido1], [apellido2], [nacimiento], [esta_activo], [cod_depart_trabaja]) VALUES (2, N'Peter', N'', N'Pan', N'', CAST(N'2001-01-01' AS Date), 1, N'RE9153')
GO
INSERT [dbo].[Empleado] ([id], [nombre1], [nombre2], [apellido1], [apellido2], [nacimiento], [esta_activo], [cod_depart_trabaja]) VALUES (3, N'David', N'Robert ', N'Jones', N'Bowie', CAST(N'2000-01-08' AS Date), 1, N'EG4567')
GO
INSERT [dbo].[Empleado] ([id], [nombre1], [nombre2], [apellido1], [apellido2], [nacimiento], [esta_activo], [cod_depart_trabaja]) VALUES (4, N'Jimmy', N'', N'Neutron', N'', CAST(N'1997-06-05' AS Date), 1, N'EG4567')
GO
INSERT [dbo].[Empleado] ([id], [nombre1], [nombre2], [apellido1], [apellido2], [nacimiento], [esta_activo], [cod_depart_trabaja]) VALUES (5, N'Johannes ', N'', N'Betzler', N'', CAST(N'1990-10-18' AS Date), 1, N'RE9153')
GO
INSERT [dbo].[Empleado] ([id], [nombre1], [nombre2], [apellido1], [apellido2], [nacimiento], [esta_activo], [cod_depart_trabaja]) VALUES (6, N'Guido ', N'', N'Orefice', N'', CAST(N'1991-10-10' AS Date), 0, N'RE9153')
GO
INSERT [dbo].[Empleado] ([id], [nombre1], [nombre2], [apellido1], [apellido2], [nacimiento], [esta_activo], [cod_depart_trabaja]) VALUES (7, N'Oskar ', N'', N'Schindler', N'', CAST(N'2000-12-31' AS Date), 0, N'RE9153')
GO
INSERT [dbo].[Empleado_Proyecto] ([id_Empleado], [id_Proyecto], [rol_empleado]) VALUES (1, N'1', 1)
GO
INSERT [dbo].[Empleado_Proyecto] ([id_Empleado], [id_Proyecto], [rol_empleado]) VALUES (1, N'4', 1)
GO
INSERT [dbo].[Empleado_Proyecto] ([id_Empleado], [id_Proyecto], [rol_empleado]) VALUES (2, N'2', 2)
GO
INSERT [dbo].[Empleado_Proyecto] ([id_Empleado], [id_Proyecto], [rol_empleado]) VALUES (2, N'5', 2)
GO
INSERT [dbo].[Empleado_Proyecto] ([id_Empleado], [id_Proyecto], [rol_empleado]) VALUES (3, N'1', 3)
GO
INSERT [dbo].[Empleado_Proyecto] ([id_Empleado], [id_Proyecto], [rol_empleado]) VALUES (3, N'3', 3)
GO
INSERT [dbo].[Empleado_Proyecto] ([id_Empleado], [id_Proyecto], [rol_empleado]) VALUES (4, N'2', 4)
GO
INSERT [dbo].[Empleado_Proyecto] ([id_Empleado], [id_Proyecto], [rol_empleado]) VALUES (5, N'3', 5)
GO
INSERT [dbo].[Empleado_Proyecto] ([id_Empleado], [id_Proyecto], [rol_empleado]) VALUES (6, N'4', 2)
GO
INSERT [dbo].[Empleado_Proyecto] ([id_Empleado], [id_Proyecto], [rol_empleado]) VALUES (7, N'5', 2)
GO
SET IDENTITY_INSERT [dbo].[Employee_Role] ON 
GO
INSERT [dbo].[Employee_Role] ([id], [rol]) VALUES (1, N'Tester')
GO
INSERT [dbo].[Employee_Role] ([id], [rol]) VALUES (2, N'Developer')
GO
INSERT [dbo].[Employee_Role] ([id], [rol]) VALUES (3, N'Project manager')
GO
INSERT [dbo].[Employee_Role] ([id], [rol]) VALUES (4, N'Security Analyst')
GO
INSERT [dbo].[Employee_Role] ([id], [rol]) VALUES (5, N'Network architect')
GO
INSERT [dbo].[Employee_Role] ([id], [rol]) VALUES (6, N'Database administrator')
GO
SET IDENTITY_INSERT [dbo].[Employee_Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Impacto] ON 
GO
INSERT [dbo].[Impacto] ([id], [impacto]) VALUES (1, N'Critico')
GO
INSERT [dbo].[Impacto] ([id], [impacto]) VALUES (2, N'Alto')
GO
INSERT [dbo].[Impacto] ([id], [impacto]) VALUES (3, N'Medio')
GO
INSERT [dbo].[Impacto] ([id], [impacto]) VALUES (4, N'Bajo')
GO
SET IDENTITY_INSERT [dbo].[Impacto] OFF
GO
INSERT [dbo].[Proyecto_Correcccion] ([id], [nombre], [f_inicio], [f_final], [esfuerzo_esp], [esfuerzo_real], [descripcion]) VALUES (N'1', N'Log4J patch', CAST(N'2022-08-30T00:00:00.0000000' AS DateTime2), CAST(N'2022-09-04T00:00:00.0000000' AS DateTime2), 20, 4, N'Dependency Removed')
GO
INSERT [dbo].[Proyecto_Correcccion] ([id], [nombre], [f_inicio], [f_final], [esfuerzo_esp], [esfuerzo_real], [descripcion]) VALUES (N'2', N'Certificate automation', CAST(N'2022-08-31T00:00:00.0000000' AS DateTime2), CAST(N'2022-09-05T00:00:00.0000000' AS DateTime2), 13, 27, N'Certificated will automatically be updated')
GO
INSERT [dbo].[Proyecto_Correcccion] ([id], [nombre], [f_inicio], [f_final], [esfuerzo_esp], [esfuerzo_real], [descripcion]) VALUES (N'3', N'Logging Update', CAST(N'2022-09-01T00:00:00.0000000' AS DateTime2), CAST(N'2022-09-06T00:00:00.0000000' AS DateTime2), 17, 29, N'Authentication Process needed to be updated')
GO
INSERT [dbo].[Proyecto_Correcccion] ([id], [nombre], [f_inicio], [f_final], [esfuerzo_esp], [esfuerzo_real], [descripcion]) VALUES (N'4', N'.NET update', CAST(N'2022-09-02T00:00:00.0000000' AS DateTime2), CAST(N'2022-09-07T00:00:00.0000000' AS DateTime2), 19, 31, N'Dependecies with outdated .NET where updated')
GO
INSERT [dbo].[Proyecto_Correcccion] ([id], [nombre], [f_inicio], [f_final], [esfuerzo_esp], [esfuerzo_real], [descripcion]) VALUES (N'5', N'Database security error', CAST(N'2022-09-03T00:00:00.0000000' AS DateTime2), CAST(N'2022-09-08T00:00:00.0000000' AS DateTime2), 23, 10, N'DB needed to use RSA ')
GO
SET IDENTITY_INSERT [dbo].[Server_Role] ON 
GO
INSERT [dbo].[Server_Role] ([id], [rol]) VALUES (1, N'Produccion')
GO
INSERT [dbo].[Server_Role] ([id], [rol]) VALUES (2, N'Testing')
GO
INSERT [dbo].[Server_Role] ([id], [rol]) VALUES (3, N'Backup')
GO
INSERT [dbo].[Server_Role] ([id], [rol]) VALUES (4, N'Stagging')
GO
SET IDENTITY_INSERT [dbo].[Server_Role] OFF
GO
INSERT [dbo].[Servidor] ([numSerie], [marca], [modelo], [memoria], [fechaCompra], [procesamiento], [almacenamiento]) VALUES (N'33FI', N'HP', N'Proliant', N'1024000 GB', CAST(N'2010-10-10' AS Date), N'Intel Core i5 12th Gen ', N'128')
GO
INSERT [dbo].[Servidor] ([numSerie], [marca], [modelo], [memoria], [fechaCompra], [procesamiento], [almacenamiento]) VALUES (N'72IU', N'Dell', N'PowerEdge', N'512000 GB', CAST(N'2003-10-20' AS Date), N'Intel Core i3 8th Gen', N'64')
GO
INSERT [dbo].[Servidor] ([numSerie], [marca], [modelo], [memoria], [fechaCompra], [procesamiento], [almacenamiento]) VALUES (N'ETEV', N'HP', N'Z7-Pro', N'1024000 GB', CAST(N'2012-12-12' AS Date), N'Intel Core i7 12th Gen ', N'256')
GO
INSERT [dbo].[Servidor] ([numSerie], [marca], [modelo], [memoria], [fechaCompra], [procesamiento], [almacenamiento]) VALUES (N'RANC', N'Lenovo', N'Xenon', N'1024000 GB', CAST(N'2011-11-11' AS Date), N'Intel Core i5 12th Gen ', N'256')
GO
INSERT [dbo].[tel] ([id_empleado], [telefono]) VALUES (1, 78513422)
GO
INSERT [dbo].[tel] ([id_empleado], [telefono]) VALUES (1, 83116452)
GO
INSERT [dbo].[tel] ([id_empleado], [telefono]) VALUES (1, 88760951)
GO
INSERT [dbo].[tel] ([id_empleado], [telefono]) VALUES (2, 85432124)
GO
INSERT [dbo].[tel] ([id_empleado], [telefono]) VALUES (2, 89612354)
GO
INSERT [dbo].[tel] ([id_empleado], [telefono]) VALUES (3, 87845213)
GO
INSERT [dbo].[tel] ([id_empleado], [telefono]) VALUES (4, 82715647)
GO
INSERT [dbo].[tel] ([id_empleado], [telefono]) VALUES (4, 88161020)
GO
INSERT [dbo].[tel] ([id_empleado], [telefono]) VALUES (5, 86512346)
GO
INSERT [dbo].[tel] ([id_empleado], [telefono]) VALUES (5, 87435612)
GO
INSERT [dbo].[tel] ([id_empleado], [telefono]) VALUES (5, 89151523)
GO
ALTER TABLE [dbo].[App]  WITH CHECK ADD  CONSTRAINT [FK_App_App_Type] FOREIGN KEY([id_type])
REFERENCES [dbo].[App_Type] ([id])
GO
ALTER TABLE [dbo].[App] CHECK CONSTRAINT [FK_App_App_Type]
GO
ALTER TABLE [dbo].[App]  WITH CHECK ADD  CONSTRAINT [FK_App_Departamento] FOREIGN KEY([codigo_departamento])
REFERENCES [dbo].[Departamento] ([codigo])
GO
ALTER TABLE [dbo].[App] CHECK CONSTRAINT [FK_App_Departamento]
GO
ALTER TABLE [dbo].[App_Servidor]  WITH CHECK ADD  CONSTRAINT [FK_App_Servidor_App] FOREIGN KEY([cod_App])
REFERENCES [dbo].[App] ([codigo])
GO
ALTER TABLE [dbo].[App_Servidor] CHECK CONSTRAINT [FK_App_Servidor_App]
GO
ALTER TABLE [dbo].[App_Servidor]  WITH CHECK ADD  CONSTRAINT [FK_App_Servidor_Server_Role] FOREIGN KEY([rol_servidor])
REFERENCES [dbo].[Server_Role] ([id])
GO
ALTER TABLE [dbo].[App_Servidor] CHECK CONSTRAINT [FK_App_Servidor_Server_Role]
GO
ALTER TABLE [dbo].[App_Servidor]  WITH CHECK ADD  CONSTRAINT [FK_App_Servidor_Servidor] FOREIGN KEY([numSerie_Servidor])
REFERENCES [dbo].[Servidor] ([numSerie])
GO
ALTER TABLE [dbo].[App_Servidor] CHECK CONSTRAINT [FK_App_Servidor_Servidor]
GO
ALTER TABLE [dbo].[Departamento]  WITH CHECK ADD  CONSTRAINT [FK_Departamento_Empleado] FOREIGN KEY([id_empleado_dirige])
REFERENCES [dbo].[Empleado] ([id])
GO
ALTER TABLE [dbo].[Departamento] CHECK CONSTRAINT [FK_Departamento_Empleado]
GO
ALTER TABLE [dbo].[email]  WITH CHECK ADD  CONSTRAINT [FK_email_Empleado] FOREIGN KEY([id_empleado])
REFERENCES [dbo].[Empleado] ([id])
GO
ALTER TABLE [dbo].[email] CHECK CONSTRAINT [FK_email_Empleado]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Departamento] FOREIGN KEY([cod_depart_trabaja])
REFERENCES [dbo].[Departamento] ([codigo])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Departamento]
GO
ALTER TABLE [dbo].[Empleado_Proyecto]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Proyecto_Empleado] FOREIGN KEY([id_Empleado])
REFERENCES [dbo].[Empleado] ([id])
GO
ALTER TABLE [dbo].[Empleado_Proyecto] CHECK CONSTRAINT [FK_Empleado_Proyecto_Empleado]
GO
ALTER TABLE [dbo].[Empleado_Proyecto]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Proyecto_Employee_Role] FOREIGN KEY([rol_empleado])
REFERENCES [dbo].[Employee_Role] ([id])
GO
ALTER TABLE [dbo].[Empleado_Proyecto] CHECK CONSTRAINT [FK_Empleado_Proyecto_Employee_Role]
GO
ALTER TABLE [dbo].[Empleado_Proyecto]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Proyecto_Proyecto_Correcccion] FOREIGN KEY([id_Proyecto])
REFERENCES [dbo].[Proyecto_Correcccion] ([id])
GO
ALTER TABLE [dbo].[Empleado_Proyecto] CHECK CONSTRAINT [FK_Empleado_Proyecto_Proyecto_Correcccion]
GO
ALTER TABLE [dbo].[Error]  WITH CHECK ADD  CONSTRAINT [FK_Error_App_Servidor] FOREIGN KEY([cod_App], [numSerie_Servidor])
REFERENCES [dbo].[App_Servidor] ([cod_App], [numSerie_Servidor])
GO
ALTER TABLE [dbo].[Error] CHECK CONSTRAINT [FK_Error_App_Servidor]
GO
ALTER TABLE [dbo].[Error]  WITH CHECK ADD  CONSTRAINT [FK_Error_Impacto] FOREIGN KEY([id_Impacto])
REFERENCES [dbo].[Impacto] ([id])
GO
ALTER TABLE [dbo].[Error] CHECK CONSTRAINT [FK_Error_Impacto]
GO
ALTER TABLE [dbo].[Error]  WITH CHECK ADD  CONSTRAINT [FK_Error_Proyecto_Correcccion] FOREIGN KEY([id_Proyecto_Correccion])
REFERENCES [dbo].[Proyecto_Correcccion] ([id])
GO
ALTER TABLE [dbo].[Error] CHECK CONSTRAINT [FK_Error_Proyecto_Correcccion]
GO
ALTER TABLE [dbo].[tel]  WITH CHECK ADD  CONSTRAINT [FK_tel_Empleado] FOREIGN KEY([id_empleado])
REFERENCES [dbo].[Empleado] ([id])
GO
ALTER TABLE [dbo].[tel] CHECK CONSTRAINT [FK_tel_Empleado]
GO
