

-- 			***      ORDER BY CLAUSE      ****
/*
	ORDER BY komutu belli bir field’a gore NATURAL ORDER olarak siralama
	yapmak icin kullanilir
	
	ORDER BY komutu sadece SELECT komutu Ile kullanilir
*/
---Tablolardaki verileri siralamak icin ORDER BY komutu kullaniriz.

---Buyukten kucuge yada kucuken buyuge siralama yapabiliriz.     DESC VE ASC****

---Default olarak kucukten buyuge siralama yapar(ASC) NATURAL SIRALAMA KUCUKTEN BUYUGE



drop table if exists insanlar

CREATE TABLE insanlar1
(
      ssn char(9),
     isim varchar(50),
     soyisim varchar(50),  
     adres varchar(50)
);

INSERT INTO insanlar1 VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar1 VALUES(234567890, 'Veli','Cem', 'Ankara');  
INSERT INTO insanlar1 VALUES(345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO insanlar1 VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar1 VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO insanlar1 VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

SELECT * FROM insanlar1;


--Insanlar tablosundaki datalari adres’e gore siralayin

SELECT * FROM insanlar1 ORDER BY adres;

--Insanlar tablosundaki datalari soyisim’e gore siralayin

SELECT * FROM insanlar1 ORDER BY soyisim;

--Insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin

SELECT * FROM insanlar1 WHERE isim='Mine' ORDER BY ssn;--ORDER BY NATURAL SIRALAMA YAPAR YANI KUCUKTEN BUYUGE***********

--Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin

SELECT * FROM insanlar1 WHERE soyisim='Bulut' ORDER BY 2;

---Eger BUYUKTEN KUCUGE siralamak istersek ORDER BY komutundan sonra DESC komutunu kullaniriz
-- ORDER BY field_name DESC CLAUSE
 
-- Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin

SELECT * FROM insanlar1 ORDER BY ssn DESC;--buyukten kucuge siralndi

-- Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin

SELECT * FROM insanlar1 ORDER BY isim ASC,soyisim DESC;--ASC NATURAL(KUCUKTEN BUYUGE) YAZILMASADA OLUR 
--                                                        DESC(BUYUKTEN KUCUGE)




































