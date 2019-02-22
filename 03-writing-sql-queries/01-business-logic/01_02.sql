SELECT
  track.name AS track,
  genre.name AS genre
FROM
  track
JOIN
  genre using(genreid)
WHERE
  albumid = 193
ORDER BY
  trackid;
