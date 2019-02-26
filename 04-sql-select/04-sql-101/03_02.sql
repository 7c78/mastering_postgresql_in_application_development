SELECT
  code,
  forename,
  surname,
  COUNT(*) AS wins
FROM
  drivers
JOIN
  results USING(driverid)
WHERE
  position = 1
GROUP BY
  driverid
ORDER BY
  wins DESC
LIMIT 3;
