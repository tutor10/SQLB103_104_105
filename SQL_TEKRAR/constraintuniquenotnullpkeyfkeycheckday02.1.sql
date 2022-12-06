---------------------CONSTRAINT**********

-----UNIQEU-------->Bir sutundaki tum degerlerin BENZERSIZ/TEKRARSIZ yani tek olmasini saglar.
---                 Hangi sutun ve data type'ni 'UNIQUE' yapmak istiyorsak sutun(id) data(char(4)) turunden sonra 'UNIQUE' yazariz .  ex:id char(7)UNIQUE,           

-----NOT NULL----->Bir sutunun 'NULL' icermemesini yani bos olmamasini saglar.'NOT NULL' kisitlamasi icin 'CONSTRAINT' ismi 
---                tanimlanmaz.Bu kisitlama veri turunden hemen sonra yerlestirilir
---                Hangi sutunun data type'ni 'NOT NULL' yapmak istiyorsak data sutun(isim) data(varchar(20)) turunden sonra 'NOT NULL' yazariz.   ex: isim varchar(20) NOT NULL,

-----PRIMARY KEY----->Bir sutunun 'NULL' icermemeisini ve sutundaki verilerin BENZERSIZ olmasini saglar(NOT NULL VE UNIQUE)
----                  sutun ve data turunden sonra yazilir EX:ogrenci_no char(7) PRIMARY KEY,
----         2.yol: en sona yani tablolardaki sutun ve data type lar yazildiktan sonra sona yazilir EX:CONSTRAINT ogr PRIMARY KEY (ogrenci_no)
-----        3.YOL :en sona yani tablolardaki sutun ve data type lar yazildiktan sonra sona yazilir EX: PRIMARY KEY (ogrenci_no)

-----FOREIGN KEY------>Baska tablodaki 'PRIMARY KEY'i' referance gostermek icin kullanilir,boylelikle tablolar arasinda iliski kurulmus olur.

-----CHECK------------->Bir sutuna yerlestirilebilecek deger araligini sinirlamak icin kullanilir.



CREATE TABLE ogrenciler2
(
       ogrenci_no char(7) UNIQUE,
       isim varchar(20) NOT NULL,
       soyisim varchar(25),
       not_ort real,
       kayit_tarih date
);

SELECT * FROM ogrenciler2;---olusturdugumuz tabloyu(ogrenciler2) gormek icin


INSERT INTO ogrenciler2 VALUES ('1234567','Erol','Evren',75.5,now());
INSERT INTO ogrenciler2 VALUES  ('1234568','Ugur','Tastan',75.5,now());

-----ogrenci_no char(7) UNIQUE tekrasiz olmasi gerektiginden asagidaki ogrenci_no('1234568') ayni oldugundan ERROR verdi
INSERT INTO ogrenciler2 VALUES  ('1234568','Ali','Veli',75.5,now());

------ogrenci_no('1234569') yu degistirince hata vermedi 
INSERT INTO ogrenciler2 VALUES  ('1234569','Ali','Veli',75.5,now());


----PARCALI VERI EKLEME YANI BUTUN SUTUNLARA EKLEME YAPMAMAK 'NOT NULL' DA YAPILAMAZ.***

INSERT INTO ogrenciler2 (ogrenci_no,soyisim,not_ort) VALUES('1234570','Tastan',90.5);

-----PRIMARY KEY ATAMASI (PARENT)

---PRIMARY KEY bir recordu tanimlayan bir field vaye birden fazla fieldin kombinasyonudur
---PRIMARY KEY Unique dir
---Bir tabloda en fazla bir PRIMARY KEY olabilir.
---PRIMARY KEY field inda hic bir data NULL olamaz

-----PRIMARY KEY ATAMASI 1.YOL
-----Eger CONSTRAINT ismini kendimiz vermesek istemzsek bu yolu kullanabiliriz.
CREATE TABLE ogrenciler3
(
       ogrenci_no char(7) PRIMARY KEY,
       isim varchar(20) ,
       soyisim varchar(25),
       not_ort real,
       kayit_tarih date
);


