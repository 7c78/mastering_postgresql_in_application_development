\set n 3
-- name: genre-top-n
-- Get the N top tracks by genre
SELECT
  genre.name AS genre,
  CASE
    WHEN length(ss.name) > 15
    THEN substring(ss.name FROM 1 FOR 15) || '...'
    ELSE ss.name
  END AS track,
  artist.name AS artist
FROM
  genre
LEFT JOIN
  lateral(
   /*
    * the lateral left join implements a nested loop over
    * the genres and allows to fetch our Top-N tracks per
    * genre, applying the order by desc limit n clause.
    *
    * here we choose to weight the tracks by how many
    * times they appear in a playlist, so we join against
    * the playlisttrack table and count appearances.
    */
    SELECT
      track.name,
      track.albumid,
      COUNT(playlistid)
    FROM
      track
    LEFT JOIN
      playlisttrack USING(trackid)
    WHERE
      track.genreid = genre.genreid
    GROUP BY
      track.trackid
    ORDER BY
      count DESC
    LIMIT :n
  ) ss(name, albumid, count) ON true
   /*
    * the join happens in the subquery's where clause, so
    * we don't need to add another one at the outer join
    * level, hence the "on true" spelling.
    */
JOIN
  album USING(albumid)
JOIN
  artist USING(artistid)
ORDER BY
  genre.name,
  ss.count DESC;
