  SELECT name, milliseconds
    FROM album LEFT JOIN track USING(albumid)
  WHERE albumid = 1
ORDER BY 2;
