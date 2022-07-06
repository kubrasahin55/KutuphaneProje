
create proc GorevliEkle(
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

create proc GorevliListele
as begin select * from Görevliler
end

create proc G_sil 
@GorevliNo int as begin
delete from Görevliler where GorevliNo=@GorevliNo end

create proc G_yenile(
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

 CREATE PROCEDURE G_ara
@GorevliAdSoyad nvarchar(50)
AS
SELECT * FROM Görevliler  WHERE GorevliAdSoyad=@GorevliAdSoyad 

-------------------------------------------------------------------

create proc KitapEkle(
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

create proc KitapListele
as begin select * from Kitaplar
end

create proc Kitap_sil 
@KitapNo int as begin
delete from Kitaplar where KitapNo=@KitapNo end


create proc Kitap_yenile(
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

 CREATE PROCEDURE Kitap_ara
@KitapAdi nvarchar(50)
AS
SELECT * FROM Kitaplar  WHERE KitapAdi=@KitapAdi

-------------------

create proc OgrenciEkle(
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

create proc OgrenciListele
as begin select * from Ogrenciler
end

create proc Ogrenci_sil 
@OgrNo int as begin
delete from Ogrenciler where OgrNo=@OgrNo end


create proc Ogrenci_yenile(
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

 CREATE PROCEDURE Ogrnci_ara
@OgrAdSoyad nvarchar(50)
AS
SELECT * FROM Ogrenciler  WHERE OgrAdSoyad=@OgrAdSoyad

--------------

create proc Odunc_Ekle(
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

create proc Odunc_Listele
as begin select * from Odunc
end

create proc Odunc_sil 
@OduncNo int as begin
delete from Odunc where OduncNo=@OduncNo end

create proc Odunc_yenile(
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

 CREATE PROCEDURE Odunc_ara
@OgrenciNo int
AS
SELECT * FROM Odunc  WHERE OgrenciNo=@OgrenciNo

--------------------

create proc OgrenciGir(
@OgrNo int,
@Sifre varchar(50)
)
as begin select * from Ogrenci_Giris where OgrNo=@OgrNo and Sifre=@Sifre 
end 


create proc GorevliGir(
@GorevliTc nchar(11),
@GorevliSifre varchar(50)
)
as begin select * from GorevliGiris where GorevliTc=@GorevliTc and GorevliSifre=@GorevliSifre
end 