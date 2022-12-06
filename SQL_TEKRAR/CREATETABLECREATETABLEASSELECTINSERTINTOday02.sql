-----CREATE - TABLO OLUSTURMA*****

CREATE TABLE ogrenciler1
(
    ogrenci_no char(7),-----UZUNLUGUNU BILDIGIMIZ STRINGLER ICIN 'CHAR' KULLANILIR
	isim varchar(20),-------UZUNLUGUNU BILMEDIGIMIZ STRINGLER ICIN 'VARCHAR' KULLANIRIZ
	soyisim varchar(25),
	not_ort real,---------->Ondalikli sayilar icin kullanilir (Double gibi)
	kayit_tarih date
);

SELECT * FROM ogrenciler1;------>Olusturulan tabloyu(OGRENCILER1) gormek icin

-----VAROLAN TABLODAN YENI BIR TABLO OLUSTURMA******

CREATE TABLE notlar
AS ---------------------------------->BENZER TABLODAKI BASLIKLARLA VE DATA TIPLERIYLE YENI BIR TABLO OLUSTURMAK ICIN NORMAL TABLO 
------------------------------------->OLUSTURUKEN KI PARANTEZLER YERINE 'AS' KULLANIP 'SELECT' KOMUTUYLA ALMAK ISTEDIGIMIZ VERILERI ALIRIZ.
SELECT isim,not_ort FROM ogrenciler1;

SELECT * FROM notlar;------>Olusturulan tabloyu(NOTLAR) gormek icin


-----INSERT- TABLO İÇİNE VERİ EKLEME************

INSERT INTO notlar VALUES('ugur',75.5);
INSERT INTO notlar VALUES('burak',85.5);
INSERT INTO notlar VALUES('ercan',90.5);
INSERT INTO notlar VALUES('erol',50.5);
INSERT INTO notlar VALUES('hakan',80.5);
INSERT INTO notlar VALUES('adem',70.5);

SELECT isim FROM notlar;---------Notlar tablosunda sadece isim field'ni gormek icin 