create table ogrenciler9
(
id int,
isim varchar(40),
adres varchar(100),
sinav_notu int
);

--- INSERT:Veritabanına yeni veri ekler.

insert into ogrenciler9 values(120, 'Ali Can', 'Ankara', 75);
insert into ogrenciler9 values(121, 'Veli Mert', 'Trabzon', 85);
insert into ogrenciler9 values(122, 'Ayşe Tan', 'Bursa', 65);
insert into ogrenciler9 values(123, 'Derya Soylu', 'Istanbul', 95);
insert into ogrenciler9 values(124, 'Yavuz Bal', 'Ankara', 85);
insert into ogrenciler9 values(125, 'Emre Gül', 'Hatay', 90);
insert into ogrenciler9 values(126, 'Harun Reşit', 'Isparta', 100);

select * from ogrenciler9;

--SORU : ogrenciler tablosundaki id ve isim sutununu getiriniz

SELECT id,isim FROM ogrenciler9;



--SORU: Sınav notu 80'den büyük olan öğrencilerin tüm bilgilerini listele


SELECT * FROM ogrenciler9 WHERE sinav_notu>80;

--SORU: Adresi Ankara olan ögrencilerin tüm bilgilerini listele

SELECT * FROM ogrenciler9 WHERE adres='Ankara';

--SORU: Sınav notu 85 ve adresi Ankara olan öğrenci ismini listele

SELECT isim FROM ogrenciler9 WHERE sinav_notu='85' and adres='Ankara';

--SORU: .Sınav notu 65 veya 85 olan ogrencilerin tüm bilgilerini listele

SELECT * FROM ogrenciler WHERE sinav_notu='65' OR sinav_notu='85';

SELECT * FROM ogrenciler9 WHERE sinav_notu IN (65,85);

--SORU: .Sınav notu 65 ve 85 arasında olan ogrencilerin tüm bilgilerini listele]

SELECT * FROM ogrenciler9 WHERE sinav_notu BETWEEN 65 AND 85;


--SORU: .id'si 122 ve 125 arasında olmayan ögrencilerin isim ve sınav notu listele


SELECT isim,sinav_notu FROM ogrenciler9 WHERE id NOT BETWEEN 122 AND 125;

SELECT * FROM ogrenciler9 WHERE id NOT BETWEEN 122 AND 125;


--SORU: sinav_notu 75 olan satırı siliniz

DELETE FROM ogrenciler9 WHERE sinav_notu='75';

--SORU: adres'i Trabzon olan satırı siliniz

DELETE FROM ogrenciler9 WHERE adres='Trabzon';

--SORU: ismi Derya Soylu veya Yavuz Bal olan satırları siliniz

DELETE FROM ogrenciler9 WHERE isim='Derya Soylu' OR isim='Yavuz Bal';

--SORU: sınav notu 100 den küçük olan satırları siliniz

DELETE FROM ogrenciler9 WHERE sinav_notu<100;

--SORU: Tablodaki tüm satırları siliniz

DELETE FROM ogrenciler9;

/*
SORU: memurlar isminde bir tablo oluşturunuz. id, isim, maas sutunları olsun.
id sutununun data tipi int olsun. PRİMARY KRY kısıtlaması olsun.
isim sutununun data tipi varchar(30) olsun. UNIQUE kısıtlaması olsun.
maas sutununun data tipi int olsun. maas 5000 buyuk olsun. NOT NULL kısıtlaması ols
*/

CREATE TABLE memurlar 
(
	id char(20) PRIMARY KEY,
	isim varchar(30) UNIQUE,
	maas int NOT NULL,--maas int CHECK(maas>5000) NOT NULL
	CONSTRAINT maas_check CHECK (maas>5000)
);

SELECT * FROM memurlar;

/*
SORU: insanlar isminde bir tablo oluşturunuz. isim, soyisim sutunları olsun.
isim sutununun data tipi int olsun. PRİMARY KEY kısıtlaması olsun. Kısıtlamanın ismi pr_ks olsun
soyisim sutununun data tipi varchar(30) olsun. UNIQUE kısıtlaması olsun. Kısıtlamanın ismi uni_ks olsun
*/



create table insanlar(
isim int,
soyisim varchar(30),
	
CONSTRAINT pr_ks PRIMARY KEY(isim),
CONSTRAINT uni_ks UNIQUE(soyisim)
)







































