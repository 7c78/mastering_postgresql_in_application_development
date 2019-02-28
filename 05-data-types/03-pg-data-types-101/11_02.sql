SELECT
  EXTRACT(year FROM ats)                        AS year,
  COUNT(*) FILTER(WHERE project = 'postgresql') AS postgresql,
  COUNT(*) FILTER(WHERE project = 'pgloader')   AS pgloader
FROM
  commitlog
GROUP BY
  year
ORDER BY
  year;
