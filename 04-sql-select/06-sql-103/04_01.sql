\set season 'date ''1978-01-01'''

SELECT
  drivers.surname   AS driver,
  constructors.name AS constructors,
  SUM(points)       AS points
FROM
  results
JOIN
  races USING(raceid)
JOIN
  drivers USING(driverid)
JOIN
  constructors USING(constructorid)
WHERE
  date >= :season
  AND date < :season + interval '1 year'
GROUP BY
  GROUPING SETS(
    (drivers.surname),
    (constructors.name)
  )
HAVING
  SUM(points) > 20
ORDER BY
  constructors.name IS NOT NULL,
  drivers.surname   IS NOT NULL,
  points DESC;
