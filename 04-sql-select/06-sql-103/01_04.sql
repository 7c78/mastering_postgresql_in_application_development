WITH counts AS (
  SELECT
    DATE_TRUNC('year', DATE)                AS year,
    COUNT(*) FILTER(WHERE position IS NULL) AS outs,
    BOOL_AND(position IS NULL)              AS never_finished
  FROM
    drivers
  JOIN
    results USING(driverid)
  JOIN
    races USING(raceid)
  GROUP BY
    DATE_TRUNC('year', DATE),
    driverid
)

SELECT
  extract(year FROM year) AS season,
  SUM(outs)               AS "#times any driver didn't finish a race"
FROM
  counts
WHERE
  never_finished
GROUP BY
  season
ORDER BY
  SUM(outs) DESC
LIMIT 5;
