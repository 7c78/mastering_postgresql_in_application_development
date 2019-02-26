SELECT
  COUNT(DISTINCT(driverid))
FROM
  results
JOIN
  drivers USING(driverid)
WHERE
  position = 1;
