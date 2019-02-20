SELECT name, title
  FROM artist NATURAL JOIN album
 WHERE artist.artistid = 1;
