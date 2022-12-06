

-----ALIASES***********2 fieldi birlestiriyor

DROP TABLE IF EXISTS calisanlar5;---Olusturacagimiz table in onceden olusturulduysa silmek icin kullaniriz

CREATE TABLE calisanlar5 
(
    calisan_id char(9),
    calisan_isim varchar(50),
    calisan_dogdugu_sehir varchar(50)
);

INSERT INTO calisanlar5 VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO calisanlar5 VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO calisanlar5 VALUES(345678901, 'Mine Bulut', 'Izmir');

SELECT * FROM calisanlar5;

--Eger iki sutunun verilerini birlestirmek istersek concat sembolu || kullanarakta AS yazip iki sutunun ismini bir isim sekline donderebiliriz.

--AS ile sutundaki verinin ismini gecici olarak degistirebiliriz.Sutunun ilk ismini yazip sonra AS yazip yeni ismini yazariz.

--1.yol
SELECT calisan_id AS id,calisan_isim || '  ' ||calisan_dogdugu_sehir  AS calisan_bilgisi FROM calisanlar5;

--2. YOl
SELECT calisan_id AS id, concat (calisan_isim,' ',calisan_dogdugu_sehir) AS calisan_bilgisi FROM calisanlar5;

--|| '  ' || ve ,' ',veri aralarina bosluk koymak icin

--|| '  ' || birlestirme isaretleri yerine CONCAT (SUTUN ISIMLERI......)YAPARAKTA BIRLESTIRME YAPILABILR.














































