WITH accidents AS(
  SELECT
    EXTRACT(year FROM races.date)              AS season,
    COUNT(*)                                   AS participants,
    COUNT(*) FILTER(WHERE status = 'Accident') AS accidents
  FROM
    results
  JOIN
    status USING(statusid)
  JOIN
    races USING(raceid)
  GROUP BY
    season
)

SELECT
  season,
  ROUND(100.0 * accidents / participants, 2)                   AS pct,
  REPEAT(text '■', CEIL(100 * accidents / participants)::int) AS bar
FROM
  accidents
WHERE
  season BETWEEN 1974 AND 1990
ORDER BY
  season;
