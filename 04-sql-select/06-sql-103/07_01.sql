(
  SELECT
    raceid,
    'driver'                                           AS type,
    FORMAT('%s %s', drivers.forename, drivers.surname) AS name,
    driverstandings.points
  FROM
    driverstandings
  JOIN
    drivers USING(driverid)
  WHERE
    raceid = 972
    AND points > 0
)
UNION ALL
(
  SELECT
    raceid,
    'constructor'     AS type,
    constructors.name AS name,
    constructorstandings.points
  FROM
    constructorstandings
  JOIN
    constructors USING(constructorid)
  WHERE
    raceid = 972
    AND points > 0
)
ORDER BY
  points DESC;
