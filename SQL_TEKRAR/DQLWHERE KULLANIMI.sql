--ORNEKLER;
SELECT * FROM calisanlar;
SELECT isim FROM calisanlar;
SELECT id FROM calisanlar;
SELECT maas FROM calisanlar;
SELECT ise_baslama FROM calisanlar;



--DQL DATA QUERY LANG.WHERE KULLANIMI********

--Calisanlar tablosundan maasi 500 den buyuk olan isimleri listeleyiniz

SELECT isim FROM calisanlar WHERE maas>500;


--Calisanlar tablosundan ismi Veli Han olan tum verileri listeleyiniz.

SELECT * FROM calisanlar WHERE isim='Veli Han';


--Calisanlar tablosundan ismi Veli Han olan veriyi listeleyiniz.

SELECT isim FROM calisanlar WHERE isim='Veli Han';


--Calisanlar tablosundan maasi 5000 olan tum veriyi listeleyiniz.

SELECT * FROM calisanlar WHERE maas=5000;




