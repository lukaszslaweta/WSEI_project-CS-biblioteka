USE biblioteka;

SET IDENTITY_INSERT autor on;
INSERT INTO autor(autor_id, imie, nazwisko) VALUES 
	(1, 'Stephen', 'King'),
	(2, 'Juliusz', 'Słowacki');
SET IDENTITY_INSERT autor off;
	
SET IDENTITY_INSERT ksiazka on;
INSERT INTO ksiazka(ksiazka_id, autor_id, tytul, data_wydania, wydawnictwo, liczba_stron) VALUES
	(1, 1, 'Instynkt', '2019-01-01', 'Albatros', 672),
	(2, 1, 'Outsider', '2018-05-22', 'Albatros', 560),
	(3, 2, 'Kordian', '1834-01-01', 'Czarne', 128);
SET IDENTITY_INSERT ksiazka off;

SET IDENTITY_INSERT klient on;
INSERT INTO klient(klient_id, imie, nazwisko, adres, data_urodzenia, telefon) VALUES
	(1, 'Jan', 'Nowak', 'ul. Testowej 13/4, 31-455 Kraków', '1994-05-03', '+48 573 850 234');
SET IDENTITY_INSERT klient off;
	
SET IDENTITY_INSERT wypozyczenie on;
INSERT INTO wypozyczenie(wypozyczenie_id, ksiazka_id, klient_id, data_wypozyczenia, data_oddania) VALUES
	(1, 2, 1, '2021-01-25', '2021-02-14'),
	(2, 3, 1, '2021-02-16', NULL);
SET IDENTITY_INSERT wypozyczenie off;