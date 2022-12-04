--DATABASE(Veritabani)olusturma
--Create dataBase ugur;

--create database tastan

--DDL - DATA DEFINITION LANG.
--CREATE - TABLO OLUSTURMA
CREATE TABLE ogrenciler2
(
ogrenci_no char(7),--uzunlugunu bildigimiz stringler icin "CHAR" kullanilir
isim varchar(20),--Uzunlugunu bilmedigimiz stringler icin "VARCHAR" kullaniriz
soyisim varchar(25),
not_ort real,--Ondalikli sayilar icin kullanilir(Double gibi)
kayi_tarih date
);

--VAROLAN TABLODAN YENI BIR TABLO OLUSTURDUK
CREATE TABLE ogrenci_notlari
AS -- BENZER TABLODAKI BASLIKLARLA VE DATA TIPLERIYLE YENI BIR TABLO OLUSTURMAK ICIN 
--NORMAL TABLO OLUSTURUKEN KI PARANTEZLER YERINE "AS"KULLANIP "SELECT 
--KOMUTUYLA ALMAK ISTEDIGIMIZ VERILERI ALIRIZ." 
SELECT isim , soyisim , not_ort FROM ogrenciler2;

--DML - DATA MANUPULATION LANG.
--INSERT (DATABASE,e VERI EKLEME)

INSERT INTO ogrenciler2 VALUES ('1234567','Ugur','Tastan',85.5,now());
INSERT INTO ogrenciler2 VALUES ('1234567','Ugur','Tastan',85.5,'2020-12-11');

--BIR TABLOYA PARCALI VERI EKLEMEK ISTERSEK

INSERT INTO ogrenciler2(isim,soyisim) VALUES ('Erol','Evren')

--DQL - DATA QUERY LANG.

select * FROM ogrenciler2;--BURDAKI * SEMBOLU HERSEYI ANLAMINDADIR.