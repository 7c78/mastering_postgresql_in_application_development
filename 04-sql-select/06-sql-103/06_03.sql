SELECT
  forename,
  surname
FROM
  results
JOIN
  drivers USING(driverid)
WHERE
  position = 1
GROUP BY
  drivers.driverid;
