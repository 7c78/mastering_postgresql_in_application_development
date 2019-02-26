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
  AND ROW(lap, position) > (1, 3)
ORDER BY
  lap,
  position
FETCH FIRST 3 ROWS ONLY;
