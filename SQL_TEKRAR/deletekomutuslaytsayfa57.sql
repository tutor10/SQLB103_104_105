CREATE TABLE ogrenciler8
(
      id int,
      isim VARCHAR(50),
      veli_isim VARCHAR(50),
      yazili_notu int
);

INSERT INTO ogrenciler8 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler8 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler8 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler8 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler8 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler8 VALUES(127, 'Mustafa Bak', 'Ali', 99);

SELECT * FROM ogrenciler8;

-- İsmi Ali Can ve id'si 123 olan kaydı siliniz.
DELETE FROM ogrenciler8 WHERE isim='Ali Can' and id='123';

-- id 'si 126'dan büyük olan kayıtları silelim.
DELETE FROM ogrenciler8 WHERE id>126;

-- id'si 123, 125 veya 126 olanları silelim.
DELETE FROM ogrenciler8 WHERE id='123'or id='125' or id='126';

