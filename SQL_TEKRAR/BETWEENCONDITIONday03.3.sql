
-- --------------BETWEEN CONDITION***********

/*BETWEEN Condition iki mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla
yazabilme imkani verir. Yazdigimiz 2 sinirda araliga dahildir */


CREATE TABLE musteriler1 (
urun_id int,
musteri_isim varchar(50), 
urun_isim varchar(50)
);

INSERT INTO musteriler1 VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler1 VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler1 VALUES (20, 'John', 'Apple'); 
INSERT INTO musteriler1 VALUES (30, 'Amy', 'Palm'); 
INSERT INTO musteriler1 VALUES (20, 'Mark', 'Apple'); 
INSERT INTO musteriler1 VALUES (10, 'Adem', 'Orange'); 
INSERT INTO musteriler1 VALUES (40, 'John', 'Apricot'); 
INSERT INTO musteriler1 VALUES (20, 'Eddie','Apple');

SELECT * FROM musteriler1;


--Musteriler tablosundan id,si 20 ile 40 arasinda olan tum verileri listeleyiniz

SELECT * FROM musteriler1 WHERE urun_id BETWEEN 20 AND 40;------>BETWEEN ILE YAPIMI


SELECT * FROM musteriler WHERE urun_id>=20 and urun_id<=40;------->AND ILE YAPIMI


-- NOT BETWEEN CONDITION***Yazdigimiz verilerin disindaki veriler

SELECT * FROM musteriler WHERE urun_id NOT BETWEEN 20 AND 40;




























































