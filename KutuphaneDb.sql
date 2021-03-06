USE [master]
GO
/****** Object:  Database [Kütüphane]    Script Date: 16.02.2022 14:12:44 ******/
CREATE DATABASE [Kütüphane]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Kütüphane', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Kütüphane.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Kütüphane_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Kütüphane_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Kütüphane] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Kütüphane].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Kütüphane] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Kütüphane] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Kütüphane] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Kütüphane] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Kütüphane] SET ARITHABORT OFF 
GO
ALTER DATABASE [Kütüphane] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Kütüphane] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Kütüphane] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Kütüphane] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Kütüphane] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Kütüphane] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Kütüphane] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Kütüphane] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Kütüphane] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Kütüphane] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Kütüphane] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Kütüphane] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Kütüphane] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Kütüphane] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Kütüphane] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Kütüphane] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Kütüphane] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Kütüphane] SET RECOVERY FULL 
GO
ALTER DATABASE [Kütüphane] SET  MULTI_USER 
GO
ALTER DATABASE [Kütüphane] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Kütüphane] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Kütüphane] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Kütüphane] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Kütüphane] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Kütüphane] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Kütüphane', N'ON'
GO
ALTER DATABASE [Kütüphane] SET QUERY_STORE = OFF
GO
USE [Kütüphane]
GO
/****** Object:  Table [dbo].[GorevliGiris]    Script Date: 16.02.2022 14:12:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GorevliGiris](
	[GorevliTc] [nchar](11) NULL,
	[GorevliSifre] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Görevliler]    Script Date: 16.02.2022 14:12:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Görevliler](
	[GorevliNo] [int] IDENTITY(1,1) NOT NULL,
	[GorevliAdSoyad] [varchar](50) NULL,
	[DogumTarihi] [varchar](50) NULL,
	[Cinsiyet] [varchar](50) NULL,
	[Telefon] [nchar](10) NULL,
	[Mail] [varchar](50) NULL,
	[Adres] [varchar](50) NULL,
 CONSTRAINT [PK_Görevliler] PRIMARY KEY CLUSTERED 
(
	[GorevliNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kitaplar]    Script Date: 16.02.2022 14:12:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kitaplar](
	[KitapNo] [int] IDENTITY(1,1) NOT NULL,
	[KitapAdi] [varchar](50) NULL,
	[YazarAdi] [varchar](50) NULL,
	[Tur] [varchar](50) NULL,
	[KitapSayfaSayisi] [int] NULL,
	[KitapBasimYili] [varchar](50) NULL,
	[KitapYayinEvi] [varchar](50) NULL,
	[KitapAdet] [int] NULL,
 CONSTRAINT [PK_Kitaplar] PRIMARY KEY CLUSTERED 
(
	[KitapNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Odunc]    Script Date: 16.02.2022 14:12:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Odunc](
	[OduncNo] [int] IDENTITY(1,1) NOT NULL,
	[OgrenciNo] [int] NULL,
	[KitapNo] [int] NULL,
	[VerilisTarihi] [varchar](50) NULL,
	[TeslimTarihi] [varchar](50) NULL,
	[GorevliNo] [int] NULL,
 CONSTRAINT [PK_Odunc] PRIMARY KEY CLUSTERED 
(
	[OduncNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ogrenci_Giris]    Script Date: 16.02.2022 14:12:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ogrenci_Giris](
	[OgrNo] [int] NULL,
	[Sifre] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ogrenciler]    Script Date: 16.02.2022 14:12:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ogrenciler](
	[OgrNo] [int] IDENTITY(1,1) NOT NULL,
	[OgrAdSoyad] [varchar](50) NULL,
	[DogumTarihi] [varchar](50) NULL,
	[Cinsiyet] [varchar](50) NULL,
	[Telefon] [nchar](10) NULL,
	[Mail] [varchar](50) NULL,
	[Adres] [varchar](50) NULL,
 CONSTRAINT [PK_Ogrenciler] PRIMARY KEY CLUSTERED 
(
	[OgrNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[GorevliGiris] ([GorevliTc], [GorevliSifre]) VALUES (N'111        ', N'123')
INSERT [dbo].[GorevliGiris] ([GorevliTc], [GorevliSifre]) VALUES (N'222        ', N'123')
GO
SET IDENTITY_INSERT [dbo].[Görevliler] ON 

INSERT [dbo].[Görevliler] ([GorevliNo], [GorevliAdSoyad], [DogumTarihi], [Cinsiyet], [Telefon], [Mail], [Adres]) VALUES (1, N'Rükna Kavraş', N'23.01.1997', N'Kadın', N'05555     ', N'rük@gmail.com', N'Sancaktepe')
INSERT [dbo].[Görevliler] ([GorevliNo], [GorevliAdSoyad], [DogumTarihi], [Cinsiyet], [Telefon], [Mail], [Adres]) VALUES (2, N'Öykü Çelik', N'05.04.1994', N'Kadın', N'0444      ', N'Oyku@gmail.com', N'Bolu')
INSERT [dbo].[Görevliler] ([GorevliNo], [GorevliAdSoyad], [DogumTarihi], [Cinsiyet], [Telefon], [Mail], [Adres]) VALUES (3, N'Kenan Öz', N'04.05.1990', N'Erkek', N'0333      ', N'Kenan@Gmail.com', N'İstanbul')
INSERT [dbo].[Görevliler] ([GorevliNo], [GorevliAdSoyad], [DogumTarihi], [Cinsiyet], [Telefon], [Mail], [Adres]) VALUES (4, N'Ahmet Efe', N'05.07.1998', N'Erkek', N'0666      ', N'ahmet@gmail.com', N'Samsun')
INSERT [dbo].[Görevliler] ([GorevliNo], [GorevliAdSoyad], [DogumTarihi], [Cinsiyet], [Telefon], [Mail], [Adres]) VALUES (5, N'Ece Şahin', N'03.09.2005', N'kAIN', N'077       ', N'ECE@GMAİL.COM', N'Ordu')
SET IDENTITY_INSERT [dbo].[Görevliler] OFF
GO
SET IDENTITY_INSERT [dbo].[Kitaplar] ON 

INSERT [dbo].[Kitaplar] ([KitapNo], [KitapAdi], [YazarAdi], [Tur], [KitapSayfaSayisi], [KitapBasimYili], [KitapYayinEvi], [KitapAdet]) VALUES (1, N'Ekmek Kavgası', N'Orhan Kemal', N'Öykü Kitabı', 148, N'2000', N'Everest Yayınları', 3)
INSERT [dbo].[Kitaplar] ([KitapNo], [KitapAdi], [YazarAdi], [Tur], [KitapSayfaSayisi], [KitapBasimYili], [KitapYayinEvi], [KitapAdet]) VALUES (2, N'Merhamet', N'Kemal Sayar', N'Psikoloji ', 300, N'2001', N'Kapı Yayınları', 1)
INSERT [dbo].[Kitaplar] ([KitapNo], [KitapAdi], [YazarAdi], [Tur], [KitapSayfaSayisi], [KitapBasimYili], [KitapYayinEvi], [KitapAdet]) VALUES (3, N'Beyaz Geceler', N'Dostoyevski', N'Roman', 88, N'2004', N'Ithaki Yayın', 4)
INSERT [dbo].[Kitaplar] ([KitapNo], [KitapAdi], [YazarAdi], [Tur], [KitapSayfaSayisi], [KitapBasimYili], [KitapYayinEvi], [KitapAdet]) VALUES (4, N'Göğe Bakma Durağı', N'Turgut Uyar', N'Şiir', 112, N'2005', N'Yapı Kredi Yayınları', 3)
INSERT [dbo].[Kitaplar] ([KitapNo], [KitapAdi], [YazarAdi], [Tur], [KitapSayfaSayisi], [KitapBasimYili], [KitapYayinEvi], [KitapAdet]) VALUES (5, N'Şehir Mektupları', N'Ahmet Rasim', N'Gezi', 168, N'2004', N'Karanfil', 2)
INSERT [dbo].[Kitaplar] ([KitapNo], [KitapAdi], [YazarAdi], [Tur], [KitapSayfaSayisi], [KitapBasimYili], [KitapYayinEvi], [KitapAdet]) VALUES (6, N'Mavi Kanatlar', N'Jef Aerts', N'Roman', 300, N'2001', N'Karanfil', 3)
SET IDENTITY_INSERT [dbo].[Kitaplar] OFF
GO
SET IDENTITY_INSERT [dbo].[Odunc] ON 

INSERT [dbo].[Odunc] ([OduncNo], [OgrenciNo], [KitapNo], [VerilisTarihi], [TeslimTarihi], [GorevliNo]) VALUES (1, 1, 1, N'05.02.2022', N'15.02.2022', 2)
INSERT [dbo].[Odunc] ([OduncNo], [OgrenciNo], [KitapNo], [VerilisTarihi], [TeslimTarihi], [GorevliNo]) VALUES (2, 2, 1, N'06.01.2022', N'16.03.2022', 3)
INSERT [dbo].[Odunc] ([OduncNo], [OgrenciNo], [KitapNo], [VerilisTarihi], [TeslimTarihi], [GorevliNo]) VALUES (3, 3, 3, N'02.02.2022', N'10.02.2022', 4)
INSERT [dbo].[Odunc] ([OduncNo], [OgrenciNo], [KitapNo], [VerilisTarihi], [TeslimTarihi], [GorevliNo]) VALUES (4, 2, 5, N'15.04.2020', N'25.06.2020', 1)
SET IDENTITY_INSERT [dbo].[Odunc] OFF
GO
INSERT [dbo].[Ogrenci_Giris] ([OgrNo], [Sifre]) VALUES (111, N'123')
INSERT [dbo].[Ogrenci_Giris] ([OgrNo], [Sifre]) VALUES (222, N'123')
GO
SET IDENTITY_INSERT [dbo].[Ogrenciler] ON 

INSERT [dbo].[Ogrenciler] ([OgrNo], [OgrAdSoyad], [DogumTarihi], [Cinsiyet], [Telefon], [Mail], [Adres]) VALUES (1, N' Kübra Şahin', N'05.06.1998', N'Kadın', N'055555    ', N'kubra@gmail.com', N'Ümraniye')
INSERT [dbo].[Ogrenciler] ([OgrNo], [OgrAdSoyad], [DogumTarihi], [Cinsiyet], [Telefon], [Mail], [Adres]) VALUES (2, N'Rükna Kavraş', N'23.01.1997', N'Kadın', N'044444    ', N'rukna@gmail.com', N'Sancaktepe')
INSERT [dbo].[Ogrenciler] ([OgrNo], [OgrAdSoyad], [DogumTarihi], [Cinsiyet], [Telefon], [Mail], [Adres]) VALUES (3, N'Nihan Şen', N'08.03.1996', N'Kadın', N'033333    ', N'nihan@gmail.com', N'Sinop')
SET IDENTITY_INSERT [dbo].[Ogrenciler] OFF
GO
ALTER TABLE [dbo].[Odunc]  WITH CHECK ADD  CONSTRAINT [FK_Odunc_Görevliler] FOREIGN KEY([GorevliNo])
REFERENCES [dbo].[Görevliler] ([GorevliNo])
GO
ALTER TABLE [dbo].[Odunc] CHECK CONSTRAINT [FK_Odunc_Görevliler]
GO
ALTER TABLE [dbo].[Odunc]  WITH CHECK ADD  CONSTRAINT [FK_Odunc_Kitaplar] FOREIGN KEY([KitapNo])
REFERENCES [dbo].[Kitaplar] ([KitapNo])
GO
ALTER TABLE [dbo].[Odunc] CHECK CONSTRAINT [FK_Odunc_Kitaplar]
GO
ALTER TABLE [dbo].[Odunc]  WITH CHECK ADD  CONSTRAINT [FK_Odunc_Ogrenciler] FOREIGN KEY([OgrenciNo])
REFERENCES [dbo].[Ogrenciler] ([OgrNo])
GO
ALTER TABLE [dbo].[Odunc] CHECK CONSTRAINT [FK_Odunc_Ogrenciler]
GO
/****** Object:  StoredProcedure [dbo].[G_ara]    Script Date: 16.02.2022 14:12:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[G_ara]
@GorevliAdSoyad nvarchar(50)
AS
SELECT * FROM Görevliler  WHERE GorevliAdSoyad=@GorevliAdSoyad 
GO
/****** Object:  StoredProcedure [dbo].[G_sil]    Script Date: 16.02.2022 14:12:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[G_sil] 
@GorevliNo int as begin
delete from Görevliler where GorevliNo=@GorevliNo end
GO
/****** Object:  StoredProcedure [dbo].[G_yenile]    Script Date: 16.02.2022 14:12:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[G_yenile](
@GorevliNo int,
@GorevliAdSoyad varchar(50),
@DogumTarihi varchar(50),
@Cinsiyet varchar(50),
@Telefon nchar(10),
@Mail varchar(50),
@Adres varchar(50)
)

as begin 
update Görevliler set 
GorevliAdSoyad=@GorevliAdSoyad,DogumTarihi=@DogumTarihi,Cinsiyet=@Cinsiyet,Telefon=@Telefon,Mail=@Mail,Adres=@Adres
 where GorevliNo=@GorevliNo end
GO
/****** Object:  StoredProcedure [dbo].[GorevliEkle]    Script Date: 16.02.2022 14:12:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GorevliEkle](
@GorevliAdSoyad varchar(50),
@DogumTarihi varchar(50),
@Cinsiyet varchar(50),
@Telefon nchar(10),
@Mail varchar(50),
@Adres varchar(50)
)
as begin 
insert into Görevliler(GorevliAdSoyad,DogumTarihi,Cinsiyet,Telefon,Mail,Adres)
values (@GorevliAdSoyad,@DogumTarihi,@Cinsiyet,@Telefon,@Mail,@Adres)
end
GO
/****** Object:  StoredProcedure [dbo].[GorevliGir]    Script Date: 16.02.2022 14:12:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GorevliGir](
@GorevliTc nchar(11),
@GorevliSifre varchar(50)
)
as begin select * from GorevliGiris where GorevliTc=@GorevliTc and GorevliSifre=@GorevliSifre
end 
GO
/****** Object:  StoredProcedure [dbo].[GorevliListele]    Script Date: 16.02.2022 14:12:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GorevliListele]
as begin select * from Görevliler
end
GO
/****** Object:  StoredProcedure [dbo].[Kitap_ara]    Script Date: 16.02.2022 14:12:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Kitap_ara]
@KitapAdi nvarchar(50)
AS
SELECT * FROM Kitaplar  WHERE KitapAdi=@KitapAdi
GO
/****** Object:  StoredProcedure [dbo].[Kitap_sil]    Script Date: 16.02.2022 14:12:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Kitap_sil] 
@KitapNo int as begin
delete from Kitaplar where KitapNo=@KitapNo end
GO
/****** Object:  StoredProcedure [dbo].[Kitap_yenile]    Script Date: 16.02.2022 14:12:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Kitap_yenile](
@KitapNo int,
@KitapAdi varchar(50),
@YazarAdi varchar(50),
@Tur varchar(50),
@KitapSayfaSayisi int,
@KitapBasimYili varchar(50),
@KitapYayinEvi varchar(50),
@KitapAdet int
)

as begin 
update Kitaplar set 
KitapAdi=@KitapAdi,YazarAdi=@YazarAdi,Tur=@Tur,KitapSayfaSayisi=@KitapSayfaSayisi,KitapBasimYili=@KitapBasimYili,KitapYayinEvi=@KitapYayinEvi,KitapAdet=@KitapAdet
 where KitapNo=@KitapNo end
GO
/****** Object:  StoredProcedure [dbo].[KitapEkle]    Script Date: 16.02.2022 14:12:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[KitapEkle](
@KitapAdi varchar(50),
@YazarAdi varchar(50),
@Tur varchar(50),
@KitapSayfaSayisi int,
@KitapBasimYili varchar(50),
@KitapYayinEvi varchar(50),
@KitapAdet int
)
as begin 
insert into Kitaplar(KitapAdi,YazarAdi,Tur,KitapSayfaSayisi,KitapBasimYili,KitapYayinEvi,KitapAdet)
values (@KitapAdi,@YazarAdi,@Tur,@KitapSayfaSayisi,@KitapBasimYili,@KitapYayinEvi,@KitapAdet)
end
GO
/****** Object:  StoredProcedure [dbo].[KitapListele]    Script Date: 16.02.2022 14:12:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[KitapListele]
as begin select * from Kitaplar
end
GO
/****** Object:  StoredProcedure [dbo].[Odunc_ara]    Script Date: 16.02.2022 14:12:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Odunc_ara]
@OgrenciNo int
AS
SELECT * FROM Odunc  WHERE OgrenciNo=@OgrenciNo
GO
/****** Object:  StoredProcedure [dbo].[Odunc_Ekle]    Script Date: 16.02.2022 14:12:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Odunc_Ekle](
@OgrenciNo int,
@KitapNo int,
@VerilisTarihi varchar(50),
@TeslimTarihi varchar(50),
@GorevliNo int
)
as begin 
insert into Odunc(OgrenciNo,KitapNo,VerilisTarihi,TeslimTarihi,GorevliNo)
values (@OgrenciNo,@KitapNo,@VerilisTarihi,@TeslimTarihi,@GorevliNo)
end
GO
/****** Object:  StoredProcedure [dbo].[Odunc_Listele]    Script Date: 16.02.2022 14:12:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Odunc_Listele]
as begin select * from Odunc
end
GO
/****** Object:  StoredProcedure [dbo].[Odunc_sil]    Script Date: 16.02.2022 14:12:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Odunc_sil] 
@OduncNo int as begin
delete from Odunc where OduncNo=@OduncNo end
GO
/****** Object:  StoredProcedure [dbo].[Odunc_yenile]    Script Date: 16.02.2022 14:12:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Odunc_yenile](
@OduncNo int,
@OgrenciNo int,
@KitapNo int,
@VerilisTarihi varchar(50),
@TeslimTarihi varchar(50),
@GorevliNo int
)

as begin 
update Odunc set 
OgrenciNo=@OgrenciNo,KitapNo=@KitapNo,VerilisTarihi=@VerilisTarihi,TeslimTarihi=@TeslimTarihi,GorevliNo=@GorevliNo
 where OduncNo=@OduncNo end
GO
/****** Object:  StoredProcedure [dbo].[Ogrenci_sil]    Script Date: 16.02.2022 14:12:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Ogrenci_sil] 
@OgrNo int as begin
delete from Ogrenciler where OgrNo=@OgrNo end
GO
/****** Object:  StoredProcedure [dbo].[Ogrenci_yenile]    Script Date: 16.02.2022 14:12:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Ogrenci_yenile](
@OgrNo int,
@OgrAdSoyad varchar(50),
@DogumTarihi varchar(50),
@Cinsiyet varchar(50),
@Telefon nchar(10),
@Mail varchar(50),
@Adres varchar(50)
)

as begin 
update Ogrenciler set 
OgrAdSoyad=@OgrAdSoyad,DogumTarihi=@DogumTarihi,Cinsiyet=@Cinsiyet,Telefon=@Telefon,Mail=@Mail,Adres=@Adres
 where OgrNo=@OgrNo end
GO
/****** Object:  StoredProcedure [dbo].[OgrenciEkle]    Script Date: 16.02.2022 14:12:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[OgrenciEkle](
@OgrAdSoyad varchar(50),
@DogumTarihi varchar(50),
@Cinsiyet varchar(50),
@Telefon nchar(10),
@Mail varchar(50),
@Adres varchar(50)
)
as begin 
insert into Ogrenciler(OgrAdSoyad,DogumTarihi,Cinsiyet,Telefon,Mail,Adres)
values (@OgrAdSoyad,@DogumTarihi,@Cinsiyet,@Telefon,@Mail,@Adres)
end
GO
/****** Object:  StoredProcedure [dbo].[OgrenciGir]    Script Date: 16.02.2022 14:12:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[OgrenciGir](
@OgrNo int,
@Sifre varchar(50)
)
as begin select * from Ogrenci_Giris where OgrNo=@OgrNo and Sifre=@Sifre 
end 
GO
/****** Object:  StoredProcedure [dbo].[OgrenciListele]    Script Date: 16.02.2022 14:12:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[OgrenciListele]
as begin select * from Ogrenciler
end
GO
/****** Object:  StoredProcedure [dbo].[Ogrnci_ara]    Script Date: 16.02.2022 14:12:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Ogrnci_ara]
@OgrAdSoyad nvarchar(50)
AS
SELECT * FROM Ogrenciler  WHERE OgrAdSoyad=@OgrAdSoyad
GO
USE [master]
GO
ALTER DATABASE [Kütüphane] SET  READ_WRITE 
GO
