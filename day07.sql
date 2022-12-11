--                                  DISTINCT
-- DISTINCT clause, çağrılan terimlerden tekrarlı olanların sadece birincisini alır.

CREATE TABLE musteri_urun 
(
urun_id int, 
musteri_isim varchar(50),
urun_isim varchar(50) 
);

INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (20, 'Veli', 'Elma'); 
INSERT INTO musteri_urun VALUES (30, 'Ayse', 'Armut'); 
INSERT INTO musteri_urun VALUES (20, 'Ali', 'Elma'); 
INSERT INTO musteri_urun VALUES (10, 'Adem', 'Portakal'); 
INSERT INTO musteri_urun VALUES (40, 'Veli', 'Kaysi'); 
INSERT INTO musteri_urun VALUES (20, 'Elif', 'Elma');

SELECT * FROM musteri_urun; 

-- Musteri urun tablosundan urun isimlerini tekrarsız(grup) listeleyiniz

--GROUP BY COZUMU
SELECT urun_isim FROM musteri_urun GROUP BY urun_isim;

--DISTINCT COZUMU
SELECT DISTINCT(urun_isim) FROM musteri_urun;


--Count, toplam meyve sayısı... Distinct meyve çeşit sayısı arkadaşlar

-- Tabloda kac farkli meyve vardir ?

SELECT COUNT(DISTINCT urun_isim)AS urun_cesit_sayisi FROM musteri_urun;


SELECT urun_isim, COUNT(urun_isim)AS urun_cesit_sayisi FROM musteri_urun
GROUP BY urun_isim;



SELECT urun_isim, COUNT(DISTINCT urun_isim)AS urun_cesit_sayisi FROM musteri_urun
GROUP BY urun_isim;

--                    FETCH NEXT (SAYI) ROW ONLY- OFFSET

-- 1) Tabloyu urun_id ye gore siralayiniz
-- 2) Sirali tablodan ilk 3 kaydi listeleyin


-- Musteri urun tablosundan ilk 3 kaydi listeleyiniz.


SELECT * FROM musteri_urun ORDER BY urun_id
FETCH NEXT 3 ROW ONLY;

--LIMIT
SELECT * FROM musteri_urun ORDER BY urun_id
LIMIT 3;

-- Musteri urun tablosundan ilk kaydi listeleyiniz.

SELECT * FROM musteri_urun ORDER BY urun_id
LIMIT 1;


-- Musteri urun tablosundan son uc kaydi listeleyiniz.

SELECT * FROM musteri_urun ORDER BY urun_id DESC
LIMIT 3;

CREATE TABLE maas
(
id int,
musteri_isim varchar(50),
maas int
PRIMARY KEY(id,musteri_isim)---birden fazla primary key yapmak icin boyle yapilir.
);
INSERT INTO maas VALUES (10, 'Ali', 5000);
INSERT INTO maas VALUES (10, 'Ali', 7500);
INSERT INTO maas VALUES (20, 'Veli', 10000);
INSERT INTO maas VALUES (30, 'Ayse', 9000);
INSERT INTO maas VALUES (20, 'Ali', 6500);
INSERT INTO maas VALUES (10, 'Adem', 8000);
INSERT INTO maas VALUES (40, 'Veli', 8500);
INSERT INTO maas VALUES (20, 'Elif', 5500);


SELECT * FROM maas;
--OFFSET--->Satir atlamak istedigimizde OFFSET komutunu kullaniriz



--En yuksek maasi alan musteriyi listeleyiniz

SELECT * FROM maas ORDER BY maas DESC LIMIT 1;

--En yuksek IKINCI maasi alan musteriyi listeleyiniz

SELECT * FROM maas ORDER BY maas DESC OFFSET 1 LIMIT 1 ;

SELECT * FROM maas ORDER BY maas DESC OFFSET 1 FETCH NEXT 1 ROW ONLY;

--Maas tablosundan en dusuk 4.maasi lsiteleyiniz.

SELECT * FROM maas ORDER BY maas OFFSET 3 LIMIT 1;


/*
					ALTER TABLE STATEMENT
					
	ALTER TABLE statement tabloda add, Type(modify)/Set, Rename veya drop columns
	islemleri icin kullanilir.
	ALTER TABLE statement tablolari yeniden isimlendirmek icin de kullanilir.
 */



