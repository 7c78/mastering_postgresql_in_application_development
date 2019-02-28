SELECT
  year,
  drivers.code,
  format('%s %s', forename, surname) AS name,
  COUNT(*)
FROM
  results
JOIN
  races USING(raceid)
JOIN
  drivers USING(driverid)
WHERE
  grid = 1
  AND position = 1
GROUP BY
  year,
  drivers.driverid
ORDER BY
  count DESC
LIMIT 10;
