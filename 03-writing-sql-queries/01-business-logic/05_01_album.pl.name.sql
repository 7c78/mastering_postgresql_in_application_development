CREATE OR REPLACE FUNCTION get_all_albums (
  IN  name     TEXT,
  OUT album    TEXT,
  OUT duration INTERVAL
)
RETURNS SETOF RECORD
LANGUAGE SQL
AS $$
  SELECT
    album.title                         AS album,
    SUM(milliseconds) * INTERVAL '1 ms' AS duration
  FROM
    album
  JOIN
    artist USING(artistid)
  LEFT JOIN
    track  USING(albumid)
  WHERE
    artist.name = get_all_albums.name
  GROUP BY
    album
  ORDER BY
    album;
$$;
