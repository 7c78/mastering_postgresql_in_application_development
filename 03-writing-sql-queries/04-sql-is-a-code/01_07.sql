SELECT
  title,
  name,
  milliseconds
FROM (
  SELECT
    albumid,
    title
  FROM
    album
  JOIN
    artist USING(artistid)
  WHERE
    artist.name = 'AC/DC'
) AS artist_albums
LEFT JOIN
  track USING(albumid)
ORDER BY
  trackid;
