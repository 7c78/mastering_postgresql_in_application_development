SELECT
  drivers.surname   AS driver,
  constructors.name AS constructor,
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
  drivers.surname IN('Prost', 'Senna')
GROUP BY
  CUBE(drivers.surname, constructors.name);
