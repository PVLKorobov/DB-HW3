-- Название и год выхода альбомов, вышедших в 2018 году
SELECT album_name, release_year FROM ALBUMS
WHERE release_year = 2018;

-- Название и продолжительность самого длительного трека
SELECT track_name, track_length FROM TRACKS
ORDER BY TRACK_LENGTH DESC
LIMIT 1;

-- Название треков, продолжительность которых не менее 3,5 минут
SELECT track_name FROM TRACKS
WHERE TRACK_LENGTH >= 210;

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT compilation_name FROM COMPILATIONS
WHERE RELEASE_YEAR BETWEEN 2018 AND 2020;

-- Исполнители, чьё имя состоит из одного слова
SELECT author_name FROM AUTHORS
WHERE AUTHOR_NAME NOT LIKE '% %';

-- Название треков, которые содержат слово «мой» или «my»
SELECT track_name FROM TRACKS
WHERE (TRACK_NAME LIKE '% my %'
	OR TRACK_NAME LIKE '% My %'
	OR TRACK_NAME LIKE 'My %'
	OR TRACK_NAME LIKE 'my %'
	OR TRACK_NAME LIKE '% my'
	OR TRACK_NAME LIKE '% My'
	OR TRACK_NAME LIKE '% мой %'
	OR TRACK_NAME LIKE '% Мой %'
	OR TRACK_NAME LIKE 'мой %'
	OR TRACK_NAME LIKE 'Мой %'
	OR TRACK_NAME LIKE '% мой'
	OR TRACK_NAME LIKE '% Мой');