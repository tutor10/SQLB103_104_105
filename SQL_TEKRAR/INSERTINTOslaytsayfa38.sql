
---'OGRETMENLER'isminde tablo olusturun.icinde 'kimlik_no','isim','brans've 'cinsiyet fieldlari olsun

CREATE TABLE ogretmenler
(
kimlik_no char(10) PRIMARY KEY,
	isim varchar(10),
	brans char(10),
	cinsiyet char(7)
);

SELECT * FROM ogretmenler;

---'OGRETMENLR'tablosuna bilgileri asagidaki gibi olan kisiye ekleyin
--- kimlik_no:234431223,isim:Ayse Guler,brans:Matematik,cinsiyet:kadin.

INSERT INTO ogretmenler(kimlik_no,isim,brans,cinsiyet) VALUES ('2344312','Ayse Guler','Matematik','kadin');

--'ogretemenler'tablosunua asagidaki gibi olan bir ksi ekleyin

INSERT INTO ogretmenler(kimlik_no,isim) VALUES ('5675976','Ali Veli');