SELECT
  surname,
  races.name,
  races,year,
  results.position
FROM results
  JOIN drivers USING(driverid)
  JOIN races USING(raceid)
WHERE
  drivers.surname = 'Hamilton'
  AND position BETWEEN 1 AND 3;
