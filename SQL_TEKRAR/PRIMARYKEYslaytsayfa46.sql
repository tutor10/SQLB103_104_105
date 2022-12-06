--Bir Tabloya “Primary Key” Nasil Eklenir
/*
Practice 3:
“sehirler” isimli bir Table olusturun.
Tabloda “alan_kodu”, “isim”, “nufus”
field’lari olsun. Isim field’i bos
birakilamasin.
1.Yontemi kullanarak “alan_kodu”
field’ini “Primary Key” yapin
*/

CREATE TABLE sehirler
(
	alan_kodu char(10) PRIMARY KEY,
	isim varchar(15),
	nufus varchar(30)
);

SELECT * FROM sehirler;

INSERT INTO sehirler(alan_kodu,isim,nufus) VALUES ('34','Istanbul','20000000');