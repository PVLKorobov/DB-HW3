-- Количество исполнителей в каждом жанре.
SELECT genre_name, COUNT(ag.author_id) FROM GENRES G 
LEFT JOIN AUTHOR_GENRE AG ON g.id = ag.genre_id
GROUP BY GENRE_NAME;

-- Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT COUNT(t.id) FROM tracks t  
LEFT JOIN albums a ON t.album_id = a.ID
WHERE a.release_year BETWEEN 2019 AND 2020;

-- Средняя продолжительность треков по каждому альбому.
SELECT a.album_name, AVG(t.track_length) FROM albums a 
RIGHT JOIN tracks t ON a.id = t.album_id 
GROUP BY a.album_name ;

-- Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT a.author_name FROM authors a 
LEFT JOIN author_album aa ON a.id = aa.author_id 
LEFT JOIN albums al ON aa.album_id = al.id 
WHERE  (SELECT COUNT(a2.author_name) FROM authors a2
		LEFT JOIN author_album aa ON a.id = aa.author_id 
		LEFT JOIN albums al ON aa.album_id = al.id
		WHERE al.release_year = 2020) = 0
GROUP BY a.author_name;

-- Названия сборников, в которых присутствует конкретный исполнитель (Linkin Park).
SELECT c.compilation_name FROM compilations c 
LEFT JOIN track_compilation tc ON c.id = tc.compilation_id 
LEFT JOIN tracks t ON tc.track_id = t.id 
LEFT JOIN albums a ON t.album_id = a.id 
LEFT JOIN author_album aa ON a.id = aa.album_id 
LEFT JOIN authors au ON aa.author_id = au.id 
WHERE au.author_name = 'Linkin Park';

-- Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT DISTINCT al.album_name FROM albums al
LEFT JOIN author_album aa ON al.id = aa.album_id 
LEFT JOIN authors a ON a.id = aa.author_id 
LEFT JOIN author_genre ag ON a.id = ag.author_id
WHERE  a.author_name IN (SELECT a.author_name FROM authors a 
						 LEFT JOIN author_genre ag ON a.id = ag.author_id
						 WHERE a.author_name IN (SELECT a2.author_name FROM authors a2
						 LEFT JOIN author_genre ag2 ON a2.id = ag2.author_id
						 GROUP BY a2.author_name
						 HAVING COUNT(*) > 1));

-- Наименования треков, которые не входят в сборники
SELECT t.track_name FROM tracks t
LEFT JOIN track_compilation tc ON t.id = tc.track_id
LEFT JOIN compilations c ON tc.compilation_id = c.id
WHERE c.compilation_name IS NULL;

-- Исполнитель или исполнители, написавшие самый короткий по продолжительности трек
SELECT a.author_name FROM authors a
LEFT JOIN author_album aa ON aa.author_id = a.id
LEFT JOIN albums al ON aa.album_id = al.id
LEFT JOIN tracks t ON al.id = t.album_id
WHERE t.track_length = (SELECT MIN(track_length) FROM tracks);

-- Названия альбомов, содержащих наименьшее количество треков.
SELECT al.album_name FROM albums al
LEFT JOIN tracks t ON al.id = t.album_id
GROUP BY al.album_name
HAVING COUNT(t.track_name) = (SELECT COUNT(t.track_name) FROM albums al
							  LEFT JOIN tracks t ON al.id = t.album_id
							  GROUP BY al.album_name
							  ORDER BY COUNT(t.track_name)
							  LIMIT 1);

