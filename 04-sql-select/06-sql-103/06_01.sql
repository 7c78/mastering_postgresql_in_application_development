SELECT
  DISTINCT ON (driverid)
  forename,
  surname
FROM
  results
JOIN
  drivers USING(driverid)
WHERE
  position = 1;
