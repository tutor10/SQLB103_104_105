--DML DATA MANIPULATION LANG. DELETE KOMUTU


DELETE FROM calisanlar;--(calisanlar=PARENT)Eger parent tablo baska bir child tablo ile iliskilisyse once child tablo silinmelidir

DELETE FROM adresler;--(adresler=CHILD) Once Cocuk(child) sonra parent silinebilir.


-- Adresler tablosundan sehri Antep olan verileri silelim

DELETE FROM adresler WHERE sehir='Antep';

SELECT * FROM adresler;

SELECT * FROM calisanlar;


CREATE TABLE ogrenciler6
(
      id int,
      isim VARCHAR(50),
      veli_isim VARCHAR(50),
      yazili_notu int
);

INSERT INTO ogrenciler6 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler6 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler6 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler6 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler6 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler6 VALUES(127, 'Mustafa Bak', 'Ali', 99);

SELECT * FROM ogrenciler6;

-- ismi Nesibe Yilmaz veya Mustafa Bak olan kayıtları silelim.

DELETE FROM ogrenciler6 WHERE isim='Nesibe Yilmaz' or isim='Mustafa Bak';

