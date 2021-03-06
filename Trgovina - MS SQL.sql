USE [master]
GO
/****** Object:  Database [Trgovina]    Script Date: 6/8/2022 5:43:47 PM ******/
CREATE DATABASE [Trgovina]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Trgovina', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Trgovina.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Trgovina_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Trgovina_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Trgovina] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Trgovina].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Trgovina] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Trgovina] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Trgovina] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Trgovina] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Trgovina] SET ARITHABORT OFF 
GO
ALTER DATABASE [Trgovina] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Trgovina] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Trgovina] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Trgovina] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Trgovina] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Trgovina] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Trgovina] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Trgovina] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Trgovina] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Trgovina] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Trgovina] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Trgovina] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Trgovina] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Trgovina] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Trgovina] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Trgovina] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Trgovina] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Trgovina] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Trgovina] SET  MULTI_USER 
GO
ALTER DATABASE [Trgovina] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Trgovina] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Trgovina] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Trgovina] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Trgovina] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Trgovina] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Trgovina] SET QUERY_STORE = OFF
GO
USE [Trgovina]
GO
/****** Object:  Table [dbo].[Kategorija]    Script Date: 6/8/2022 5:43:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategorija](
	[IDKategorija] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Kategorija] PRIMARY KEY CLUSTERED 
(
	[IDKategorija] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Korisnik]    Script Date: 6/8/2022 5:43:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Korisnik](
	[IDKorisnik] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Ime] [nvarchar](50) NOT NULL,
	[Prezime] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Slika] [nvarchar](200) NULL,
 CONSTRAINT [PK_Korisnik] PRIMARY KEY CLUSTERED 
(
	[IDKorisnik] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kupnja]    Script Date: 6/8/2022 5:43:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kupnja](
	[IDKupnja] [int] IDENTITY(1,1) NOT NULL,
	[KorisnikID] [int] NOT NULL,
	[ProizvodID] [int] NOT NULL,
	[Cijena] [money] NOT NULL,
	[Kolicina] [int] NOT NULL,
	[Datum] [datetime] NOT NULL,
	[Nacin] [int] NOT NULL,
 CONSTRAINT [PK_Kupnja] PRIMARY KEY CLUSTERED 
(
	[IDKupnja] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Potkategorija]    Script Date: 6/8/2022 5:43:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Potkategorija](
	[IDPotkategorija] [int] IDENTITY(1,1) NOT NULL,
	[KategorijaID] [int] NOT NULL,
	[Naziv] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Potkategorija] PRIMARY KEY CLUSTERED 
(
	[IDPotkategorija] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proizvod]    Script Date: 6/8/2022 5:43:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proizvod](
	[IDProizvod] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](100) NOT NULL,
	[Opis] [text] NULL,
	[KolicinaNaSkladistu] [int] NOT NULL,
	[Cijena] [money] NOT NULL,
	[PotkategorijaID] [int] NULL,
	[KategorijaID] [int] NULL,
	[Slika] [nvarchar](100) NULL,
 CONSTRAINT [PK_Proizvod] PRIMARY KEY CLUSTERED 
(
	[IDProizvod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Kategorija] ON 

INSERT [dbo].[Kategorija] ([IDKategorija], [Naziv]) VALUES (1, N'Monitori')
INSERT [dbo].[Kategorija] ([IDKategorija], [Naziv]) VALUES (2, N'Periferija')
INSERT [dbo].[Kategorija] ([IDKategorija], [Naziv]) VALUES (3, N'Kucista')
INSERT [dbo].[Kategorija] ([IDKategorija], [Naziv]) VALUES (4, N'Graficke kartice')
INSERT [dbo].[Kategorija] ([IDKategorija], [Naziv]) VALUES (5, N'Procesori')
INSERT [dbo].[Kategorija] ([IDKategorija], [Naziv]) VALUES (6, N'Maticne ploce')
INSERT [dbo].[Kategorija] ([IDKategorija], [Naziv]) VALUES (7, N'Napajanja')
INSERT [dbo].[Kategorija] ([IDKategorija], [Naziv]) VALUES (8, N'Memorija')
INSERT [dbo].[Kategorija] ([IDKategorija], [Naziv]) VALUES (9, N'Hladenje')
SET IDENTITY_INSERT [dbo].[Kategorija] OFF
GO
SET IDENTITY_INSERT [dbo].[Korisnik] ON 

INSERT [dbo].[Korisnik] ([IDKorisnik], [Username], [Password], [Ime], [Prezime], [Email], [Slika]) VALUES (1, N'pero', N'123', N'Pero', N'Perić', N'pero@hotmail.com', N'download.jpg')
INSERT [dbo].[Korisnik] ([IDKorisnik], [Username], [Password], [Ime], [Prezime], [Email], [Slika]) VALUES (3, N'Administrator', N'admin', N'Administrator', N'admin', NULL, NULL)
INSERT [dbo].[Korisnik] ([IDKorisnik], [Username], [Password], [Ime], [Prezime], [Email], [Slika]) VALUES (4, N'test', N'123', N'test', N'test', N's@s', NULL)
SET IDENTITY_INSERT [dbo].[Korisnik] OFF
GO
SET IDENTITY_INSERT [dbo].[Kupnja] ON 

INSERT [dbo].[Kupnja] ([IDKupnja], [KorisnikID], [ProizvodID], [Cijena], [Kolicina], [Datum], [Nacin]) VALUES (1, 1, 28, 261.9900, 1, CAST(N'2022-05-29T13:39:10.617' AS DateTime), 1)
INSERT [dbo].[Kupnja] ([IDKupnja], [KorisnikID], [ProizvodID], [Cijena], [Kolicina], [Datum], [Nacin]) VALUES (2, 1, 28, 261.9900, 1, CAST(N'2022-05-29T13:43:23.573' AS DateTime), 1)
INSERT [dbo].[Kupnja] ([IDKupnja], [KorisnikID], [ProizvodID], [Cijena], [Kolicina], [Datum], [Nacin]) VALUES (3, 1, 4, 1357.0000, 1, CAST(N'2022-05-29T13:45:35.107' AS DateTime), 1)
INSERT [dbo].[Kupnja] ([IDKupnja], [KorisnikID], [ProizvodID], [Cijena], [Kolicina], [Datum], [Nacin]) VALUES (4, 1, 4, 1357.0000, 2, CAST(N'2022-05-29T13:48:35.977' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[Kupnja] OFF
GO
SET IDENTITY_INSERT [dbo].[Potkategorija] ON 

INSERT [dbo].[Potkategorija] ([IDPotkategorija], [KategorijaID], [Naziv]) VALUES (1, 2, N'Tipkovnice')
INSERT [dbo].[Potkategorija] ([IDPotkategorija], [KategorijaID], [Naziv]) VALUES (2, 2, N'Misevi')
INSERT [dbo].[Potkategorija] ([IDPotkategorija], [KategorijaID], [Naziv]) VALUES (3, 2, N'Podloge za mis')
INSERT [dbo].[Potkategorija] ([IDPotkategorija], [KategorijaID], [Naziv]) VALUES (4, 2, N'Zvucnici')
INSERT [dbo].[Potkategorija] ([IDPotkategorija], [KategorijaID], [Naziv]) VALUES (5, 2, N'Slusalice')
INSERT [dbo].[Potkategorija] ([IDPotkategorija], [KategorijaID], [Naziv]) VALUES (6, 2, N'Mikrofoni')
INSERT [dbo].[Potkategorija] ([IDPotkategorija], [KategorijaID], [Naziv]) VALUES (7, 2, N'Web kamere')
INSERT [dbo].[Potkategorija] ([IDPotkategorija], [KategorijaID], [Naziv]) VALUES (8, 8, N'HDD')
INSERT [dbo].[Potkategorija] ([IDPotkategorija], [KategorijaID], [Naziv]) VALUES (9, 8, N'SSD')
INSERT [dbo].[Potkategorija] ([IDPotkategorija], [KategorijaID], [Naziv]) VALUES (10, 8, N'Memorijske kartice')
INSERT [dbo].[Potkategorija] ([IDPotkategorija], [KategorijaID], [Naziv]) VALUES (11, 9, N'Ventilatori')
INSERT [dbo].[Potkategorija] ([IDPotkategorija], [KategorijaID], [Naziv]) VALUES (12, 9, N'Hladnjaci')
INSERT [dbo].[Potkategorija] ([IDPotkategorija], [KategorijaID], [Naziv]) VALUES (13, 9, N'Vodeno hladenje')
SET IDENTITY_INSERT [dbo].[Potkategorija] OFF
GO
SET IDENTITY_INSERT [dbo].[Proizvod] ON 

INSERT [dbo].[Proizvod] ([IDProizvod], [Naziv], [Opis], [KolicinaNaSkladistu], [Cijena], [PotkategorijaID], [KategorijaID], [Slika]) VALUES (1, N'Monitor 32" SAMSUNG Smart LS32AM500NRXEN', N'250cd/m2, 3000:1, zvučnik, Tizen, WiFi, BlueTooth, crni', 3, 2599.0000, NULL, 1, NULL)
INSERT [dbo].[Proizvod] ([IDProizvod], [Naziv], [Opis], [KolicinaNaSkladistu], [Cijena], [PotkategorijaID], [KategorijaID], [Slika]) VALUES (2, N'Monitor 49" SAMSUNG Odyssey LS49AG950NUXEN', N'240Hz, 1ms, 300cd/m2, 1000:1, zakrivljeni, crno/bijeli', 1, 16899.0000, NULL, 1, NULL)
INSERT [dbo].[Proizvod] ([IDProizvod], [Naziv], [Opis], [KolicinaNaSkladistu], [Cijena], [PotkategorijaID], [KategorijaID], [Slika]) VALUES (4, N'Miš RAZER Basilisk Ultimate', N'optički, 20000dpi, crni, USB', 4, 1357.0000, 2, 2, NULL)
INSERT [dbo].[Proizvod] ([IDProizvod], [Naziv], [Opis], [KolicinaNaSkladistu], [Cijena], [PotkategorijaID], [KategorijaID], [Slika]) VALUES (5, N'Tipkovnica RAZER Huntsman V2 Analog', N'Analog Switch, RGB, UK + HR Layout, USB', 5, 1999.0000, 1, 2, NULL)
INSERT [dbo].[Proizvod] ([IDProizvod], [Naziv], [Opis], [KolicinaNaSkladistu], [Cijena], [PotkategorijaID], [KategorijaID], [Slika]) VALUES (6, N'Vodeno hlađenje NZXT Kraken X73', N'socket 1200/115X/1366/2011/2011-3/2066/AM4/sTRX4/TR4', 4, 2199.9900, 13, 9, N'1.jpg')
INSERT [dbo].[Proizvod] ([IDProizvod], [Naziv], [Opis], [KolicinaNaSkladistu], [Cijena], [PotkategorijaID], [KategorijaID], [Slika]) VALUES (7, N'Tvrdi disk 10000 GB TOSHIBA MG06ACA10TE', N'SATA, 256MB cache, 3.5", 7200 okr./min za server', 10, 3549.9900, 8, 8, N'2.jpg')
INSERT [dbo].[Proizvod] ([IDProizvod], [Naziv], [Opis], [KolicinaNaSkladistu], [Cijena], [PotkategorijaID], [KategorijaID], [Slika]) VALUES (8, N'Tipkovnica RAZER BlackWidow V3 Pro', N'bežična, mehanička, Green, RGB, UK+HR Layout, crna, USB', 4, 1850.0000, 1, 2, N'3.jpg')
INSERT [dbo].[Proizvod] ([IDProizvod], [Naziv], [Opis], [KolicinaNaSkladistu], [Cijena], [PotkategorijaID], [KategorijaID], [Slika]) VALUES (9, N'Tipkovnica ASUS ROG Claymore II', N'RGB, mehanička, US Layout, crna, USB', 2, 1775.0000, 1, 2, N'4.jpg')
INSERT [dbo].[Proizvod] ([IDProizvod], [Naziv], [Opis], [KolicinaNaSkladistu], [Cijena], [PotkategorijaID], [KategorijaID], [Slika]) VALUES (10, N'Miš RAZER Naga Pro', N'optički, bežični, 20000dpi, crni, USB', 5, 1230.0000, 2, 2, N'5.jpg')
INSERT [dbo].[Proizvod] ([IDProizvod], [Naziv], [Opis], [KolicinaNaSkladistu], [Cijena], [PotkategorijaID], [KategorijaID], [Slika]) VALUES (11, N'Miš RAZER Viper Ultimate Quartz', N'optički, 20000 dpi, rozi, bežični, USB', 3, 1215.0000, 2, 2, N'6.jpg')
INSERT [dbo].[Proizvod] ([IDProizvod], [Naziv], [Opis], [KolicinaNaSkladistu], [Cijena], [PotkategorijaID], [KategorijaID], [Slika]) VALUES (12, N'Podloga za miš, LOGITECH G840 XL', N'LoL Edition, Gaming, platnena, za miš i tipkovnicu', 4, 375.5500, 3, 2, N'7.jpg')
INSERT [dbo].[Proizvod] ([IDProizvod], [Naziv], [Opis], [KolicinaNaSkladistu], [Cijena], [PotkategorijaID], [KategorijaID], [Slika]) VALUES (13, N'Podloga za miš, LOGITECH G840 XL', N'LoL Edition, Gaming, platnena, za miš i tipkovnicu', 4, 375.5500, 3, 2, N'7.jpg')
INSERT [dbo].[Proizvod] ([IDProizvod], [Naziv], [Opis], [KolicinaNaSkladistu], [Cijena], [PotkategorijaID], [KategorijaID], [Slika]) VALUES (15, N'Zvučnici LOGITECH Z200', N'2.0, 5W, bijeli', 4, 249.0000, 4, 2, N'10.jpg')
INSERT [dbo].[Proizvod] ([IDProizvod], [Naziv], [Opis], [KolicinaNaSkladistu], [Cijena], [PotkategorijaID], [KategorijaID], [Slika]) VALUES (16, N'Zvučnici TRUST GXT 635 Rumax, 2.1', N'RGB, 40W, Bluetooth, crni', 1, 623.0000, 4, 2, N'11.jpg')
INSERT [dbo].[Proizvod] ([IDProizvod], [Naziv], [Opis], [KolicinaNaSkladistu], [Cijena], [PotkategorijaID], [KategorijaID], [Slika]) VALUES (17, N'Slušalice HyperX Cloud Alpha S Gaming', N'HX-HSCAS-BL/WW, crno-plave', 2, 799.0000, 5, 2, N'12.jpg')
INSERT [dbo].[Proizvod] ([IDProizvod], [Naziv], [Opis], [KolicinaNaSkladistu], [Cijena], [PotkategorijaID], [KategorijaID], [Slika]) VALUES (18, N'Slušalice HyperX Gaming Earphones', N'X-HSCEB-RD Cloud Earbuds, stereo, in-ear, mikrofon, crne', 3, 287.0000, 5, 2, N'13.jpg')
INSERT [dbo].[Proizvod] ([IDProizvod], [Naziv], [Opis], [KolicinaNaSkladistu], [Cijena], [PotkategorijaID], [KategorijaID], [Slika]) VALUES (19, N'Mikrofon KINGSTON HyperX QuadCast HX-MICQC-BK', N'stolni, crno-crveni', 1, 648.9900, 6, 2, N'14.jpg')
INSERT [dbo].[Proizvod] ([IDProizvod], [Naziv], [Opis], [KolicinaNaSkladistu], [Cijena], [PotkategorijaID], [KategorijaID], [Slika]) VALUES (20, N'Mikrofon HyperX SoloCast HMIS1X-XX-BK/G', N'stolni, crni', 2, 298.9900, 6, 2, N'15.jpg')
INSERT [dbo].[Proizvod] ([IDProizvod], [Naziv], [Opis], [KolicinaNaSkladistu], [Cijena], [PotkategorijaID], [KategorijaID], [Slika]) VALUES (21, N'Web kamera LOGITECH HD WebCam BRIO Stream', N'4K UHD, XSplit licenca, USB 3.0, crna', 1, 1199.0000, 7, 2, N'16.jpg')
INSERT [dbo].[Proizvod] ([IDProizvod], [Naziv], [Opis], [KolicinaNaSkladistu], [Cijena], [PotkategorijaID], [KategorijaID], [Slika]) VALUES (22, N'Web kamera TRUST Spotlight Pro', N'USB', 4, 184.9900, 7, 2, N'17.jpg')
INSERT [dbo].[Proizvod] ([IDProizvod], [Naziv], [Opis], [KolicinaNaSkladistu], [Cijena], [PotkategorijaID], [KategorijaID], [Slika]) VALUES (23, N'Tvrdi disk 1000 GB Blue Mobile WESTERN DIGITAL', N'WD10SPZX, SATA3, 128MB cache, 5400 okr./min, 2.5", za laptop', 7, 378.9900, 8, 8, N'18.jpg')
INSERT [dbo].[Proizvod] ([IDProizvod], [Naziv], [Opis], [KolicinaNaSkladistu], [Cijena], [PotkategorijaID], [KategorijaID], [Slika]) VALUES (24, N'Tvrdi disk 10000 GB WESTERN DIGITAL Gold', N'WD102KRYZ, SATA, 256MB cache, 7200okr./min, 3.5", za desktop', 4, 2379.0000, 8, 8, N'19.jpg')
INSERT [dbo].[Proizvod] ([IDProizvod], [Naziv], [Opis], [KolicinaNaSkladistu], [Cijena], [PotkategorijaID], [KategorijaID], [Slika]) VALUES (25, N'SSD 240 GB KINGSTON A400 SA400S37/240G', N'SATA3, 2.5", maks do 500/350 MB/s', 2, 264.0000, 9, 8, N'20.jpg')
INSERT [dbo].[Proizvod] ([IDProizvod], [Naziv], [Opis], [KolicinaNaSkladistu], [Cijena], [PotkategorijaID], [KategorijaID], [Slika]) VALUES (26, N'SSD 250 GB KINGSTON KC2500', N'SKC2500M8/250G, M.2/NVMe, 2280, maks 3200/1200 MB/s', 5, 379.0000, 9, 7, N'21.jpg')
INSERT [dbo].[Proizvod] ([IDProizvod], [Naziv], [Opis], [KolicinaNaSkladistu], [Cijena], [PotkategorijaID], [KategorijaID], [Slika]) VALUES (27, N'SSD 1000 GB CRUCIAL BX500, CT1000BX500SSD1', N'SATA 3, 2.5", maks do 540/500 MB/s', 2, 721.0000, 9, 8, N'22.jpg')
INSERT [dbo].[Proizvod] ([IDProizvod], [Naziv], [Opis], [KolicinaNaSkladistu], [Cijena], [PotkategorijaID], [KategorijaID], [Slika]) VALUES (28, N'Memorija PC-19200, 8 GB, G.SKILL Ripjaws 4 series', N'4-2400C15D-8GRR, DDR4 2400MHz, kit 2x4GB', 6, 261.9900, 10, 8, N'23.jpg')
INSERT [dbo].[Proizvod] ([IDProizvod], [Naziv], [Opis], [KolicinaNaSkladistu], [Cijena], [PotkategorijaID], [KategorijaID], [Slika]) VALUES (29, N'Memorija PC-26600, 16 GB, GIGABYTE GP-ARS16G33 Aorus RGB', N'DDR4 3333MHz, kit 2x8GB', 2, 749.0000, 10, 8, N'24.png')
INSERT [dbo].[Proizvod] ([IDProizvod], [Naziv], [Opis], [KolicinaNaSkladistu], [Cijena], [PotkategorijaID], [KategorijaID], [Slika]) VALUES (30, N'Memorija PC-28800, 16 GB, G.SKILL Trident Z Royal', N'F4-3600C16D-16GTRGC, DDR4 3600MHz, kit 2x8GB', 2, 860.0000, 10, 8, N'25.jpg')
INSERT [dbo].[Proizvod] ([IDProizvod], [Naziv], [Opis], [KolicinaNaSkladistu], [Cijena], [PotkategorijaID], [KategorijaID], [Slika]) VALUES (31, N'Ventilator ARCTIC BioniX F140 PWM PST', N'140mm, 1800 okr/min, crveni', 4, 69.0000, 11, 9, N'26.jpg')
INSERT [dbo].[Proizvod] ([IDProizvod], [Naziv], [Opis], [KolicinaNaSkladistu], [Cijena], [PotkategorijaID], [KategorijaID], [Slika]) VALUES (32, N'PC test', N'123', 2, 400.0000, 2, 2, N'6.jpg')
SET IDENTITY_INSERT [dbo].[Proizvod] OFF
GO
ALTER TABLE [dbo].[Potkategorija]  WITH CHECK ADD  CONSTRAINT [FK_Potkategorija_Kategorija] FOREIGN KEY([KategorijaID])
REFERENCES [dbo].[Kategorija] ([IDKategorija])
GO
ALTER TABLE [dbo].[Potkategorija] CHECK CONSTRAINT [FK_Potkategorija_Kategorija]
GO
ALTER TABLE [dbo].[Proizvod]  WITH CHECK ADD  CONSTRAINT [FK_Proizvod_Kategorija] FOREIGN KEY([KategorijaID])
REFERENCES [dbo].[Kategorija] ([IDKategorija])
GO
ALTER TABLE [dbo].[Proizvod] CHECK CONSTRAINT [FK_Proizvod_Kategorija]
GO
ALTER TABLE [dbo].[Proizvod]  WITH CHECK ADD  CONSTRAINT [FK_Proizvod_Potkategorija] FOREIGN KEY([PotkategorijaID])
REFERENCES [dbo].[Potkategorija] ([IDPotkategorija])
GO
ALTER TABLE [dbo].[Proizvod] CHECK CONSTRAINT [FK_Proizvod_Potkategorija]
GO
USE [master]
GO
ALTER DATABASE [Trgovina] SET  READ_WRITE 
GO
