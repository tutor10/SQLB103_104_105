
-------------AGGREGATE METHOD********************

/*
Eger bir sutuna gecici olarak bir isim vermek istersek 'AS' komutunu yazdiktan sonra
vermek istedigimiz ismi yazariz
*/


CREATE TABLE calisanlar3 (
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);
INSERT INTO calisanlar3 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar3 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar3 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar3 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar3 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar3 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar3 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

SELECT * FROM calisanlar3;


--Calisanlar tablosundan en yuksek maasi listeleyelim

SELECT max(maas) FROM calisanlar3;


-- Calisanlar tablosundan maksimum maası listeleyelim

SELECT max(maas) AS maksimum_maas FROM calisanlar3;


-- Calisanlar tablosundan min maası listeleyelim

SELECT min(maas)AS minimum_maas FROM calisanlar3;

--Calisanlar tablosundaki maas,larin toplamini listeleyiniz.

SELECT sum(maas) FROM calisanlar3;


----AVARAGE(avg) METHOD ---->ORTALAMASINI ALIR

--Calisanlar tablosundaki maas,larin ortalamasini listeleyiniz

SELECT avg(maas) FROM calisanlar3;

--- ROUND ---->VIRGULLU SAYILARIn noktadan sonrasini istemezsek.
SELECT round(avg(maas)) FROM calisanlar2;

--- ROUND ---->VIRGUllu sayilarda noktadan sonra istedigimiz kadar sayi istersek asagidaki gibi yapariz (avg(maas),2)
SELECT round(avg(maas),2) FROM calisanlar2;

---------count()---->satir sayisini veriyor
/*
Eger count(*)kullanirsak tablodakitum satirlarin sayisini verir
Sutun adi kullanirsak o sutundaki sayilari verir.
*/

--Calisanlar tablosundaki maas,larin sayisini listeliyiniz

SELECT count(maas) FROM calisanlar2 ;-- tablodaki satir sayisini veriyor 
SELECT count(*) FROM calisanlar2;



































