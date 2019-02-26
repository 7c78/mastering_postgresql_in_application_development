EXPLAIN (COSTS OFF)
SELECT
  year,
  url
FROM
  seasons
ORDER BY
  year DESC
LIMIT 3;
