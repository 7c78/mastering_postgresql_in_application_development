WITH decades AS (
  SELECT
    EXTRACT('year' FROM DATE_TRUNC('decade', date)) AS decade
  FROM
    races
  GROUP BY
    decade
)

SELECT
  decade,
  RANK() OVER(PARTITION BY decade ORDER BY wins DESC) AS rank,
  forename,
  surname,
  wins
FROM
  decades
LEFT JOIN LATERAL (
  SELECT
    code,
    forename,
    surname,
    COUNT(*) AS wins
  FROM
    drivers
  JOIN
    results ON results.driverid = drivers.driverid AND results.position = 1
  JOIN
    races using(raceid)
  WHERE
    EXTRACT('year' FROM DATE_TRUNC('decade', races.date)) = decades.decade
  GROUP BY
    decades.decade,
    drivers.driverid
  ORDER BY
    wins DESC
  LIMIT 3
) AS winners ON true
ORDER BY
  decade ASC,
  wins DESC;
