\set season 2017

SELECT
  drivers.surname   AS driver,
  constructors.name AS constructor,
  sum(points)       AS points
FROM
  results
JOIN
  races USING(raceid)
JOIN
  drivers USING(driverid)
JOIN
  constructors USING(constructorid)
WHERE
  races.year = :season
GROUP BY
  GROUPING SETS(drivers.surname, constructors.name)
HAVING
  SUM(points) > 150
ORDER BY
  drivers.surname IS NOT NULL,
  points DESC;
