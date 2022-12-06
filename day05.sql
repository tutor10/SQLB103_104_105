---------------------------- GROUP BY ---------------------

CREATE TABLE personel
(
id int,
isim varchar(50),  sehir varchar(50),  maas int,  
sirket varchar(20)
);

INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk','Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk','Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk','Ankara',7000, 'Tofas');  
INSERT INTO personel VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin','Bursa', 4500, 'Honda');

SELECT * FROM personel;

DELETE FROM personel;

--1)Isme gore toplam maaslari bulun

SELECT isim,
SUM(maas) FROM personel GROUP BY isim;


--Personel tablosundaki isimleri grouplayiniz.

SELECT isim FROM personel GROUP BY isim;

--Sirketlere gore maasi 5000 liradan fazla olan personel sayisini bulun

SELECT sirket, COUNT(*) AS calisan_sayisini_saydir FROM personel
WHERE maas>5000
GROUP BY sirket;


-- 									HAVING CLAUSE -----------------------------------

-- HAVING, AGGREGATE FUNCTION’lar ile birlikte kullanilan FILTRELEME komutudur.

--HAVING komutu yalnizca GROUP BY komutu ile kullanilir, eger GROUP BY dan sonra sart varsa HAVING komutu kullanilir.

--WHERE kullanimi ile ayni mantikla calisir


--1) Her sirketin MIN maaslarini eger 4000’den buyukse goster

SELECT sirket ,min(maas) as en_dusuk_maas FROM personel 
GROUP BY SIRKET
HAVING min(maas)>4000;

-- 2) Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise ismi
-- ve toplam maasi gosteren sorgu yaziniz

SELECT isim,SUM(maas) FROM personel
GROUP BY isim
HAVING SUM(maas)>10000;

-- Eger bir sehirde calisan personel sayisi 1’den coksa sehir ismini ve personel sayisini veren sorgu yaziniz

SELECT sehir,COUNT(isim) FROM personel
GROUP BY sehir
HAVING COUNT(isim)>1;

-- 4) Eger bir sehirde alinan MAX maas 5000’den dusukse
-- sehir ismini ve MAX maasi veren sorgu yaziniz

SELECT sehir,max(maas) FROM personel
GROUP BY sehir
HAVING max(maas)<5000;

-----------						UNION OPERATOR        --------------------

-- Iki farkli sorgulamanin sonucunu birlestiren islemdir. Secilen Field SAYISI ve DATA TYPE’i ayni olmalidir.

CREATE TABLE personel
(
id int,
isim varchar(50),  
sehir varchar(50), 
maas int,  
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY (id)

INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

-- 1) Maasi 4000’den cok olan isci isimlerini ve 5000 liradan fazla maas alinan
-- sehirleri gosteren sorguyu yaziniz

SELECT isim,maas FROM personel WHERE maas>4000
UNION
SELECT sehir,maas FROM personel WHERE maas>5000;

-- 2) Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve Istanbul’daki personelin maaslarini
-- bir tabloda gosteren sorgu yaziniz

SELECT isim as isim_ve_sehir,maas FROM personel WHERE isim='Mehmet Ozturk'
UNION
SELECT sehir,maas FROM personel WHERE sehir='Istanbul'
ORDER BY maas DESC;---buyukten kucuge maasi siralar
--ORDER BY maas--kucukten buyuge maasi siralar 

------------------- 								UNION OPERATOR     -------------------------------
-- 						2 Tablodan Data Birlestirme


CREATE TABLE personel1
(
id int,
isim varchar(50),  
sehir varchar(50), 
maas int,  
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY (id)
);
INSERT INTO personel1 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel1 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel1 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel1 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel1 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel1 VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel1 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

CREATE TABLE personel_bilgi  (
id int,
tel char(10) UNIQUE ,  
cocuk_sayisi int,
CONSTRAINT personel_bilgi_fk FOREIGN KEY (id) REFERENCES personel1(id)
);

