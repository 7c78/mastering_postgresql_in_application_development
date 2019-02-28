SELECT
  EXTRACT(ISODOW FROM ats)                                  AS dow,
  TO_CHAR(ats, 'Day')                                       AS day,
  COUNT(*)                                                  AS commits,
  ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER(), 2)         AS pct,
  REPEAT('■', (100 * COUNT(*) / SUM(COUNT(*)) OVER())::INT) AS hist
FROM
  commitlog
WHERE
  project = 'postgresql'
GROUP BY
  dow,
  day
ORDER BY
  dow;
