
-------IS NULL CONDITION***********

---- Arama yapilan field’da NULL degeri almis kayitlari getirir

CREATE TABLE insanlar
(
    ssn char(9),
    name varchar(50),  
    adres varchar(50)
);

INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');  
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');

SELECT * FROM insanlar;

--Name sutununda null olan degerleri listeleyelim

SELECT name FROM insanlar WHERE name IS NULL;


------                         IS NOT NULL      ********* NULL olmayan degerelri getirir.

--insanlar tablosunda Name sutununda null olmayan degerleri listeleyiniz.
 
SELECT name FROM insanlar WHERE name IS NOT NULL;

--insanlar tablosunda null almis verileri no name olarak degistiriniz.

UPDATE insanlar 
SET name ='No Name'
WHERE name IS NULL;

























