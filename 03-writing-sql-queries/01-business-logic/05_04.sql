SELECT
  album,
  duration,
FROM
  artist,
  LATERAL get_all_albums(artistid)
WHERE
  artist.name = 'Red Hot Chili Peppers';


SELECT
  album,
  artistid,
  duration
FROM
  artist
LEFT JOIN get_all_albums(artistid) USING(artistid);
