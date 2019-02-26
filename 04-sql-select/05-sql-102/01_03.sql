SELECT
  drivers.code,
  drivers.surname,
  position,
  laps,
  status
FROM
  results
JOIN
  drivers USING(driverid)
JOIN
  status USING(statusid)
WHERE
  raceid = 972
ORDER BY
  position NULLS LAST,
  laps DESC,
  CASE WHEN status = 'Power Unit'
    THEN 1
    ELSE 2
  END;
