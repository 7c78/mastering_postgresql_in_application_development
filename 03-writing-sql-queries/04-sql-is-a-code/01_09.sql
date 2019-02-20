SELECT name, title
  FROM artist
       INNER JOIN album USING(artistid)
 WHERE artist.artistid = 1;
