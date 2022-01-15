USE [master]
GO
/****** Object:  Database [Biblioteca2]    Script Date: 14/01/2022 01:27:53 p. m. ******/
CREATE DATABASE [Biblioteca2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Biblioteca2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Biblioteca2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Biblioteca2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Biblioteca2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Biblioteca2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Biblioteca2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Biblioteca2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Biblioteca2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Biblioteca2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Biblioteca2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Biblioteca2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Biblioteca2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Biblioteca2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Biblioteca2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Biblioteca2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Biblioteca2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Biblioteca2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Biblioteca2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Biblioteca2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Biblioteca2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Biblioteca2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Biblioteca2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Biblioteca2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Biblioteca2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Biblioteca2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Biblioteca2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Biblioteca2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Biblioteca2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Biblioteca2] SET RECOVERY FULL 
GO
ALTER DATABASE [Biblioteca2] SET  MULTI_USER 
GO
ALTER DATABASE [Biblioteca2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Biblioteca2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Biblioteca2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Biblioteca2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Biblioteca2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Biblioteca2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Biblioteca2', N'ON'
GO
ALTER DATABASE [Biblioteca2] SET QUERY_STORE = OFF
GO
USE [Biblioteca2]
GO
/****** Object:  UserDefinedFunction [dbo].[Comic_mas_largo]    Script Date: 14/01/2022 01:27:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Function [dbo].[Comic_mas_largo]()Returns Varchar(40)As Begin Declare @MAX1 Varchar(40)Select @MAX1 = nombre_comic From Comic Where paginas IN (select max(paginas) From Comic)Return @MAX1END
GO
/****** Object:  UserDefinedFunction [dbo].[Comic_mas_pequeño]    Script Date: 14/01/2022 01:27:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Function [dbo].[Comic_mas_pequeño]()Returns Varchar(40)As Begin Declare @MIN1 Varchar(40)Select @MIN1 = nombre_comic From Comic Where paginas IN (select MIN(paginas) From Comic)Return @MIN1END
GO
/****** Object:  UserDefinedFunction [dbo].[Libro_mas_grande]    Script Date: 14/01/2022 01:27:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Function [dbo].[Libro_mas_grande]()Returns Varchar(40)As Begin Declare @MAX2 Varchar(40)Select @MAX2 = nombre_libro From Libro Where paginas IN (select MAX(paginas) From Libro)Return @MAX2END
GO
/****** Object:  UserDefinedFunction [dbo].[Libro_mas_pequeño]    Script Date: 14/01/2022 01:27:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Function [dbo].[Libro_mas_pequeño]()Returns Varchar(40)As Begin Declare @MIN2 Varchar(40)Select @MIN2 = nombre_libro From Libro Where paginas IN (select MIN(paginas) From Libro)Return @MIN2END
GO
/****** Object:  Table [dbo].[Libro]    Script Date: 14/01/2022 01:27:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libro](
	[clave_libro] [int] NOT NULL,
	[nombre_libro] [varchar](40) NULL,
	[autor] [varchar](40) NULL,
	[editorial] [varchar](40) NULL,
	[paginas] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[clave_libro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Libros_Tolkien]    Script Date: 14/01/2022 01:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[Libros_Tolkien] As Select * From Libro where autor = ' J. R. R. Tolkien';
GO
/****** Object:  View [dbo].[Penguin_Random]    Script Date: 14/01/2022 01:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[Penguin_Random] As Select * From Libro Where editorial = '? Penguin Random House Grupo Editorial'
GO
/****** Object:  Table [dbo].[Comic]    Script Date: 14/01/2022 01:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comic](
	[clave_comic] [int] NOT NULL,
	[nombre_comic] [varchar](40) NULL,
	[escritor] [varchar](40) NULL,
	[ilustrador] [varchar](40) NULL,
	[editorial] [varchar](40) NULL,
	[paginas] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[clave_comic] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Alan_Moore]    Script Date: 14/01/2022 01:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[Alan_Moore] As Select * From Comic Where escritor = 'Alan Moore'
GO
/****** Object:  View [dbo].[Vertigo]    Script Date: 14/01/2022 01:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[Vertigo] As Select * From Comic Where editorial = 'Vertigo Comics'
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 14/01/2022 01:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[clave_cliente] [int] NOT NULL,
	[nombre] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[clave_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prestamo]    Script Date: 14/01/2022 01:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prestamo](
	[clave_cliente] [int] NULL,
	[clave_libro] [int] NULL,
	[clave_comic] [int] NULL,
	[fecha_de_prestamo] [date] NULL,
	[fecha_de_entrega] [date] NULL,
	[Nombre_Bibliotecaria] [varchar](30) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Cliente] ([clave_cliente], [nombre]) VALUES (10572, N'Jared Benjamin Nogales Cubillas')
INSERT [dbo].[Cliente] ([clave_cliente], [nombre]) VALUES (10420, N'Jesus Jahir Felix Vazquez')
INSERT [dbo].[Cliente] ([clave_cliente], [nombre]) VALUES (10345, N'Jose Francisco Jacobo Montijo')
INSERT [dbo].[Cliente] ([clave_cliente], [nombre]) VALUES (10111, N'Oswaldo Sanchez Nava')
INSERT [dbo].[Cliente] ([clave_cliente], [nombre]) VALUES (10901, N'Ruelas Leyva Bryan Ulises')
GO
INSERT [dbo].[Comic] ([clave_comic], [nombre_comic], [escritor], [ilustrador], [editorial], [paginas]) VALUES (11456, N'Watchmen: Deluxe Edition', N'Alan Moore', N'Dave Gibbons', N'DC Comics', 448)
INSERT [dbo].[Comic] ([clave_comic], [nombre_comic], [escritor], [ilustrador], [editorial], [paginas]) VALUES (11551, N'Vertigo Deluxe: V For Vendetta', N'Alan Moore', N'David Lloyd', N'Vertigo Comics', 400)
INSERT [dbo].[Comic] ([clave_comic], [nombre_comic], [escritor], [ilustrador], [editorial], [paginas]) VALUES (11611, N'Marvel Deluxe Daredevil: Born Again', N'Frank Miller', N'David Mazzucchelli', N'Marvel Comics', 248)
INSERT [dbo].[Comic] ([clave_comic], [nombre_comic], [escritor], [ilustrador], [editorial], [paginas]) VALUES (11661, N'Berserk Deluxe Volume 8', N'Kentaro Miura', N'Kentaro Miura', N'Dark Horse Manga', 633)
INSERT [dbo].[Comic] ([clave_comic], [nombre_comic], [escritor], [ilustrador], [editorial], [paginas]) VALUES (11683, N'Preacher Book One', N'Garth Ennis', N'Steve Dillon', N'Vertigo Comics', 352)
INSERT [dbo].[Comic] ([clave_comic], [nombre_comic], [escritor], [ilustrador], [editorial], [paginas]) VALUES (11881, N'Promethea: Deluxe Edition Libro Uno', N'Alan Moore', N'J. H. Williams III', N'Vertigo Comics', 176)
INSERT [dbo].[Comic] ([clave_comic], [nombre_comic], [escritor], [ilustrador], [editorial], [paginas]) VALUES (11892, N'MAUS', N'Art Spiegelman', N'Art Spiegelman', N'Pantheon Books', 296)
GO
INSERT [dbo].[Libro] ([clave_libro], [nombre_libro], [autor], [editorial], [paginas]) VALUES (12091, N'La Comunidad del Anillo', N' J. R. R. Tolkien', N'George Allen & Unwin ', 424)
INSERT [dbo].[Libro] ([clave_libro], [nombre_libro], [autor], [editorial], [paginas]) VALUES (12092, N'Las dos torres', N' J. R. R. Tolkien', N'George Allen & Unwin ', 352)
INSERT [dbo].[Libro] ([clave_libro], [nombre_libro], [autor], [editorial], [paginas]) VALUES (12093, N'El retorno del Rey', N' J. R. R. Tolkien', N'George Allen & Unwin ', 603)
INSERT [dbo].[Libro] ([clave_libro], [nombre_libro], [autor], [editorial], [paginas]) VALUES (12123, N'Elric de Melniboné', N'Michael Moorcock', N'Hutchinson & Co', 191)
INSERT [dbo].[Libro] ([clave_libro], [nombre_libro], [autor], [editorial], [paginas]) VALUES (12192, N'Un mundo feliz', N'Aldous Huxley', N'? Penguin Random House Grupo Editorial', 256)
INSERT [dbo].[Libro] ([clave_libro], [nombre_libro], [autor], [editorial], [paginas]) VALUES (12201, N'1984', N'George Orwell', N'? Penguin Random House Grupo Editorial', 352)
INSERT [dbo].[Libro] ([clave_libro], [nombre_libro], [autor], [editorial], [paginas]) VALUES (12295, N'El principito', N'Antoine De Saint-Exupéry', N'Emecé', 96)
INSERT [dbo].[Libro] ([clave_libro], [nombre_libro], [autor], [editorial], [paginas]) VALUES (12790, N'1001 noches', N'Mario Vargas Llosa', N'?Alfaguara', 286)
GO
INSERT [dbo].[Prestamo] ([clave_cliente], [clave_libro], [clave_comic], [fecha_de_prestamo], [fecha_de_entrega], [Nombre_Bibliotecaria]) VALUES (10345, NULL, 11456, CAST(N'2021-11-01' AS Date), CAST(N'2021-11-09' AS Date), N'Maria Jimenez')
INSERT [dbo].[Prestamo] ([clave_cliente], [clave_libro], [clave_comic], [fecha_de_prestamo], [fecha_de_entrega], [Nombre_Bibliotecaria]) VALUES (10345, NULL, 11661, CAST(N'2021-11-01' AS Date), CAST(N'2021-11-09' AS Date), N'Maria Jimenez')
INSERT [dbo].[Prestamo] ([clave_cliente], [clave_libro], [clave_comic], [fecha_de_prestamo], [fecha_de_entrega], [Nombre_Bibliotecaria]) VALUES (10572, NULL, 11611, CAST(N'2021-11-03' AS Date), CAST(N'2021-11-10' AS Date), N'Maria Jimenez')
INSERT [dbo].[Prestamo] ([clave_cliente], [clave_libro], [clave_comic], [fecha_de_prestamo], [fecha_de_entrega], [Nombre_Bibliotecaria]) VALUES (10901, 12091, NULL, CAST(N'2021-11-10' AS Date), CAST(N'2021-11-17' AS Date), N'Maria Jimenez')
INSERT [dbo].[Prestamo] ([clave_cliente], [clave_libro], [clave_comic], [fecha_de_prestamo], [fecha_de_entrega], [Nombre_Bibliotecaria]) VALUES (10901, 12092, NULL, CAST(N'2021-11-10' AS Date), CAST(N'2021-11-17' AS Date), N'Maria Jimenez')
INSERT [dbo].[Prestamo] ([clave_cliente], [clave_libro], [clave_comic], [fecha_de_prestamo], [fecha_de_entrega], [Nombre_Bibliotecaria]) VALUES (10901, 12093, NULL, CAST(N'2021-11-10' AS Date), CAST(N'2021-11-17' AS Date), N'Maria Jimenez')
INSERT [dbo].[Prestamo] ([clave_cliente], [clave_libro], [clave_comic], [fecha_de_prestamo], [fecha_de_entrega], [Nombre_Bibliotecaria]) VALUES (10111, NULL, 11611, CAST(N'2021-11-11' AS Date), CAST(N'2021-11-18' AS Date), N'Maria Jimenez')
INSERT [dbo].[Prestamo] ([clave_cliente], [clave_libro], [clave_comic], [fecha_de_prestamo], [fecha_de_entrega], [Nombre_Bibliotecaria]) VALUES (10111, 12192, NULL, CAST(N'2021-11-11' AS Date), CAST(N'2021-11-18' AS Date), N'Maria Jimenez')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_nombre]    Script Date: 14/01/2022 01:27:54 p. m. ******/
ALTER TABLE [dbo].[Cliente] ADD  CONSTRAINT [UQ_nombre] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Prestamo] ADD  CONSTRAINT [DF_Nombre_Bibliotecaria]  DEFAULT ('Maria Jimenez') FOR [Nombre_Bibliotecaria]
GO
ALTER TABLE [dbo].[Prestamo]  WITH CHECK ADD FOREIGN KEY([clave_cliente])
REFERENCES [dbo].[Cliente] ([clave_cliente])
GO
ALTER TABLE [dbo].[Prestamo]  WITH CHECK ADD FOREIGN KEY([clave_libro])
REFERENCES [dbo].[Libro] ([clave_libro])
GO
ALTER TABLE [dbo].[Prestamo]  WITH CHECK ADD FOREIGN KEY([clave_comic])
REFERENCES [dbo].[Comic] ([clave_comic])
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [CK_clave_cliente] CHECK  (([clave_cliente]>=(10000) AND [clave_cliente]<=(10999)))
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [CK_clave_cliente]
GO
ALTER TABLE [dbo].[Comic]  WITH CHECK ADD  CONSTRAINT [CK_clave_comic] CHECK  (([clave_comic]>=(11000) AND [clave_comic]<=(11999)))
GO
ALTER TABLE [dbo].[Comic] CHECK CONSTRAINT [CK_clave_comic]
GO
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [CK_clave_libro] CHECK  (([clave_libro]>=(12000) AND [clave_libro]<=(12999)))
GO
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [CK_clave_libro]
GO
/****** Object:  StoredProcedure [dbo].[Borrar_cliente]    Script Date: 14/01/2022 01:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Borrar_cliente]@WCLAVE INTAs Begin Delete From Cliente Where clave_cliente = @WCLAVEEnd
GO
/****** Object:  StoredProcedure [dbo].[Insertar_nuevo_cliente]    Script Date: 14/01/2022 01:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Insertar_nuevo_cliente]@WCLAVE INT, @WNOMBRE Varchar(40)As Begin Insert Into Cliente Values (@WCLAVE, @WNOMBRE)End
GO
/****** Object:  StoredProcedure [dbo].[Mostrar_nombre_comic]    Script Date: 14/01/2022 01:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Mostrar_nombre_comic]@WCLAVE IntAs Begin Select nombre_comic From Comic where clave_comic = @WCLAVEEnd
GO
/****** Object:  StoredProcedure [dbo].[Mostrar_nombre_libro]    Script Date: 14/01/2022 01:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Mostrar_nombre_libro]@WCLAVE IntAs Begin Select nombre_libro From Libro where clave_libro = @WCLAVEEnd
GO
USE [master]
GO
ALTER DATABASE [Biblioteca2] SET  READ_WRITE 
GO
