-----                     ORDER BY LENGTH            ***********
/*
   Eger sutun uzunluguna gore siralamak istersek LENGTH komutu kullaniriz
   ve yine uzunlugu BUYUKTEN KUCUGE siralamak istersek sonuns DESC komutunu ekleriz.
*/

SELECT * FROM insanlar1;

-- İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız

SELECT isim,soyisim FROM insanlar1 ORDER BY LENGTH (soyisim);--ASC YAZMAMIZA GEREK YOK MATURAL SIRALAMA YAPAR YAZMASAKTA

SELECT isim,soyisim FROM insanlar1 ORDER BY LENGTH (soyisim) DESC;--UZUNLUGU BUYUKTEN KUCUGE SIRALAMA SONUNA 'DESC' EKLERIZ 


-- Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız

--1.yol
SELECT isim||' '||soyisim AS isim_soyisim FROM insanlar1 ORDER BY LENGTH(isim),LENGTH(soyisim);

--2.yol
SELECT isim||' '||soyisim AS isim_soyisim FROM insanlar1 ORDER BY LENGTH(isim||soyisim);

--3.yol
SELECT CONCAT(isim,' ',soyisim ) AS isim_soyisim FROM insanlar1 ORDER BY  LENGTH(isim),LENGTH(soyisim);

--4.yol

SELECT CONCAT(isim,' ',soyisim ) AS isim_soyisim FROM insanlar1 ORDER BY  LENGTH (CONCAT(isim,soyisim));

--5.YOL
SELECT CONCAT(isim||' '||soyisim) AS isim_soyisim FROM insanlar1 ORDER BY LENGTH(CONCAT(isim,soyisim));

















































