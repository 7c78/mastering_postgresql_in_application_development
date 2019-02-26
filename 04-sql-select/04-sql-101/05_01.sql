\set season 'date ''1978-01-01'''

SELECT
  forename,
  surname,
  constructors.name      AS constructor,
  count(*)               AS races,
  count(distinct status) AS reasons
FROM
  drivers
JOIN
  results USING(driverid)
JOIN
  races USING(raceid)
JOIN
  status USING(statusid)
JOIN
  constructors USING(constructorid)
WHERE
  date >= :season
  AND date < :season + INTERVAL '1year'
  AND NOT EXISTS(
    SELECT 1
    FROM
      results r
    WHERE
      position IS NOT NULL
      AND r.driverid = drivers.driverid
      AND r.resultid = results.resultid
  )
GROUP BY
  constructors.name, driverid
ORDER BY
  COUNT(*) DESC;
