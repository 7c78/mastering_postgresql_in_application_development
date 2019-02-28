SELECT
  year,
  FORMAT('%s %s', forename, surname)          AS name,
  COUNT(*)                                    AS ran,
  COUNT(*) FILTER(WHERE position = 1)         AS won,
  COUNT(*) FILTER(WHERE position IS NOT NULL) AS finished,
  SUM(points)                                 AS points
FROM
  races
JOIN
  results USING(raceid)
JOIN
  drivers USING(driverid)
GROUP BY
  year,
  drivers.driverid
HAVING
  bool_and(position = 1) IS TRUE
ORDER BY
  year,
  points DESC;

SELECT
  year,
  FORMAT('%s %s', forename, surname)          AS name,
  COUNT(*)                                    AS ran,
  COUNT(*) FILTER(WHERE position = 1)         AS won,
  COUNT(*) FILTER(WHERE position IS NOT NULL) AS finished,
  SUM(points)                                 AS points
FROM
  races
JOIN
  results USING(raceid)
JOIN
  drivers USING(driverid)
GROUP BY
  year,
  drivers.driverid
HAVING
  bool_and(position IS NOT DISTINCT FROM 1) IS TRUE
ORDER BY
  year,
  points DESC;
