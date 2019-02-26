\set season 'date ''1978-01-01'''

SELECT
  status,
  count(*)
FROM
  results
JOIN
  races USING(raceid)
JOIN
  status USING(statusid)
WHERE
  date >= :season
  AND date < :season + INTERVAL '1 year'
  AND position IS NULL
GROUP BY
  status
HAVING
  COUNT(*) >= 10
ORDER BY
  COUNT(*) DESC;
