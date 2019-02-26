SELECT
  EXTRACT('year' FROM DATE_TRUNC('decade', date)) AS decade,
  COUNT(*)
FROM
  races
GROUP BY
  decade
ORDER BY
  decade;