SELECT * FROM ogrenciler3;---olusturdugumuz tabloyu(ogrenciler3) gormek icin

-----PRIMARY KEY ATAMASI 2.YOL

-----Eger CONSTRAINT ismini kendimiz vermek istersek bu yolu kullanabiliriz.
CREATE TABLE ogrenciler4
(
       ogrenci_no char(7) ,
       isim varchar(20) ,
       soyisim varchar(25),
       not_ort real,
       kayit_tarih date,
CONSTRAINT ogr PRIMARY KEY (ogrenci_no)
);

SELECT * FROM ogrenciler4;


-----PRIMARY KEY ATAMASI 3.YOL

-----Eger CONSTRAINT ismini kendimiz vermesek istemzsek bu yolu kullanabiliriz.
CREATE TABLE ogrenciler5
(
       ogrenci_no char(7) ,
       isim varchar(20) ,
       soyisim varchar(25),
       not_ort real,
       kayit_tarih date,
PRIMARY KEY (ogrenci_no)
);

SELECT * FROM ogrenciler5;

/*
*******************FOREIGN KEY**************
---Foreign Key iki tablo arasinda Relation olusturmak icin kullanilir.

--- Foreign Key baska bir tablonun Primary Key’ine baglidir.

--- Referenced table (baglanilan tablo, Primary Key’in oldugu Tablo) parent table olarak
    adlandirilir. Foreign Key’in oldugu tablo ise child table olarak adlandirilir.

---- Bir Tabloda birden fazla Foreign Key olabilir

---- Foreign Key NULL degeri alabilir

----Foreign key child dir
*/

/*
“tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”,
“iletisim_isim” field’lari olsun ve “tedarikci_id” yi Primary Key yapin.
“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
“tedarikci_id” yi Foreign Key yapin.
*/

CREATE TABLE tedarikciler3
(
tedarikci_id char(5) PRIMARY KEY,
tedarikci_ismi varchar(20),
iletisim_ismi varchar(20)
);

SELECT * FROM tedarikciler3;

CREATE TABLE urunler
(
tedarikci_id char(5),
urun_id char(5),
FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler3(tedarikci_id)--FOREIGN KEY OLUNCA bagli oldugu PRIMARY KEY olmali
);

SELECT * FROM urunler;

/*
“calisanlar” isimli bir Tablo olusturun. Icinde “id”, 
“isim”, “maas”, “ise_baslama” field’lari olsun. “id” yi Primary Key yapin,
“isim” i Unique, “maas” i Not Null yapın.
“adresler” isminde baska bir tablo olusturun.
Icinde “adres_id”, “sokak”, “cadde” ve “sehir” fieldlari olsun.
“adres_id” field‘i ile Foreign Key oluşturun.
*/

CREATE TABLE calisanlar
(
id varchar(15) PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int NOT NULL,
ise_baslama date
);

SELECT * FROM calisanlar;

CREATE TABLE adresler
(
adres_id varchar(30),
sokak varchar(30),
cadde varchar(30),
sehir varchar(30),
FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
);

SELECT * FROM adresler;

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14'); -- UNIQUE CONS. Kabul etmez
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); -- NOT NULL CONS. Kabul etmez
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); -- UNIQUE CONS. Kabul etmez
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14'); --INT/STRING
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14'); -- PRIMARY KEY
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); -- PRIMARY KEY
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); -- PRIMARY KEY

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');

-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');

-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');

--CHECK CONSTRAINT***********

---'CHECK' yapisini kullanarak negatif giris yapilmasini engelleriz

CREATE TABLE calisanlar1
(
id varchar(15) PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int CHECK (maas>10000),
ise_baslama date
);

INSERT INTO calisanlar1 VALUES('10002', 'Mehmet Yılmaz' , 19000, '2018-04-14');

SELECT * FROM calisanlar1;
SELECT isim FROM calisanlar1;
