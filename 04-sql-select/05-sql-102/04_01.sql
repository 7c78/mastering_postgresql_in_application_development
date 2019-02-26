SELECT
  lap,
  drivers.code,
  position,
  milliseconds * INTERVAL '1ms' AS laptime
FROM
  laptimes
JOIN
  drivers USING(driverid)
WHERE
  raceid = 972
ORDER BY
  lap,
  position
FETCH FIRST 3 ROWS ONLY;