CREATE TABLE personel6 
(
    id int,
    isim varchar(50), 
	sehir varchar(50),  
	maas int,  
    sirket varchar(20),
CONSTRAINT personel6_pk PRIMARY KEY (id)
);

INSERT INTO personel6 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel6 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel6 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel6 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel6 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel6 VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel6 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

SELECT * FROM personel6;

--DROP TABLE ....--->tabloyu ortadan kaldirir
--DELETE --->TABLODAKI VERILERI SILER

--1) ADD default deger ile tabloya bir field ekleme

ALTER TABLE personel6
ADD ulke varchar(30);

ALTER TABLE personel6
ADD adres varchar(50) DEFAULT 'Turkiye';--DEFAULT yazarsak olusturdugumuz sutuna belirttigimiz veriyi girer.

ALTER TABLE personel6
ADD zipcode varchar(30);


--2) DROP tablodan sutun silme

ALTER TABLE personel6
DROP COLUMN zipcode;

--DROP tablodan sutun silme
ALTER TABLE personel6
DROP adres,DROP sirket;-- iki sütun birden silindi

-- 3) RENAME COLUMN sutun adi degistirme

ALTER TABLE personel6
RENAME COLUMN sehir TO il;

--4)RENAME tablonun ismini degistirme

ALTER TABLE personel6
RENAME TO isci;

--5)TYPE/SET sutunlarin ozelliklerini degistirme

ALTER TABLE isci
ALTER COLUMN il TYPE varchar(30),
ALTER COLUMN maas SET NOT NULL;
/*
Eger numeric data tipine sahip bir sutunun data turune string bir data turu atamak istersek
TYPE varchar(30) USING(maas::varchar(30)) bu formati kullaniriz
*/
ALTER COLUMN (maas)
TYPE varchar(30), USING(maas::varchar(30));



SELECT * FROM personel6;


/*
			 TRANSACTION (BEGIN - SAVEPOINT - ROLLBACK - COMMIT)
	
	Transaction veritabani sistemlerinde bir islem basladiginda baslar ve bitince sona erer. Bu
	islemler veritabani olusturma, veri silme, veri guncelleme, 
	veriyi geri getirme gibi islemler olabilir.
	Transaction baslatmak icin BEGIN komutu kullanmamiz gerekir ve 
	Transaction'i sonlandirmak icin
	COMMIT komutunu calistirmaliyiz.
	
 */

DROP TABLE ogrenciler2;

CREATE TABLE ogrenciler2
(
id serial,--SERIAL data turu otomatik olarak birden baslayarak sirali olarak sayi atamasi yapar.
--           INSERT INTO ile tabloya veri eklerken SERIAL data turunu kullandigim veri degeri yerine 
--           DEFAULT yazariz
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu real       
);

BEGIN;
INSERT INTO ogrenciler2 VALUES(default, 'Ali Can', 'Hasan',75.5);
INSERT INTO ogrenciler2 VALUES(default, 'Merve Gul', 'Ayse',85.3);
savepoint x;
INSERT INTO ogrenciler2 VALUES(default, 'Kemal Yasa', 'Hasan',85.6);
INSERT INTO ogrenciler2 VALUES(default, 'Nesibe Yilmaz', 'Ayse',95.3);
savepoint y;
INSERT INTO ogrenciler2 VALUES(default, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler2 VALUES(default, 'Can Bak', 'Ali', 67.5);
ROLLBACK to y;
COMMIT;


SELECT * FROM ogrenciler2;

DELETE FROM ogrenciler2

DROP TABLE ogrenciler2;

/*
	Transaction kullaniminda SERIAL data turu kullanimi tercih edilmez. Save pointten sonra ekledigimiz
	veride sayac mantigi ile calistigi icin sayacta en son hangi sayida kaldiysa ordan devam eder.
	NOT :PostgreSQL de Transaction kullanımı için «Begin;» komutuyla başlarız sonrasında tekrar
	yanlış bir veriyi düzelmek veya bizim için önemli olan verilerden
	sonra ekleme yapabilmek için "SAVEPOINT savepointismi" komutunu
	kullanırız ve bu savepointe dönebilmek için "ROLLBACK TO savepointismi" komutunu
	kullanırız ve rollback çalıştırıldığında savepoint yazdığımız satırın üstündeki
	verileri tabloda bize verir ve son olarak Transaction'ı sonlandırmak için mutlaka
	"COMMIT" komutu kullanılır.
 */





































































































































