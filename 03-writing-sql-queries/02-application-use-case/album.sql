\set n 3

-- name: list-album-by-artist
-- List the album titles and duration of a given artist
SELECT
  album.title                         AS album,
  SUM(milliseconds) * INTERVAL '1 ms' AS duration
FROM
  album
JOIN
  artist USING(artistid)
LEFT JOIN
  track USING(albumid)
WHERE
  artist.name = 'Red Hot Chili Peppers'
GROUP BY
  album
ORDER BY
  album;
