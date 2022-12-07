-- 	            GROUP BY CLAUSE      *********

-- Group By komutu sonuçları bir veya daha fazla sütuna göre gruplamak için 'SELECT'
-- komutuyla birlikte kullanılır


CREATE TABLE manav
(
    isim varchar(50),  
	Urun_adi varchar(50),  
	Urun_miktar int
);

INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

SELECT * FROM manav;


--Isme gore alinan toplam urunleri bulun

SELECT SUM(urun_miktar) AS urun_miktar FROM manav;--burada AGGREGATE METHOD SUM(urun_miktar)tek sonuc getirir yani tum urunlerin toplamini 
 
SELECT isim, sum(urun_miktar)AS aldigi_toplam_urun FROM manav GROUP BY isim;

-- Isme gore alinan toplam urunleri bulun ve bu urunleri buyukten kucuge listeleyiniz

SELECT isim,SUM(urun_miktar)AS aldigi_toplam_urun FROM manav GROUP BY isim ORDER BY aldigi_toplam_urun DESC;

-- Urun ismine gore urunu alan toplam kisi sayisi

SELECT urun_adi ,COUNT(isim) FROM manav GROUP BY urun_adi ;

SELECT isim,COUNT(urun_adi) FROM manav GROUP BY isim;

SELECT isim,count(urun_adi) AS aldigi_urun_miktari FROM manav GROUP BY isim;


SELECT COUNT (isim) FROM manav;--BURADA COUNT TOPLAM URUN MIKTARINI VERIR TEK SONUC





















































