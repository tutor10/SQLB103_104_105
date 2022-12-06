--AGGREGATE METHODLARDA SUBQUERY


CREATE TABLE calisanlar4 (
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);
INSERT INTO calisanlar4 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar4 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar4 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar4 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar4 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar4 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar4 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');


CREATE TABLE markalar1
(
marka_id int,
marka_isim VARCHAR(20),
calisan_sayisi int
);
INSERT INTO markalar1 VALUES(100, 'Vakko', 12000);
INSERT INTO markalar1 VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar1 VALUES(102, 'Adidas', 10000);
INSERT INTO markalar1 VALUES(103, 'LCWaikiki', 21000);

SELECT * FROM calisanlar4;
SELECT * FROM markalar1;


-- Her markanin id’sini, ismini ve toplam kaç 
--şehirde bulunduğunu listeleyen bir SORGU yaziniz

SELECT marka_id,marka_isim,(SELECT COUNT(SEHIR) AS sehir_sayisi FROM calisanlar4 WHERE marka_isim=isyeri) FROM markalar1;
						   
-- Her markanin ismini, calisan sayisini ve 
--o markaya ait calisanlarin toplam maaşini listeleyiniz

SELECT marka_isim,calisan_sayisi,(SELECT SUM(MAAS) AS maas_toplami FROM calisanlar4 WHERE marka_isim=isyeri) FROM markalar1;


-- Her markanin ismini, calisan sayisini ve
--o markaya ait calisanlarin maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.

SELECT marka_isim,calisan_sayisi,(SELECT max(MAAS) AS max_maas FROM calisanlar4 WHERE marka_isim=isyeri) ,
(SELECT min(MAAS) AS min_maas FROM calisanlar4 WHERE marka_isim=isyeri) 
FROM markalar1;


-------------             VIEW KULLANIMI             *****
/*
Yaptigimiz sorgulari hafizaya alir ve tekrar bizden istenen sorgulama yerine 
VIEW e atadigimiz ismi SELECT komutuyla cagiririz.
*/

CREATE VIEW maxminmaas
AS SELECT marka_isim,calisan_sayisi,(SELECT max(MAAS) AS max_maas FROM calisanlar4 WHERE marka_isim=isyeri) ,
(SELECT min(MAAS) AS min_maas FROM calisanlar4 WHERE marka_isim=isyeri) 
FROM markalar1;

SELECT * FROM maxminmaas;

CREATE VIEW summaas
As SELECT marka_isim,calisan_sayisi,(SELECT max(MAAS) AS max_maas FROM calisanlar4 WHERE marka_isim=isyeri) ,
(SELECT min(MAAS) AS min_maas FROM calisanlar4 WHERE marka_isim=isyeri) 
FROM markalar1;

SELECT * FROM summaas;

