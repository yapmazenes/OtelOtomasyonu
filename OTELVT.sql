USE [master]
GO
/****** Object:  Database [OtelOtomasyonu]    Script Date: 15.12.2018 15:00:28 ******/
CREATE DATABASE [OtelOtomasyonu]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OtelOtomasyonu', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.LOCALHOST\MSSQL\DATA\OtelOtomasyonu.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'OtelOtomasyonu_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.LOCALHOST\MSSQL\DATA\OtelOtomasyonu_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [OtelOtomasyonu] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OtelOtomasyonu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OtelOtomasyonu] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OtelOtomasyonu] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OtelOtomasyonu] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OtelOtomasyonu] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OtelOtomasyonu] SET ARITHABORT OFF 
GO
ALTER DATABASE [OtelOtomasyonu] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OtelOtomasyonu] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [OtelOtomasyonu] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OtelOtomasyonu] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OtelOtomasyonu] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OtelOtomasyonu] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OtelOtomasyonu] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OtelOtomasyonu] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OtelOtomasyonu] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OtelOtomasyonu] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OtelOtomasyonu] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OtelOtomasyonu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OtelOtomasyonu] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OtelOtomasyonu] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OtelOtomasyonu] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OtelOtomasyonu] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OtelOtomasyonu] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OtelOtomasyonu] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OtelOtomasyonu] SET RECOVERY FULL 
GO
ALTER DATABASE [OtelOtomasyonu] SET  MULTI_USER 
GO
ALTER DATABASE [OtelOtomasyonu] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OtelOtomasyonu] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OtelOtomasyonu] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OtelOtomasyonu] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
USE [OtelOtomasyonu]
GO
/****** Object:  StoredProcedure [dbo].[prc_BirimTipleri_Delete]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[prc_BirimTipleri_Delete]
@Id int
as
update BirimTipleri set Aktif=0 where Id=@Id


GO
/****** Object:  StoredProcedure [dbo].[prc_BirimTipleri_Insert]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[prc_BirimTipleri_Insert]
@Adi nvarchar(50),
@Aktif bit
as
insert BirimTipleri values (@Adi,@Aktif)



GO
/****** Object:  StoredProcedure [dbo].[prc_BirimTipleri_Select]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_BirimTipleri_Select]
as
select * from BirimTipleri where Aktif=1

GO
/****** Object:  StoredProcedure [dbo].[prc_BirimTipleri_Update]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prc_BirimTipleri_Update]
@Id int,
@Adi nvarchar(50),
@Aktif bit
as
update BirimTipleri set Adi=@Adi where Id=@Id


GO
/****** Object:  StoredProcedure [dbo].[prc_Kasa_Delete]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[prc_Kasa_Delete] 
@Id int
as
delete from Kasa where Id=@Id 

GO
/****** Object:  StoredProcedure [dbo].[prc_Kasa_Insert]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[prc_Kasa_Insert]
@Adi nvarchar(50),
@Aciklama nvarchar(500),
@Aktif bit
as
if(@Adi is not NULL AND @Aciklama is not NULL)
BEGIN
insert Kasa values(@Adi,@Aciklama,@Aktif)
END

GO
/****** Object:  StoredProcedure [dbo].[prc_Kasa_Select]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_Kasa_Select]
as
select * from Kasa where Aktif=1

GO
/****** Object:  StoredProcedure [dbo].[prc_Kasa_Update]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[prc_Kasa_Update]
@Id int,
@Adi nvarchar(50),
@Aciklama nvarchar(250),
@Aktif bit
as
Update Kasa set Adi=@Adi,Aciklama=@Aciklama,Aktif=@Aktif where Id=@Id

GO
/****** Object:  StoredProcedure [dbo].[prc_KasaHareketleri_Select]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prc_KasaHareketleri_Select]
as
select k.Adi,kh.Tutar,kh.Tarih from KasaHareketleri kh inner join Kasa k on kh.KasaID=k.Id 
								 

GO
/****** Object:  StoredProcedure [dbo].[prc_KasaHareketTip_Delete]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[prc_KasaHareketTip_Delete]
@Id int
as

update  KasaHareketTip set Aktif=0 where Id=@Id 
GO
/****** Object:  StoredProcedure [dbo].[prc_KasaHareketTip_Insert]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prc_KasaHareketTip_Insert]
@Adi nvarchar(50),
@Aktif  bit 

as
insert KasaHareketTip(Adi,Aktif) values(@Adi,1)



GO
/****** Object:  StoredProcedure [dbo].[prc_KasaHareketTip_Select]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[prc_KasaHareketTip_Select]
as
select * from KasaHareketTip where Aktif=1


GO
/****** Object:  StoredProcedure [dbo].[prc_KasaHareketTip_Update]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[prc_KasaHareketTip_Update]
@Id int,
@Adi nvarchar(50),
@Aktif bit
as
update KasaHareketTip set Adi=@Adi where Id=@Id


GO
/****** Object:  StoredProcedure [dbo].[prc_Kategoriler_Delete]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[prc_Kategoriler_Delete]
@Id int
as

update  Kategoriler set Aktif=0 where Id=@Id 
GO
/****** Object:  StoredProcedure [dbo].[prc_Kategoriler_Insert]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[prc_Kategoriler_Insert]
@Adi nvarchar(50),
@Aktif bit 
as 
insert Kategoriler values(@Adi,@Aktif)	


GO
/****** Object:  StoredProcedure [dbo].[prc_Kategoriler_Select]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_Kategoriler_Select]
as
select * from Kategoriler where Aktif=1

GO
/****** Object:  StoredProcedure [dbo].[prc_Kategoriler_Update]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_Kategoriler_Update]
@Id int,
@Adi nvarchar(50)
as
update Kategoriler set Adi=@Adi where Id=@Id

GO
/****** Object:  StoredProcedure [dbo].[prc_Musteriler_Delete]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[prc_Musteriler_Delete]
@Id int
as

update Insan set Aktif=0 where Id=@Id 
GO
/****** Object:  StoredProcedure [dbo].[prc_Musteriler_Insert]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_Musteriler_Insert]
@SirketAdi nvarchar(50),
@MedeniDurum tinyint,
@Adi nvarchar(50),
@Soyadi nvarchar(50),
@Tckn char(11),
@TelNo char(14),
@Adres nvarchar(500) =NULL,	
@DogumTarihi date,
@Cinsiyet tinyint,
@Aktif bit
as
insert into dbo.Insan(Adi,Soyadi,Tckn,TelNo,DogumTarihi,Cinsiyet,Aktif) values(@Adi,@Soyadi,@Tckn,@TelNo,@DogumTarihi,@Cinsiyet,@Aktif)
declare @sonID int
set @sonID=@@IDENTITY
insert Musteriler(Id,SirketAdi,MedeniDurum) values(@sonID,@SirketAdi,@MedeniDurum)


GO
/****** Object:  StoredProcedure [dbo].[prc_Musteriler_Select]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_Musteriler_Select]
as
Select 
m.Id,Adi,Soyadi,SirketAdi,Tckn,TelNo,DogumTarihi,
case MedeniDurum
when 1 then 'Bekar'
when 2 then 'Evli'
end as MedeniDurum
,
case Cinsiyet
when 1 then 'Kadın'
when 2 then 'Erkek'
end as Cinsiyet
from Musteriler m join Insan i on m.Id=i.Id where i.Aktif=1


GO
/****** Object:  StoredProcedure [dbo].[prc_Musteriler_Update]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[prc_Musteriler_Update]
@SirketAdi nvarchar(50),
@MedeniDurum tinyint,
@Id int,
@Adi nvarchar(50),
@Soyadi nvarchar(50),
@Tckn char(11),
@TelNo char(14),
@Adres nvarchar(500) =NULL,	
@DogumTarihi date,
@Cinsiyet tinyint,
@Aktif bit
as
update dbo.Insan set Adi=@Adi, Soyadi=@Soyadi,Tckn= @Tckn,TelNo=@TelNo,DogumTarihi=@DogumTarihi,Cinsiyet=@Cinsiyet where Id=@Id

update Musteriler  set SirketAdi=@SirketAdi,MedeniDurum=@MedeniDurum where Id =@Id
GO
/****** Object:  StoredProcedure [dbo].[prc_Odalar_Delete]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[prc_Odalar_Delete]
@Id int
as

update Odalar set Aktif=0 where Id=@Id 
GO
/****** Object:  StoredProcedure [dbo].[prc_Odalar_Insert]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[prc_Odalar_Insert]
@Adi nvarchar(50),
@Aciklama nvarchar(50),
@OdaTurID int,
@Aktif bit
as
insert Odalar values(@Adi,@Aciklama,@OdaTurID,@Aktif)


GO
/****** Object:  StoredProcedure [dbo].[prc_Odalar_Select]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_Odalar_Select]
as
select o.Id ,o.Adi,o.Aciklama,ot.Adi as OdaTürü,o.Aktif   from Odalar o join OdaTurleri ot on o.OdaTurID=ot.Id


GO
/****** Object:  StoredProcedure [dbo].[prc_Odalar_Update]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[prc_Odalar_Update]
@Id int,
@Adi nvarchar(50),
@Aciklama nvarchar(50),
@OdaTurID int,
@Aktif bit
as
update Odalar set Adi=@Adi,Aciklama=@Aciklama,OdaTurID=@OdaTurID,Aktif=@Aktif where Id=@Id

GO
/****** Object:  StoredProcedure [dbo].[prc_OdaOzellikleri_Insert]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[prc_OdaOzellikleri_Insert]
@OdaID int,
@OzellikID int,
@Deger smallint
as
insert OdaOzellikleri values(@OdaID,@OzellikID,@Deger)

GO
/****** Object:  StoredProcedure [dbo].[prc_OdaTurleri_Delete]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[prc_OdaTurleri_Delete]
@Id int
as
update OdaTurleri set Aktif=0 where Id=@Id 
GO
/****** Object:  StoredProcedure [dbo].[prc_OdaTurleri_Insert]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_OdaTurleri_Insert]
@Adi nvarchar(50),
@Aciklama nvarchar(50),
@Aktif bit
as
insert OdaTurleri values (@Adi,@Aciklama,@Aktif)


GO
/****** Object:  StoredProcedure [dbo].[prc_OdaTurleri_Select]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_OdaTurleri_Select]
as
select * from OdaTurleri where Aktif=1


GO
/****** Object:  StoredProcedure [dbo].[prc_OdaTurleri_Update]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_OdaTurleri_Update]
@Id int,
@Adi nvarchar(50),
@Aciklama nvarchar(50),
@Aktif bit
as
Update OdaTurleri set Adi=@Adi,Aciklama=@Aciklama,Aktif=@Aktif where Id=@Id

GO
/****** Object:  StoredProcedure [dbo].[prc_Ozellikler_Delete]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[prc_Ozellikler_Delete]
@Id int
as
update Ozellikler set Aktif=0 where Id=@Id 
GO
/****** Object:  StoredProcedure [dbo].[prc_Ozellikler_Insert]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[prc_Ozellikler_Insert]
@Adi nvarchar(50),
@Aciklama nvarchar(50),
@Aktif bit
as
insert Ozellikler values(@Adi,@Aciklama,@Aktif)

GO
/****** Object:  StoredProcedure [dbo].[prc_Ozellikler_Select]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_Ozellikler_Select]
as
select * from Ozellikler where Aktif=1


GO
/****** Object:  StoredProcedure [dbo].[prc_Ozellikler_Update]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prc_Ozellikler_Update]
@Id int,
@Adi nvarchar(50),
@Aciklama nvarchar(50),
@Aktif bit
as
update Ozellikler set Adi=@Adi, Aciklama=@Aciklama where Id=@Id
GO
/****** Object:  StoredProcedure [dbo].[prc_Personeller_Delete]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[prc_Personeller_Delete]
@Id int
as

update Insan set Aktif=0 where Id=@Id 
GO
/****** Object:  StoredProcedure [dbo].[prc_Personeller_Giris]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_Personeller_Giris]
@kAdi nvarchar(50),
@kSifre nvarchar(50)
as
select * from Personeller p inner join Insan i on p.Id=i.Id  inner join PersonelDetay dt on dt.PersonelID=p.Id where p.KullaniciAdi=@kAdi and p.Sifre =@kSifre


GO
/****** Object:  StoredProcedure [dbo].[prc_Personeller_Insert]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_Personeller_Insert]
@KullaniciAdi nvarchar(50),
@Sifre nvarchar(50),
@IseGirisTarihi date,
@Maas money,
@Admin bit,
@SatisSayisi int,
@SayisFiyati money,
@Adi nvarchar(50),
@Soyadi nvarchar(50),
@Tckn char(11),
@TelNo char(14),
@Adres nvarchar(500),
@DogumTarihi date,
@Cinsiyet tinyint,
@Aktif bit
as
insert into dbo.Insan(Adi,Soyadi,Tckn,TelNo,Adres,DogumTarihi,Cinsiyet,Aktif) values(@Adi,@Soyadi,@Tckn,@TelNo,@Adres,@DogumTarihi,@Cinsiyet,@Aktif)
declare @sonID int
set @sonID=@@IDENTITY
insert Personeller values(@sonID,@KullaniciAdi,@Sifre,@IseGirisTarihi,@Maas,@Admin)

GO
/****** Object:  StoredProcedure [dbo].[prc_Personeller_Select]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_Personeller_Select]
as
select i.Id,Adi,Soyadi,
case Cinsiyet
when 1 then 'Kadın'
when 2 then 'Erkek'
end as Cinsiyet
,Tckn,TelNo,Adres,DogumTarihi,IseGirisTarihi,Maas,KullaniciAdi,Sifre,OdaSatisSayisi,ToplamSatisFiyati from Personeller p inner join Insan i on p.Id=i.Id inner join PersonelDetay pd on p.Id=pd.PersonelID  where i.Aktif=1 and p.Admin=0


GO
/****** Object:  StoredProcedure [dbo].[prc_Personeller_Update]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prc_Personeller_Update]
@IseGirisTarihi date,
@Maas money,
@KullaniciAdi nvarchar(50),
@Sifre nvarchar(50),
@Admin bit,
@SatisSayisi int,
@SayisFiyati money,
@Id int,
@Adi nvarchar(50),
@Soyadi nvarchar(50),
@Tckn char(11),
@TelNo char(14),
@Adres nvarchar(500),
@DogumTarihi date,
@Cinsiyet tinyint,
@Aktif bit
as
update dbo.Insan set Adi=@Adi, Soyadi=@Soyadi,Tckn= @Tckn,TelNo=@TelNo,DogumTarihi=@DogumTarihi,Cinsiyet=@Cinsiyet,Adres=@Adres where Id=@Id

update Personeller  set KullaniciAdi=@KullaniciAdi,Sifre=@Sifre,IseGirisTarihi=@IseGirisTarihi,Maas=@Maas,Admin=@Admin where Id =@Id
GO
/****** Object:  StoredProcedure [dbo].[prc_Satis_Insert]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prc_Satis_Insert]
 @MusteriID int
,@PersonelID int 
,@OdaID int
,@OdaFiyati money
,@KasaID int

as
Insert into Satis(MusteriID,PersonelID,OdaID,OdaFiyati,KasaID) values(@MusteriID,@PersonelID,@OdaID,@OdaFiyati,@KasaID)


GO
/****** Object:  StoredProcedure [dbo].[prc_Satis_Select]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[prc_Satis_Select]
as
select im.Adi as MüsteriAdi,ip.Adi as PersonelAdi,o.Adi as OdaAdi,s.OdaFiyati,s.SatisTarihi,k.Adi AS KasaAdi   from Satis s join Musteriler m on s.MusteriID=m.Id join Personeller p on s.PersonelID=p.Id join Odalar o on o.Id=s.OdaID join Kasa k on k.Id=s.KasaID inner join Insan im on im.Id=m.Id join Insan ip on ip.Id=p.Id


GO
/****** Object:  StoredProcedure [dbo].[prc_Urunler_Delete]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[prc_Urunler_Delete]
@Id int
as
update Urunler set Aktif=0 where Id=@Id 
GO
/****** Object:  StoredProcedure [dbo].[prc_Urunler_Insert]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_Urunler_Insert]
@Adi nvarchar(50),
@Fiyat money,
@Miktar float,
@KategoriID int,
@BirimTipID int,
@Aktif bit
as
insert Urunler(Adi,Fiyat,Miktar,KategoriID,BirimTipID,Aktif) values(@Adi,@Fiyat,@Miktar,@KategoriID,@BirimTipID,@Aktif)


GO
/****** Object:  StoredProcedure [dbo].[prc_Urunler_Select]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_Urunler_Select]
as
select u.Id,u.Adi,u.Fiyat,u.Miktar,k.Adi as KategoriAdi,b.Adi as BirimTipAdi from Urunler u join Kategoriler k on u.KategoriID=k.Id join BirimTipleri b on b.Id=u.BirimTipID where u.Aktif=1


GO
/****** Object:  StoredProcedure [dbo].[prc_Urunler_Update]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[prc_Urunler_Update]
@Id int,
@Adi nvarchar(50),
@Fiyat money,
@Miktar float,
@KategoriID int,
@BirimTipID int,
@Aktif bit
as
update Urunler set Adi=@Adi,Fiyat=@Fiyat,Miktar=@Miktar,Aktif=@Aktif,KategoriID=@KategoriID,BirimTipID=@BirimTipID where Id=@Id



GO
/****** Object:  Table [dbo].[BirimTipleri]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BirimTipleri](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Aktif] [bit] NOT NULL,
 CONSTRAINT [PK_BirimTipleri] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Insan]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Insan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Soyadi] [nvarchar](50) NOT NULL,
	[Tckn] [char](11) NOT NULL,
	[TelNo] [char](14) NOT NULL,
	[Adres] [nvarchar](500) NULL,
	[DogumTarihi] [date] NOT NULL,
	[Cinsiyet] [tinyint] NOT NULL,
	[Aktif] [bit] NOT NULL,
 CONSTRAINT [PK_Insan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Kasa]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kasa](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Aciklama] [nvarchar](500) NULL,
	[Aktif] [bit] NOT NULL,
 CONSTRAINT [PK_Kasa] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KasaHareketleri]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KasaHareketleri](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[KasaID] [int] NOT NULL,
	[KasaHareketTipID] [int] NOT NULL,
	[Tutar] [money] NOT NULL,
	[Tarih] [datetime] NULL,
 CONSTRAINT [PK_KasaHareketleri] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KasaHareketTip]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KasaHareketTip](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Aktif] [bit] NOT NULL,
 CONSTRAINT [PK_KasaHareketTip] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Kategoriler]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategoriler](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Aktif] [bit] NOT NULL,
 CONSTRAINT [PK_Kategoriler] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Musteriler]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteriler](
	[Id] [int] NOT NULL,
	[SirketAdi] [nvarchar](50) NOT NULL,
	[MedeniDurum] [tinyint] NOT NULL,
 CONSTRAINT [PK_Musteriler_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Odalar]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Odalar](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Aciklama] [nvarchar](50) NULL,
	[OdaTurID] [int] NOT NULL,
	[Aktif] [bit] NOT NULL,
 CONSTRAINT [PK_Odalar] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OdaOzellikleri]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OdaOzellikleri](
	[OdaID] [int] NOT NULL,
	[OzelliklerID] [int] NOT NULL,
	[Deger] [smallint] NOT NULL,
 CONSTRAINT [PK_OdaOzellikleri] PRIMARY KEY CLUSTERED 
(
	[OdaID] ASC,
	[OzelliklerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OdaTurleri]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OdaTurleri](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Aciklama] [nvarchar](50) NULL,
	[Aktif] [bit] NOT NULL,
 CONSTRAINT [PK_OdaTurleri] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ozellikler]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ozellikler](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Aciklama] [nvarchar](50) NOT NULL,
	[Aktif] [bit] NOT NULL,
 CONSTRAINT [PK_Ozellikler] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PersonelDetay]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonelDetay](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonelID] [int] NOT NULL,
	[OdaSatisSayisi] [int] NULL,
	[ToplamSatisFiyati] [money] NULL,
 CONSTRAINT [PK_PersonelDetay] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Personeller]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personeller](
	[Id] [int] NOT NULL,
	[KullaniciAdi] [nvarchar](50) NOT NULL,
	[Sifre] [nvarchar](50) NOT NULL,
	[IseGirisTarihi] [date] NOT NULL,
	[Maas] [money] NOT NULL,
	[Admin] [bit] NULL,
 CONSTRAINT [PK_Personeller] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Satis]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Satis](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MusteriID] [int] NOT NULL,
	[PersonelID] [int] NOT NULL,
	[OdaID] [int] NOT NULL,
	[OdaFiyati] [money] NOT NULL,
	[SatisTarihi] [datetime] NOT NULL,
	[KasaID] [int] NOT NULL,
 CONSTRAINT [PK_Satis] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Urunler]    Script Date: 15.12.2018 15:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urunler](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Fiyat] [money] NOT NULL,
	[Miktar] [float] NOT NULL,
	[KategoriID] [int] NOT NULL,
	[BirimTipID] [int] NOT NULL,
	[Aktif] [bit] NULL,
 CONSTRAINT [PK_Urunler] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[BirimTipleri] ON 

INSERT [dbo].[BirimTipleri] ([Id], [Adi], [Aktif]) VALUES (1, N'Adet', 1)
INSERT [dbo].[BirimTipleri] ([Id], [Adi], [Aktif]) VALUES (2, N'Gram', 1)
INSERT [dbo].[BirimTipleri] ([Id], [Adi], [Aktif]) VALUES (3, N'Litre', 0)
INSERT [dbo].[BirimTipleri] ([Id], [Adi], [Aktif]) VALUES (4, N'Litre', 1)
INSERT [dbo].[BirimTipleri] ([Id], [Adi], [Aktif]) VALUES (5, N'd', 0)
INSERT [dbo].[BirimTipleri] ([Id], [Adi], [Aktif]) VALUES (6, N'dd', 0)
SET IDENTITY_INSERT [dbo].[BirimTipleri] OFF
SET IDENTITY_INSERT [dbo].[Insan] ON 

INSERT [dbo].[Insan] ([Id], [Adi], [Soyadi], [Tckn], [TelNo], [Adres], [DogumTarihi], [Cinsiyet], [Aktif]) VALUES (1, N'Enes', N'Yapmaz', N'25633943432', N'5556065379    ', N'afdsadfdsaf', CAST(0xD81F0B00 AS Date), 1, 1)
INSERT [dbo].[Insan] ([Id], [Adi], [Soyadi], [Tckn], [TelNo], [Adres], [DogumTarihi], [Cinsiyet], [Aktif]) VALUES (2, N'Mehmet', N'Kirazli', N'51531354135', N'(313) 513-5155', N'sadfasdfa', CAST(0xEC1F0B00 AS Date), 2, 1)
INSERT [dbo].[Insan] ([Id], [Adi], [Soyadi], [Tckn], [TelNo], [Adres], [DogumTarihi], [Cinsiyet], [Aktif]) VALUES (3, N'Mehmet', N'Kirazli', N'51531354135', N'(313) 513-5155', N'sadfasdfa', CAST(0xEC1F0B00 AS Date), 1, 0)
INSERT [dbo].[Insan] ([Id], [Adi], [Soyadi], [Tckn], [TelNo], [Adres], [DogumTarihi], [Cinsiyet], [Aktif]) VALUES (4, N'Oguz', N'Ulu', N'23423423423', N'2342342322    ', N'sdfasdf', CAST(0xB6FA0A00 AS Date), 1, 1)
INSERT [dbo].[Insan] ([Id], [Adi], [Soyadi], [Tckn], [TelNo], [Adres], [DogumTarihi], [Cinsiyet], [Aktif]) VALUES (5, N'ada', N'adsa', N'11111111111', N'12111111111111', NULL, CAST(0xD3960A00 AS Date), 1, 1)
INSERT [dbo].[Insan] ([Id], [Adi], [Soyadi], [Tckn], [TelNo], [Adres], [DogumTarihi], [Cinsiyet], [Aktif]) VALUES (6, N'sdafasas', N'fasdfasd', N'12342342342', N'(234) 234-2344', NULL, CAST(0x0B3F0B00 AS Date), 1, 1)
INSERT [dbo].[Insan] ([Id], [Adi], [Soyadi], [Tckn], [TelNo], [Adres], [DogumTarihi], [Cinsiyet], [Aktif]) VALUES (7, N'Musteri', N'dfasfa', N'45324535325', N'(345) 345-3453', NULL, CAST(0x0B3F0B00 AS Date), 2, 1)
INSERT [dbo].[Insan] ([Id], [Adi], [Soyadi], [Tckn], [TelNo], [Adres], [DogumTarihi], [Cinsiyet], [Aktif]) VALUES (8, N'yeni', N'sadfad', N'34534534534', N'(454) 535-3453', NULL, CAST(0x782A0B00 AS Date), 2, 1)
INSERT [dbo].[Insan] ([Id], [Adi], [Soyadi], [Tckn], [TelNo], [Adres], [DogumTarihi], [Cinsiyet], [Aktif]) VALUES (9, N'Ali', N'Can', N'34534534534', N'(454) 535-3453', N'd', CAST(0x782A0B00 AS Date), 2, 1)
INSERT [dbo].[Insan] ([Id], [Adi], [Soyadi], [Tckn], [TelNo], [Adres], [DogumTarihi], [Cinsiyet], [Aktif]) VALUES (10, N'yeni2', N'sadfad1', N'34534534534', N'(454) 535-3453', N'sdgfdgdfgsdgsdgsd', CAST(0x782A0B00 AS Date), 1, 0)
INSERT [dbo].[Insan] ([Id], [Adi], [Soyadi], [Tckn], [TelNo], [Adres], [DogumTarihi], [Cinsiyet], [Aktif]) VALUES (11, N'', N'', N'           ', N'(   )    -    ', N'', CAST(0x0B3F0B00 AS Date), 1, 0)
INSERT [dbo].[Insan] ([Id], [Adi], [Soyadi], [Tckn], [TelNo], [Adres], [DogumTarihi], [Cinsiyet], [Aktif]) VALUES (12, N'', N'', N'           ', N'(   )    -    ', NULL, CAST(0x0B3F0B00 AS Date), 1, 0)
INSERT [dbo].[Insan] ([Id], [Adi], [Soyadi], [Tckn], [TelNo], [Adres], [DogumTarihi], [Cinsiyet], [Aktif]) VALUES (13, N'', N'', N'           ', N'(   )    -    ', NULL, CAST(0x0B3F0B00 AS Date), 1, 0)
SET IDENTITY_INSERT [dbo].[Insan] OFF
SET IDENTITY_INSERT [dbo].[Kasa] ON 

INSERT [dbo].[Kasa] ([Id], [Adi], [Aciklama], [Aktif]) VALUES (1, N'Nakit', N'Nakit Kasa', 1)
INSERT [dbo].[Kasa] ([Id], [Adi], [Aciklama], [Aktif]) VALUES (4, N'DE', N'ADSA', 0)
INSERT [dbo].[Kasa] ([Id], [Adi], [Aciklama], [Aktif]) VALUES (5, N'Taksit', N'Taksit Sistemi ile ', 1)
SET IDENTITY_INSERT [dbo].[Kasa] OFF
SET IDENTITY_INSERT [dbo].[KasaHareketleri] ON 

INSERT [dbo].[KasaHareketleri] ([Id], [KasaID], [KasaHareketTipID], [Tutar], [Tarih]) VALUES (2, 1, 1, 100.0000, CAST(0x0000A9B000000000 AS DateTime))
INSERT [dbo].[KasaHareketleri] ([Id], [KasaID], [KasaHareketTipID], [Tutar], [Tarih]) VALUES (3, 5, 1, 100.0000, CAST(0x0000A9B000000000 AS DateTime))
INSERT [dbo].[KasaHareketleri] ([Id], [KasaID], [KasaHareketTipID], [Tutar], [Tarih]) VALUES (4, 1, 1, 100.0000, CAST(0x0000A9B300000000 AS DateTime))
INSERT [dbo].[KasaHareketleri] ([Id], [KasaID], [KasaHareketTipID], [Tutar], [Tarih]) VALUES (5, 1, 1, 0.0000, CAST(0x0000A9B300000000 AS DateTime))
INSERT [dbo].[KasaHareketleri] ([Id], [KasaID], [KasaHareketTipID], [Tutar], [Tarih]) VALUES (1004, 1, 1, 100.0000, CAST(0x0000A9B500000000 AS DateTime))
INSERT [dbo].[KasaHareketleri] ([Id], [KasaID], [KasaHareketTipID], [Tutar], [Tarih]) VALUES (1005, 1, 1, 300.0000, CAST(0x0000A9B600000000 AS DateTime))
INSERT [dbo].[KasaHareketleri] ([Id], [KasaID], [KasaHareketTipID], [Tutar], [Tarih]) VALUES (1006, 1, 1, 500.0000, CAST(0x0000A9B600000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[KasaHareketleri] OFF
SET IDENTITY_INSERT [dbo].[KasaHareketTip] ON 

INSERT [dbo].[KasaHareketTip] ([Id], [Adi], [Aktif]) VALUES (1, N'Alis', 1)
INSERT [dbo].[KasaHareketTip] ([Id], [Adi], [Aktif]) VALUES (2, N'Alis', 0)
INSERT [dbo].[KasaHareketTip] ([Id], [Adi], [Aktif]) VALUES (3, N'Satis', 1)
SET IDENTITY_INSERT [dbo].[KasaHareketTip] OFF
SET IDENTITY_INSERT [dbo].[Kategoriler] ON 

INSERT [dbo].[Kategoriler] ([Id], [Adi], [Aktif]) VALUES (1, N'Günlük Ürünler', 1)
INSERT [dbo].[Kategoriler] ([Id], [Adi], [Aktif]) VALUES (2, N'Aylık Ürünler', 1)
INSERT [dbo].[Kategoriler] ([Id], [Adi], [Aktif]) VALUES (3, N'Yıllık Ürünler', 0)
SET IDENTITY_INSERT [dbo].[Kategoriler] OFF
INSERT [dbo].[Musteriler] ([Id], [SirketAdi], [MedeniDurum]) VALUES (7, N'fsadfasdf45', 2)
INSERT [dbo].[Musteriler] ([Id], [SirketAdi], [MedeniDurum]) VALUES (12, N'', 1)
INSERT [dbo].[Musteriler] ([Id], [SirketAdi], [MedeniDurum]) VALUES (13, N'', 1)
SET IDENTITY_INSERT [dbo].[Odalar] ON 

INSERT [dbo].[Odalar] ([Id], [Adi], [Aciklama], [OdaTurID], [Aktif]) VALUES (1, N'SUUDIAN', N'Yeni', 2, 0)
INSERT [dbo].[Odalar] ([Id], [Adi], [Aciklama], [OdaTurID], [Aktif]) VALUES (2, N'Oda2', N'Kat9', 2, 0)
INSERT [dbo].[Odalar] ([Id], [Adi], [Aciklama], [OdaTurID], [Aktif]) VALUES (1002, N'Yeni', N'sfsdfds', 2, 0)
INSERT [dbo].[Odalar] ([Id], [Adi], [Aciklama], [OdaTurID], [Aktif]) VALUES (1003, N'yeni', N'fsadw', 2, 0)
INSERT [dbo].[Odalar] ([Id], [Adi], [Aciklama], [OdaTurID], [Aktif]) VALUES (1004, N'new', N'asdfsad', 1, 0)
INSERT [dbo].[Odalar] ([Id], [Adi], [Aciklama], [OdaTurID], [Aktif]) VALUES (1005, N'SUUDIA', N'Yeni', 2, 0)
INSERT [dbo].[Odalar] ([Id], [Adi], [Aciklama], [OdaTurID], [Aktif]) VALUES (1006, N'YeniOda', N'AS', 1, 0)
SET IDENTITY_INSERT [dbo].[Odalar] OFF
INSERT [dbo].[OdaOzellikleri] ([OdaID], [OzelliklerID], [Deger]) VALUES (1, 1, 0)
INSERT [dbo].[OdaOzellikleri] ([OdaID], [OzelliklerID], [Deger]) VALUES (1, 2, 10)
INSERT [dbo].[OdaOzellikleri] ([OdaID], [OzelliklerID], [Deger]) VALUES (1, 3, 2)
INSERT [dbo].[OdaOzellikleri] ([OdaID], [OzelliklerID], [Deger]) VALUES (1, 4, 1)
INSERT [dbo].[OdaOzellikleri] ([OdaID], [OzelliklerID], [Deger]) VALUES (1, 5, 1)
INSERT [dbo].[OdaOzellikleri] ([OdaID], [OzelliklerID], [Deger]) VALUES (1, 6, 1)
SET IDENTITY_INSERT [dbo].[OdaTurleri] ON 

INSERT [dbo].[OdaTurleri] ([Id], [Adi], [Aciklama], [Aktif]) VALUES (1, N'Normal', N'Normal Oda', 1)
INSERT [dbo].[OdaTurleri] ([Id], [Adi], [Aciklama], [Aktif]) VALUES (2, N'VIP', N'Birincil Oda', 1)
INSERT [dbo].[OdaTurleri] ([Id], [Adi], [Aciklama], [Aktif]) VALUES (3, N'VIPd', N'Birincil Oda', 0)
SET IDENTITY_INSERT [dbo].[OdaTurleri] OFF
SET IDENTITY_INSERT [dbo].[Ozellikler] ON 

INSERT [dbo].[Ozellikler] ([Id], [Adi], [Aciklama], [Aktif]) VALUES (1, N'Güney Cephe', N'Oda ', 1)
INSERT [dbo].[Ozellikler] ([Id], [Adi], [Aciklama], [Aktif]) VALUES (2, N'Kat Numarası', N'', 1)
INSERT [dbo].[Ozellikler] ([Id], [Adi], [Aciklama], [Aktif]) VALUES (3, N'Banyo', N'', 1)
INSERT [dbo].[Ozellikler] ([Id], [Adi], [Aciklama], [Aktif]) VALUES (4, N'TV', N'', 1)
INSERT [dbo].[Ozellikler] ([Id], [Adi], [Aciklama], [Aktif]) VALUES (5, N'Internet', N'adsl', 1)
INSERT [dbo].[Ozellikler] ([Id], [Adi], [Aciklama], [Aktif]) VALUES (6, N'Masör', N'', 0)
SET IDENTITY_INSERT [dbo].[Ozellikler] OFF
SET IDENTITY_INSERT [dbo].[PersonelDetay] ON 

INSERT [dbo].[PersonelDetay] ([Id], [PersonelID], [OdaSatisSayisi], [ToplamSatisFiyati]) VALUES (5, 1, 4, 1000.0000)
INSERT [dbo].[PersonelDetay] ([Id], [PersonelID], [OdaSatisSayisi], [ToplamSatisFiyati]) VALUES (6, 2, 1, 100.0000)
INSERT [dbo].[PersonelDetay] ([Id], [PersonelID], [OdaSatisSayisi], [ToplamSatisFiyati]) VALUES (7, 3, 2, 100.0000)
INSERT [dbo].[PersonelDetay] ([Id], [PersonelID], [OdaSatisSayisi], [ToplamSatisFiyati]) VALUES (8, 8, 0, 0.0000)
INSERT [dbo].[PersonelDetay] ([Id], [PersonelID], [OdaSatisSayisi], [ToplamSatisFiyati]) VALUES (9, 9, 0, 0.0000)
INSERT [dbo].[PersonelDetay] ([Id], [PersonelID], [OdaSatisSayisi], [ToplamSatisFiyati]) VALUES (10, 10, 0, 0.0000)
INSERT [dbo].[PersonelDetay] ([Id], [PersonelID], [OdaSatisSayisi], [ToplamSatisFiyati]) VALUES (12, 11, 0, 0.0000)
SET IDENTITY_INSERT [dbo].[PersonelDetay] OFF
INSERT [dbo].[Personeller] ([Id], [KullaniciAdi], [Sifre], [IseGirisTarihi], [Maas], [Admin]) VALUES (1, N'Enes', N'123', CAST(0xCE3D0B00 AS Date), 2000.0000, 1)
INSERT [dbo].[Personeller] ([Id], [KullaniciAdi], [Sifre], [IseGirisTarihi], [Maas], [Admin]) VALUES (2, N'Mehmet', N'123', CAST(0xAE390B00 AS Date), 2000.0000, 0)
INSERT [dbo].[Personeller] ([Id], [KullaniciAdi], [Sifre], [IseGirisTarihi], [Maas], [Admin]) VALUES (3, N'Mahmut', N'123', CAST(0xAE390B00 AS Date), 2000.0000, 0)
INSERT [dbo].[Personeller] ([Id], [KullaniciAdi], [Sifre], [IseGirisTarihi], [Maas], [Admin]) VALUES (8, N'yeni', N'123', CAST(0x0B3F0B00 AS Date), 2000.0000, 1)
INSERT [dbo].[Personeller] ([Id], [KullaniciAdi], [Sifre], [IseGirisTarihi], [Maas], [Admin]) VALUES (9, N'yeni1', N'123', CAST(0x0B3F0B00 AS Date), 2001.0000, 1)
INSERT [dbo].[Personeller] ([Id], [KullaniciAdi], [Sifre], [IseGirisTarihi], [Maas], [Admin]) VALUES (10, N'yeni2', N'123', CAST(0x0B3F0B00 AS Date), 2000.0000, 0)
INSERT [dbo].[Personeller] ([Id], [KullaniciAdi], [Sifre], [IseGirisTarihi], [Maas], [Admin]) VALUES (11, N'', N'', CAST(0x0B3F0B00 AS Date), 0.0000, 0)
SET IDENTITY_INSERT [dbo].[Satis] ON 

INSERT [dbo].[Satis] ([Id], [MusteriID], [PersonelID], [OdaID], [OdaFiyati], [SatisTarihi], [KasaID]) VALUES (2, 7, 1, 1004, 100.0000, CAST(0x0000A9B000CD733C AS DateTime), 1)
INSERT [dbo].[Satis] ([Id], [MusteriID], [PersonelID], [OdaID], [OdaFiyati], [SatisTarihi], [KasaID]) VALUES (3, 7, 1, 1003, 100.0000, CAST(0x0000A9B000FBC9EC AS DateTime), 5)
INSERT [dbo].[Satis] ([Id], [MusteriID], [PersonelID], [OdaID], [OdaFiyati], [SatisTarihi], [KasaID]) VALUES (4, 7, 3, 1003, 100.0000, CAST(0x0000A9B300AB7CB1 AS DateTime), 1)
INSERT [dbo].[Satis] ([Id], [MusteriID], [PersonelID], [OdaID], [OdaFiyati], [SatisTarihi], [KasaID]) VALUES (5, 7, 3, 1004, 0.0000, CAST(0x0000A9B300ABB0C4 AS DateTime), 1)
INSERT [dbo].[Satis] ([Id], [MusteriID], [PersonelID], [OdaID], [OdaFiyati], [SatisTarihi], [KasaID]) VALUES (1004, 7, 2, 1005, 100.0000, CAST(0x0000A9B5000166BD AS DateTime), 1)
INSERT [dbo].[Satis] ([Id], [MusteriID], [PersonelID], [OdaID], [OdaFiyati], [SatisTarihi], [KasaID]) VALUES (1005, 7, 1, 1, 300.0000, CAST(0x0000A9B600F97C6E AS DateTime), 1)
INSERT [dbo].[Satis] ([Id], [MusteriID], [PersonelID], [OdaID], [OdaFiyati], [SatisTarihi], [KasaID]) VALUES (1006, 7, 1, 1006, 500.0000, CAST(0x0000A9B601068437 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Satis] OFF
SET IDENTITY_INSERT [dbo].[Urunler] ON 

INSERT [dbo].[Urunler] ([Id], [Adi], [Fiyat], [Miktar], [KategoriID], [BirimTipID], [Aktif]) VALUES (3, N'Cola', 3.0000, 1000, 2, 4, 1)
INSERT [dbo].[Urunler] ([Id], [Adi], [Fiyat], [Miktar], [KategoriID], [BirimTipID], [Aktif]) VALUES (4, N'', 0.0000, 0, 1, 1, 0)
INSERT [dbo].[Urunler] ([Id], [Adi], [Fiyat], [Miktar], [KategoriID], [BirimTipID], [Aktif]) VALUES (5, N'MeyveSuyu', 2.0000, 1000, 2, 4, 1)
SET IDENTITY_INSERT [dbo].[Urunler] OFF
/****** Object:  Index [IX_PersonelDetay]    Script Date: 15.12.2018 15:00:29 ******/
ALTER TABLE [dbo].[PersonelDetay] ADD  CONSTRAINT [IX_PersonelDetay] UNIQUE NONCLUSTERED 
(
	[PersonelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BirimTipleri] ADD  CONSTRAINT [DF_BirimTipleri_Aktif]  DEFAULT ((1)) FOR [Aktif]
GO
ALTER TABLE [dbo].[Insan] ADD  CONSTRAINT [DF_Insan_Aktif]  DEFAULT ((1)) FOR [Aktif]
GO
ALTER TABLE [dbo].[Kasa] ADD  CONSTRAINT [DF_Kasa_Aktif]  DEFAULT ((1)) FOR [Aktif]
GO
ALTER TABLE [dbo].[KasaHareketTip] ADD  CONSTRAINT [DF_KasaHareketTip_Aktif]  DEFAULT ((1)) FOR [Aktif]
GO
ALTER TABLE [dbo].[Kategoriler] ADD  CONSTRAINT [DF_Kategoriler_Aktif]  DEFAULT ((1)) FOR [Aktif]
GO
ALTER TABLE [dbo].[Odalar] ADD  CONSTRAINT [DF_Odalar_Aktif]  DEFAULT ((1)) FOR [Aktif]
GO
ALTER TABLE [dbo].[OdaTurleri] ADD  CONSTRAINT [DF_OdaTurleri_Aktif]  DEFAULT ((1)) FOR [Aktif]
GO
ALTER TABLE [dbo].[Ozellikler] ADD  CONSTRAINT [DF_Ozellikler_Aktif]  DEFAULT ((1)) FOR [Aktif]
GO
ALTER TABLE [dbo].[PersonelDetay] ADD  CONSTRAINT [DF_PersonelDetay_OdaSatisSayisi]  DEFAULT ((0)) FOR [OdaSatisSayisi]
GO
ALTER TABLE [dbo].[PersonelDetay] ADD  CONSTRAINT [DF_PersonelDetay_ToplamSatisFiyati]  DEFAULT ((0)) FOR [ToplamSatisFiyati]
GO
ALTER TABLE [dbo].[Personeller] ADD  CONSTRAINT [DF_Personeller_Admin]  DEFAULT ((0)) FOR [Admin]
GO
ALTER TABLE [dbo].[Satis] ADD  CONSTRAINT [DF_Satis_SatisTarihi]  DEFAULT (getdate()) FOR [SatisTarihi]
GO
ALTER TABLE [dbo].[Urunler] ADD  CONSTRAINT [DF_Urunler_Akftif]  DEFAULT ((1)) FOR [Aktif]
GO
ALTER TABLE [dbo].[KasaHareketleri]  WITH CHECK ADD  CONSTRAINT [FK_KasaHareketleri_Kasa] FOREIGN KEY([KasaID])
REFERENCES [dbo].[Kasa] ([Id])
GO
ALTER TABLE [dbo].[KasaHareketleri] CHECK CONSTRAINT [FK_KasaHareketleri_Kasa]
GO
ALTER TABLE [dbo].[KasaHareketleri]  WITH CHECK ADD  CONSTRAINT [FK_KasaHareketleri_KasaHareketTip] FOREIGN KEY([KasaHareketTipID])
REFERENCES [dbo].[KasaHareketTip] ([Id])
GO
ALTER TABLE [dbo].[KasaHareketleri] CHECK CONSTRAINT [FK_KasaHareketleri_KasaHareketTip]
GO
ALTER TABLE [dbo].[Musteriler]  WITH CHECK ADD  CONSTRAINT [FK_Musteriler_Insan] FOREIGN KEY([Id])
REFERENCES [dbo].[Insan] ([Id])
GO
ALTER TABLE [dbo].[Musteriler] CHECK CONSTRAINT [FK_Musteriler_Insan]
GO
ALTER TABLE [dbo].[Odalar]  WITH CHECK ADD  CONSTRAINT [FK_Odalar_OdaTurleri] FOREIGN KEY([OdaTurID])
REFERENCES [dbo].[OdaTurleri] ([Id])
GO
ALTER TABLE [dbo].[Odalar] CHECK CONSTRAINT [FK_Odalar_OdaTurleri]
GO
ALTER TABLE [dbo].[OdaOzellikleri]  WITH CHECK ADD  CONSTRAINT [FK_OdaOzellikleri_Odalar] FOREIGN KEY([OdaID])
REFERENCES [dbo].[Odalar] ([Id])
GO
ALTER TABLE [dbo].[OdaOzellikleri] CHECK CONSTRAINT [FK_OdaOzellikleri_Odalar]
GO
ALTER TABLE [dbo].[OdaOzellikleri]  WITH CHECK ADD  CONSTRAINT [FK_OdaOzellikleri_Ozellikler] FOREIGN KEY([OzelliklerID])
REFERENCES [dbo].[Ozellikler] ([Id])
GO
ALTER TABLE [dbo].[OdaOzellikleri] CHECK CONSTRAINT [FK_OdaOzellikleri_Ozellikler]
GO
ALTER TABLE [dbo].[PersonelDetay]  WITH CHECK ADD  CONSTRAINT [FK_PersonelDetay_Personeller] FOREIGN KEY([PersonelID])
REFERENCES [dbo].[Personeller] ([Id])
GO
ALTER TABLE [dbo].[PersonelDetay] CHECK CONSTRAINT [FK_PersonelDetay_Personeller]
GO
ALTER TABLE [dbo].[Personeller]  WITH CHECK ADD  CONSTRAINT [FK_Personeller_Insan] FOREIGN KEY([Id])
REFERENCES [dbo].[Insan] ([Id])
GO
ALTER TABLE [dbo].[Personeller] CHECK CONSTRAINT [FK_Personeller_Insan]
GO
ALTER TABLE [dbo].[Satis]  WITH CHECK ADD  CONSTRAINT [FK_Satis_Odalar] FOREIGN KEY([OdaID])
REFERENCES [dbo].[Odalar] ([Id])
GO
ALTER TABLE [dbo].[Satis] CHECK CONSTRAINT [FK_Satis_Odalar]
GO
ALTER TABLE [dbo].[Satis]  WITH CHECK ADD  CONSTRAINT [FK_Satis_Personeller] FOREIGN KEY([PersonelID])
REFERENCES [dbo].[Personeller] ([Id])
GO
ALTER TABLE [dbo].[Satis] CHECK CONSTRAINT [FK_Satis_Personeller]
GO
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD  CONSTRAINT [FK_Urunler_BirimTipleri] FOREIGN KEY([BirimTipID])
REFERENCES [dbo].[BirimTipleri] ([Id])
GO
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [FK_Urunler_BirimTipleri]
GO
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD  CONSTRAINT [FK_Urunler_Kategoriler] FOREIGN KEY([KategoriID])
REFERENCES [dbo].[Kategoriler] ([Id])
GO
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [FK_Urunler_Kategoriler]
GO
/****** Object:  Trigger [dbo].[trg_KasaSil]    Script Date: 15.12.2018 15:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE trigger [dbo].[trg_KasaSil]
 on [dbo].[Kasa] --Hangi tabloda çalışacağını belitir
 after delete 
 as
 declare @id int
 select @id=Id from deleted --1.Atama yöntemi
 update Kasa set Aktif=0 where Id=@id

GO
/****** Object:  Trigger [dbo].[trg_PersonelDetay]    Script Date: 15.12.2018 15:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[trg_PersonelDetay]
 on [dbo].[Personeller] 
 after insert 
 as
 declare @personelid int
 select @personelid=Id from inserted
 insert PersonelDetay(PersonelID) values(@personelid)


GO
/****** Object:  Trigger [dbo].[trg_KasaHareketleri]    Script Date: 15.12.2018 15:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[trg_KasaHareketleri]
 on [dbo].[Satis] 
 after insert 
 as
 declare @kasaID int ,@Tutar money, @tarih date
  select @Tutar=OdaFiyati from inserted
  select @tarih=SatisTarihi from inserted

 select @kasaID=KasaID from inserted
 insert KasaHareketleri values(@kasaID,1,@Tutar,@tarih)


GO
/****** Object:  Trigger [dbo].[trg_SatisOdaAktif]    Script Date: 15.12.2018 15:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[trg_SatisOdaAktif]
 on [dbo].[Satis] --Hangi tabloda çalışacağını belitir
after insert
 as
 declare @id int
 declare @odaID int
 select @odaID=OdaID from inserted --1.Atama yöntemi
 update Odalar set Aktif=0 where Id=@OdaID
 select @id=Id from inserted --1.Atama yöntemi
 update Satis set SatisTarihi=GETDATE() where Id=@id


GO
/****** Object:  Trigger [dbo].[trg_SatisPersonelDetay]    Script Date: 15.12.2018 15:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[trg_SatisPersonelDetay]
 on [dbo].[Satis] 
 after insert 
 as
 declare @personelid int,@yeniFiyat int
 select @personelid=PersonelID from inserted
  select @yeniFiyat=OdaFiyati from inserted

  update PersonelDetay set OdaSatisSayisi+=1 where PersonelID=@personelid  
  update PersonelDetay set ToplamSatisFiyati+=@yeniFiyat where PersonelID=@personelid


GO
USE [master]
GO
ALTER DATABASE [OtelOtomasyonu] SET  READ_WRITE 
GO
