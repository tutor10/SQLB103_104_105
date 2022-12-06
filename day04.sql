-----ALIASES***********2 fieldi birlestiriyor

CREATE TABLE calisanlar 
(
    calisan_id char(9),
    calisan_isim varchar(50),
    calisan_dogdugu_sehir varchar(50)
);

INSERT INTO calisanlar VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO calisanlar VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO calisanlar VALUES(345678901, 'Mine Bulut', 'Izmir');

SELECT * FROM calisanlar;

--Eger iki sutunun verilerini birlestirmek istersek concat sembolu || kullaniriz.
--1.yol
SELECT calisan_id AS id,calisan_isim || '  ' ||calisan_dogdugu_sehir  AS calisan_bilgisi FROM calisanlar;

-2. YOl
SELECT calisan_id AS id, concat (calisan_isim,' ',calisan_dogdugu_sehir) AS calisan_bilgisi FROM calisanlar;

--|| '  ' || ve ,' ',veri aralarina bosluk koymak icin



-------IS NULL CONDITION***********
---- Arama yapilan field’da NULL degeri almis kayitlari getirir

CREATE TABLE insanlar
(
    ssn char(9),
    name varchar(50),  
    adres varchar(50)
);

INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');  
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');

SELECT * FROM insanlar;

--Name sutununda null olan degerleri listeleyelim

SELECT name FROM insanlar WHERE name IS NULL;

------IS NOT NULL********* NULL olmayan degerelri getirir.

--insanlar tablosunda sadece null olmayan degerleri listeleyiniz.

SELECT name FROM insanlar WHERE name IS NOT NULL;

--insanlar tablosunda null almis verileri no name olarak degistiriniz.

UPDATE insanlar
SET name='No Name'
WHERE name IS NULL;



-- 			***      ORDER BY CLAUSE      ****
/*
	ORDER BY komutu belli bir field’a gore NATURAL ORDER olarak siralama
	yapmak icin kullanilir
	ORDER BY komutu sadece SELECT komutu Ile kullanilir
*/
---Tablolardaki verileri siralamak icin ORDER BY komutu kullaniriz.
---Buyukten kucuge yada kucuken buyuge siralama yapabiliriz.DESC VE ASC
---Default olarak kucukten buyuge siralama yapar(ASC) NATURAL SIRALAMA KUCUKTEN BUYUGE


drop table if exists insanlar

CREATE TABLE insanlar
(
      ssn char(9),
     isim varchar(50),
     soyisim varchar(50),  
     adres varchar(50)
);

INSERT INTO insanlar VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar VALUES(234567890, 'Veli','Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO insanlar VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO insanlar VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

SELECT * FROM insanlar;


--Insanlar tablosundaki datalari adres’e gore siralayin

SELECT * FROM insanlar ORDER BY adres;

SELECT * FROM insanlar ORDER BY soyisim;

--Insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin

SELECT * FROM insanlar WHERE isim='Mine' ORDER BY ssn;

--NOT : Order By komutundan sonra field(sutun) ismi yerine field(sutun) numarasi da kullanilabilir

--Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin

SELECT * FROM insanlar WHERE soyisim='Bulut' ORDER BY 2;


---Eger BUYUKTEN KUCUGE siralamak istersek ORDER BY komutundan sonra DESC komutunu kullaniriz
-- ORDER BY field_name DESC CLAUSE
 
-- Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin

SELECT * FROM insanlar ORDER BY ssn DESC;---->BUYUKTEN KUCUGE

-- Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin

SELECT * FROM insanlar ORDER BY isim ASC,soyisim DESC;

-----ASC dogal siralama yapar yazmasakta olur

-----LENGTH***********
/*
   Eger sutun uzunluguna gore siralamak istersek LENGTH komutu kullaniriz
   ve yine uzunlugu BUYUKTEN KUCUGE siralamak istersek sonuns DESC komutunu ekleriz.
*/


-- İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız


SELECT isim,soyisim FROM insanlar ORDER BY LENGTH (soyisim);

-- Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız

SELECT isim||' '||soyisim FROM insanlar;

--1.YOL
SELECT isim||' '||soyisim AS isim_soysisim FROM insanlar ORDER BY LENGTH (isim||soyisim);

--2.YOL
SELECT isim||' '||soyisim AS isim_soysisim FROM insanlar ORDER BY LENGTH (isim)+LENGTH (soyisim);

--3.YOL
SELECT CONCAT (isim' 'soyisim) AS isim_soysisim FROM insanlar ORDER BY LENGTH (isim)+LENGTH (soyisim);

--4.YOL
SELECT CONCAT (isim' 'soyisim) AS isim_soysisim FROM insanlar ORDER BY LENGTH CONCAT (isim,soyisim);


-- 	            GROUP BY CLAUSE      *********
-- Group By komutu sonuçları bir veya daha fazla sütuna göre gruplamak için SELECT
-- komutuyla birlikte kullanılır


CREATE TABLE manav
(
    isim varchar(50),  
	Urun_adi varchar(50),  
	Urun_miktar int
);

INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

SELECT * FROM manav;

--Isme gore alinan toplam urunleri bulun

SELECT isim, sum(urun_miktar) AS aldigi_toplam_urun FROM manav GROUP BY isim;


-- Isme gore alinan toplam urunleri bulun ve bu urunleri buyukten kucuge listeleyiniz

SELECT isim, sum(urun_miktar) AS aldigi_toplam_urun FROM manav GROUP BY isim ORDER BY aldigi_toplam_urun DESC;


-- Urun ismine gore urunu alan toplam kisi sayisi

SELECT COUNT (isim) FROM manav;

SELECT urun_adi,count(isim) FROM manav GROUP BY urun_adi;

SELECT isim,count(urun_adi) FROM manav GROUP BY isim;

SELECT isim,count(urun_adi) AS aldigi_urun_miktari FROM manav GROUP BY isim;













