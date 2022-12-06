--TRUNCATE--*****
--Bir tablodaki tum verileri geri alamayacagimiz sekilde siler ,sartli silme yapmaz

TRUNCATE TABLE ogrenciler7;--veya sadece TRUNCATE de yazilincada kabul ediyor


---DROP TABLE IF EXISTS KOMUTU**************
DROP TABLE if exists talebeler1--*******EGER TABLO VARSA TABLOYU SILER******
DROP TABLE IF EXISTS adresler1


--ON DELETE CASCADE*********

/*
1. tablolardan veri silmek icin.. normalde oncelikle  childdaki datayi silmemiz gerekir.
2. child da on delete cascade kullanirsak... parent'dan datayi silebiliriz.
3. bu durumda data hem parenttan hemde childdan silinir.
*/


CREATE TABLE talebeler1
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

CREATE TABLE notlar1
(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,

CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler1(id)

);

INSERT INTO talebeler1 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler1 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler1 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler1 VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler1 VALUES(127, 'Mustafa Bak', 'Can',99);

INSERT INTO notlar1 VALUES ('123','kimya',75);
INSERT INTO notlar1 VALUES ('124', 'fizik',65);
INSERT INTO notlar1 VALUES ('125', 'tarih',90);
INSERT INTO notlar1 VALUES ('126', 'Matematik',90);

SELECT * FROM talebeler1;
SELECT * FROM notlar1;

--NOTLAR TABLOSUNDAN talebe_id,si 123 OLAN DATAYI SILELIM

DELETE FROM notlar1 WHERE talebe_id='123';

--Talebeler tablsoundan id,si 126 olan datayi silelim.

DELETE FROM talebeler1 WHERE id='126';--on delete cascade OLMADIGI ICIN SILMEDI ONCE CHILD TABLE DAN SILINMESI GEEKIR 
--                                     on delete cascade koyarsak parentanda silebilirz sildigimizde childdanda direkt silinmis olur


CREATE TABLE talebe
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

CREATE TABLE not1
(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,

CONSTRAINT not1_fk FOREIGN KEY (talebe_id) REFERENCES talebe(id)
on delete cascade
);

INSERT INTO talebe VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebe VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebe VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebe VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebe VALUES(127, 'Mustafa Bak', 'Can',99);

INSERT INTO not1 VALUES ('123','kimya',75);
INSERT INTO not1 VALUES ('124', 'fizik',65);
INSERT INTO not1 VALUES ('125', 'tarih',90);
INSERT INTO not1 VALUES ('126', 'Matematik',90);

SELECT * FROM talebe;
SELECT * FROM not1;

--Talebeler tablsoundan id,si 126 olan datayi silelim.
DELETE FROM talebe WHERE id='126';--on delete cascade koydugumuz icin parenttan sildi otomatikman childdanda silinmis oldu