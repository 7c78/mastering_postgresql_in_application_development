SELECT
  artist.name   AS artist,
  inspired.name AS inspired,
  album.title   AS album,
  track.name    AS track
FROM
  artist
JOIN
  track ON track.name = artist.name
JOIN
  album ON album.albumid = track.albumid
JOIN
  artist inspired ON inspired.artistid = album.artistid
WHERE
  artist.artistid <> inspired.artistid;