INSERT INTO personel_bilgi VALUES(123456789, '5302345678', 5);  
INSERT INTO personel_bilgi VALUES(234567890, '5422345678', 4);
INSERT INTO personel_bilgi VALUES(345678901, '5354561245', 3);
INSERT INTO personel_bilgi VALUES(456789012, '5411452659', 3);
INSERT INTO personel_bilgi VALUES(567890123, '5551253698', 2);
INSERT INTO personel_bilgi VALUES(456789012, '5524578574', 2);
INSERT INTO personel_bilgi VALUES(123456710, '5537488585', 1);

select * from personel
select * from personel_bilgi

-- id’si 123456789 olan personelin    Personel tablosundan sehir ve maasini, 
-- personel_bilgi  tablosundan da tel ve cocuk sayisini yazdirin

SELECT sehir AS sehir_ve_tel,maas AS maas_ve_cocuk_sayisi FROM personel1 WHERE id=123456789
UNION
SELECT tel,cocuk_sayisi from personel_bilgi WHERE id=123456789;


--	NOT : Union islemi yaparken 1)Her 2 QUERY’den elde edeceginiz tablolarin sutun sayilari esit olmali 
--	2)Alt alta gelecek sutunlarin data type’lari ayni olmali

------------------------------- UNION ALL ---------------------------------	
--UNION tekrarli verileri teke dusurur ve bize sonucu verir

--UNION ALL ise tekrarli verilerle birlikte tum sorgulari getirir.

/*	
	UNION islemi 2 veya daha cok SELECT isleminin sonuc KUMELERINI birlestirmek icin kullanilir, 
	Ayni kayit birden fazla olursa, sadece bir tanesini alir. UNION ALL ise tekrarli elemanlari, 
	tekrar sayisinca yazar.
*/

--Personel tablosundada maasi 5000’den az olan tum isimleri ve maaslari bulunuz

SELECT isim,maas FROM personel1 WHERE maas<5000
UNION ALL
SELECT isim,maas FROM personel1 WHERE maas<4000;
	

------------------- INTERSECT OPERATOR ------------------	
-- INTERSECT (Kesişim)
/*
Farkli iki tablodaki ortak verileri INTERSECT komutu ile getirebiliriz
*/	
	
	
/*
	SQL INTERSECT operatörü, 2 veya daha fazla SELECT ifadesinin sonuçlarını döndürmek için kullanılır.
	Ancak, yalnızca tüm sorgular veya veri kümeleri tarafından seçilen satırları döndürür. 
	Bir sorguda bir kayıt varsa ve diğerinde yoksa, INTERSECT sonuçlarından çıkarılacaktır.
	
*/	
	
	--Personel tablosundan Istanbul veya Ankara’da calisanlarin id’lerini yazdir
    --Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
    --Iki sorguyu INTERSECT ile birlestirin
	
SELECT id FROM personel1 WHERE sehir IN ('Istanbul','Ankara') 
  INTERSECT
SELECT id FROM personel_bilgi WHERE cocuk_sayisi IN(2,3);	
	
	
-- 1) Maasi 4800’den az olanlar veya 5000’den cok olanlarin id’lerini listeleyin
-- 2) Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
-- 3) Iki sorguyu INTERSECT ile birlestirin
	
SELECT id FROM personel WHERE maas NOT BETWEEN 4800 AND 5500
INTERSECT	
SELECT id FROM personel_bilgi WHERE cocuk_sayisi IN (2,3);
	
-- Honda,Ford ve Tofas’ta calisan ortak isimde personel varsa listeleyin	
	
SELECT isim FROM personel WHERE sirket='Honda'
INTERSECT	
SELECT isim FROM personel WHERE sirket='Ford'
INTERSECT		
SELECT isim FROM personel WHERE sirket='Tofas';


-------------------------- EXCEPT OPERATOR ----------------------------	
--MINUS ayni anlamdadir fakat MYSQL VE ORACLE da kullaniliyor.	
	/*
iki sorgulamada harici bir sorgulama istenirse EXCEPT komutu kullanilir
 */

--5000'den az maasi alip Honda'da calismayanlari yazdirin.	
	
SELECT isim,sirket
FROM personel
WHERE maas<5000 AND sirket!='Honda'	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	










