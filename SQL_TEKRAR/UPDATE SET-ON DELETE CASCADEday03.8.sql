-------DML --->UPDATE SET  ******** update Tablaodaki datayi update eder SET--->degistirme 
-- parent
CREATE TABLE tedarikciler4 
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);

INSERT INTO tedarikciler4 VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler4 VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler4 VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler4 VALUES (104, 'Apple', 'Adam Eve');

 -- child
CREATE TABLE urunler1
(
ted_vergino int, 
urun_id int, 
urun_isim VARCHAR(50), 
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler4(vergi_no)
on delete cascade
);    
INSERT INTO urunler1 VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler1 VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler1 VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler1 VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler1 VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler1 VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler1 VALUES(104, 1007,'Phone', 'Aslan Yılmaz');

SELECT * FROM tedarikciler4;
SELECT * FROM urunler1;

DROP table IF EXISTS urunler1;

DROP table IF EXISTS tedarikciler4;

/*
UPDATE tablo_adi
SET sutun_ismi = 'istenen veri' WHERE sutun_ismi = 'istenen veri'
 */


-- vergi_no’su 102 olan tedarikcinin firma ismini 'Vestel' olarak güncelleyeniz.

UPDATE tedarikciler4
SET firma_ismi='Vestel' WHERE vergi_no=102;

-- vergi_no’su 101 olan tedarikçinin firma ismini 'casper' ve irtibat_ismi’ni 
 --'Ali Veli' olarak güncelleyiniz.

UPDATE tedarikciler4
SET firma_ismi='Casper', irtibat_ismi='Ali Veli' WHERE vergi_no=101;

-- urunler tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyiniz.

UPDATE urunler1
SET urun_isim='Telefon' WHERE urun_isim='phone';

--urunler tablosundaki urun_id değeri 1004'ten 
--büyük olanların urun_id’sini 1 arttırın.

UPDATE urunler1
SET urun_id=urun_id+1 WHERE urun_id>1004;


--urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino 
--sutun değerleri ile toplayarak güncelleyiniz.

UPDATE urunler1
SET urun_id=urun_id+ted_vergino;

-- urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci tablosunda irtibat_ismi
-- 'Adam Eve' olan firmanın ismi (firma_ismi) ile degistiriniz.

UPDATE urunler1
SET urun_isim=(SELECT firma_ismi FROM tedarikciler4 WHERE irtibat_ismi='Adam Eve') WHERE musteri_isim='Ali Bak';

DELETE FROM tedarikciler4;
DELETE FROM urunler1;


--Urunler tablosunda laptop satin alan musterilerin ismini, firma_ismi 
--Apple’in irtibat_isim'i ile degistirin.

UPDATE urunler1
SET musteri_isim=(SELECT irtibat_ismi FROM tedarikciler4 WHERE firma_ismi='Apple') WHERE urun_isim='Laptop';










































