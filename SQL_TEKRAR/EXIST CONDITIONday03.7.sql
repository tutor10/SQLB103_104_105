---            EXIST CONDITION           *************
/*
EXISTS Condition subquery’ler ile kullanilir. IN ifadesinin kullanımına benzer
olarak, EXISTS ve NOT EXISTS ifadeleri de alt sorgudan getirilen değerlerin içerisinde
bir değerin olması veya olmaması durumunda işlem yapılmasını sağlar
*/


CREATE TABLE mart1
(   
    urun_id int,    
    musteri_isim varchar(50),
    urun_isim varchar(50)
);

INSERT INTO mart1 VALUES (10, 'Mark', 'Honda');
INSERT INTO mart1 VALUES (20, 'John', 'Toyota');
INSERT INTO mart1 VALUES (30, 'Amy', 'Ford');
INSERT INTO mart1 VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart1 VALUES (10, 'Adam', 'Honda');
INSERT INTO mart1 VALUES (40, 'John', 'Hyundai');
INSERT INTO mart1 VALUES (20, 'Eddie', 'Toyota');


CREATE TABLE nisan1 
(   
      urun_id int ,
      musteri_isim varchar(50), 
      urun_isim varchar(50)
);

INSERT INTO nisan1 VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan1 VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan1 VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan1 VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan1 VALUES (20, 'Mine', 'Toyota');

SELECT * FROM mart1;
SELECT * FROM nisan1;

/*
	MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
	URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
	MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız.
 */	
	
SELECT urun_id,musteri_isim FROM mart1
WHERE exists (SELECT urun_id FROM nisan1 WHERE mart1.urun_id=nisan1.urun_id);
	
	
--Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
	
SELECT urun_isim,musteri_isim FROM nisan1
WHERE exists (SELECT urun_isim FROM mart1 WHERE nisan1.urun_isim=mart1.urun_isim);	musteri_isim

----NOT EXISTS ****

--Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve  bu ürünleri
-- NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.

SELECT urun_isim,musteri_isim FROM nisan1
WHERE NOT EXISTS (SELECT urun_isim FROM mart1 WHERE nisan1.urun_isim=mart1.urun_isim);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
