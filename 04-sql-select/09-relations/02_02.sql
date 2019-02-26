SELECT
  results.positionorder AS positionorder,
  drivers.code,
  count(behind.*)       AS behind
FROM
  results
JOIN
  drivers USING(driverid)
LEFT JOIN
  results behind ON results.raceid = behind.raceid AND results.positionorder < behind.positionorder
WHERE
  results.raceid = 972
  AND results.positionorder <= 3
GROUP BY
  results.positionorder,
  drivers.code
ORDER BY
  results.positionorder;
