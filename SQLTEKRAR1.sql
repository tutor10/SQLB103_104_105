-----DATABASE (VERI TABANI) OLUSTURMA***

CREATE DATABASE Ugur;
CREATE DATABASE Tastan;

-----DDL - DATA DEFINITION LANG.***

-----CREATE - TABLO OLUSTURMA*****

CREATE TABLE ogrenciler
(
    ogrenci_no char(7),
	isim varchar(20),
	soyisim varchar(25),
	not_ort real,---------->Ondalikli sayilar icin kullanilir (Double gibi)
	kayit_tarih date
);

SELECT * FROM ogrenciler------>Olusturulan tabloyu gormek icin

-----VAROLAN TABLODAN YENI BIR TABLO OLUSTURMA******

CREATE TABLE ogrenci_notlari 
AS ---------------------------------->BENZER TABLODAKI BASLIKLARLA VE DATA TIPLERIYLE YENI BIR TABLO OLUSTURMAK ICIN NORMAL TABLO 
------------------------------------->OLUSTURUKEN KI PARANTEZLER YERINE 'AS' KULLANIP 'SELECT' KOMUTUYLA ALMAK ISTEDIGIMIZ VERILERI ALIRIZ.
SELECT isim,soyisim,not_ort FROM ogrenciler;

-----DML - DATA MANIPULATION LANG.*********

-----INSERT - DATABASE'E VERI EKLEME********

INSERT INTO ogrenciler VALUES ('1234567','Ugur','Tastan',85.5,'2020-12-11');

INSERT INTO ogrenciler VALUES ('1234567','Ugur','Tastan',85.5,now());


-----BIR TABLOYA PARCALI VERI EKLEMEK ISTERSEK*******

INSERT INTO ogrenciler(isim,soyisim) VALUES ('Erol','Evren');


-----DQL - DATA QUERY LANG.*********

-----SELECT

SELECT * FROM ogrenciler;

