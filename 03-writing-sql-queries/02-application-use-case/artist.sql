-- name: top-artists-by-album
-- Get the list of the N artist with the most albums
\set n 3

SELECT
  artist.name,
  count(*) AS albums
FROM
  artist
LEFT JOIN
  album USING(artistid)
GROUP BY
  artist.name
ORDER BY
  albums DESC
LIMIT :n;
