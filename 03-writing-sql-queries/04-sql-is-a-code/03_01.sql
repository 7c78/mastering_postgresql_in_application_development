WITH artist_albums AS
 (
    SELECT albumid, title
      FROM      album
           JOIN artist using(artistid)
     WHERE artist.name = 'AC/DC'
 )
  SELECT title, name, milliseconds
    FROM artist_albums
          LEFT JOIN track
              using(albumid)
ORDER BY trackid;
