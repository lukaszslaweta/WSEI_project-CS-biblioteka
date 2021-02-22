-- nie da się utworzyć database i jej od razu używać
CREATE DATABASE biblioteka;
USE biblioteka;

CREATE TABLE autor(
	autor_id INT CONSTRAINT pkey_autor PRIMARY KEY IDENTITY(1,1),
	imie TEXT NOT NULL,
	nazwisko TEXT NOT NULL
);
CREATE TABLE ksiazka(
	ksiazka_id INT CONSTRAINT pkey_ksiazka PRIMARY KEY IDENTITY(1,1),
	autor_id INT CONSTRAINT fkey_ksiazka_autor REFERENCES autor(autor_id),
	tytul TEXT NOT NULL,
	data_wydania DATE NOT NULL,
	wydawnictwo TEXT NOT NULL,
	liczba_stron INT
);
CREATE TABLE klient(
	klient_id INT CONSTRAINT pkey_klient PRIMARY KEY IDENTITY(1,1),
	imie TEXT,
	nazwisko TEXT,
	adres TEXT,
	data_urodzenia DATETIME,
	telefon TEXT
);
CREATE TABLE wypozyczenie (
	wypozyczenie_id INT CONSTRAINT pkey_wypozyczenie PRIMARY KEY IDENTITY(1,1),
	ksiazka_id INT CONSTRAINT fkey_wypozyczenie_ksiazka REFERENCES ksiazka(ksiazka_id),
	klient_id INT CONSTRAINT fkey_wypozyczenie_klient REFERENCES klient(klient_id),
	data_wypozyczenia DATETIME NOT NULL,
	data_oddania DATETIME NULL
);
