SELECT title, duration
FROM Tracks
ORDER BY duration DESC
LIMIT 1;

SELECT title, duration
FROM Tracks
WHERE duration >= TIME '00:03:30';

SELECT title
FROM Collections
WHERE release_year BETWEEN 2018 AND 2020;

SELECT name
FROM Artists
WHERE name NOT LIKE '% %';

SELECT title
FROM Tracks
WHERE string_to_array(lower(title), ' ') && ARRAY['my', 'мой'];


SELECT 
    g.name AS genre,
    COUNT(ag.artist_id) AS artist_count
FROM Genres g
LEFT JOIN Artist_Genre ag ON g.id = ag.genre_id
GROUP BY g.name;

SELECT COUNT(t.id) AS track_count
FROM Tracks t
JOIN Albums a ON t.album_id = a.id
WHERE a.release_year BETWEEN 2019 AND 2020;


SELECT a.title, make_interval(secs => ROUND(AVG(EXTRACT(EPOCH FROM t.duration)))) AS avg_duration
FROM Albums a
JOIN Tracks t ON a.id = t.album_id
GROUP BY a.title;


SELECT a.name
FROM Artists a
WHERE NOT EXISTS (
  SELECT 1
  FROM Artist_Album aa
  JOIN Albums alb ON aa.album_id = alb.id
  WHERE aa.artist_id = a.id AND alb.release_year = 2020
);

SELECT DISTINCT c.title
FROM Collections c
JOIN Track_Collection tc ON c.id = tc.collection_id
JOIN Tracks t ON tc.track_id = t.id
JOIN Albums a ON t.album_id = a.id
JOIN Artist_Album aa ON a.id = aa.album_id
JOIN Artists ar ON aa.artist_id = ar.id
WHERE ar.name = 'Michael Jackson';

SELECT DISTINCT a.title
FROM Albums a
JOIN Artist_Album aa ON a.id = aa.album_id
JOIN Artist_Genre ag ON aa.artist_id = ag.artist_id
GROUP BY a.title, aa.artist_id
HAVING COUNT(DISTINCT ag.genre_id) > 1;


SELECT title
FROM Tracks
WHERE id NOT IN (
  SELECT track_id
  FROM Track_Collection
);

WITH min_duration AS (
    SELECT MIN(duration) AS min_dur
    FROM Tracks
)
SELECT DISTINCT ar.name
FROM Artists ar
JOIN Artist_Album aa ON ar.id = aa.artist_id
JOIN Albums al ON aa.album_id = al.id
JOIN Tracks t ON al.id = t.album_id
JOIN min_duration md ON t.duration = md.min_dur;

WITH track_counts AS (
  SELECT 
    a.id,
    a.title,
    COUNT(t.id) AS track_count
  FROM Albums a
  LEFT JOIN Tracks t ON a.id = t.album_id
  GROUP BY a.id, a.title
)
SELECT title
FROM track_counts
WHERE track_count = (SELECT MIN(track_count) FROM track_counts);