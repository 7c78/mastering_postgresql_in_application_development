SELECT
  EXTRACT(year FROM races.date)              AS season,
  COUNT(*) FILTER(WHERE status = 'Accident') AS accidents
FROM
  results
JOIN
  status USING(statusid)
JOIN
  races USING(raceid)
GROUP BY
  season
ORDER BY
  accidents DESC
LIMIT 5;
