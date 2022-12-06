
---------------------------IN - CONDITION  (AND ,OR)*****************

-----AND---->Belirtilen sartlarin her ikiside gerceklesirse o kayit listelenir
-----OR----->Belirtilen sartlardan biri gerceklesirse kayit listelenir.

DROP TABLE IF EXISTS musteriler;--tablo olsuturmadan olusturacagimiz tablo ismi varsa onceden onu siler

CREATE TABLE musteriler 
(
urun_id int,
musteri_isim varchar(50), 
urun_isim varchar(50)
);

INSERT INTO musteriler VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler VALUES (20, 'John', 'Apple'); 
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm'); 
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple'); 
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange'); 
INSERT INTO musteriler VALUES (40, 'John', 'Apricot'); 
INSERT INTO musteriler VALUES (20, 'Eddie','Apple');

SELECT * FROM musteriler;

--Musteriler tablosundan urun ismi orange,apple veya apricot olan verileri listeleyiniz

SELECT * FROM musteriler WHERE urun_isim='ORANGE' OR urun_isim='Apple' OR urun_isim='Apricot';

--IN - CONDITION**********YAZDIGIMIZ VERILERI GETIRIR

SELECT * FROM musteriler WHERE urun_isim IN('Orange','Apple','Apricot');


--NOT IN CONDITION***********YAZDIGIMIZ VERILERIN DISINDAKINI GETIRIR.

SELECT * FROM musteriler WHERE urun_isim NOT IN('Orange','Apple','Apricot');

