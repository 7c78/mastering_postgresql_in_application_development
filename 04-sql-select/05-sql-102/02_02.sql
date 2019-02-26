EXPLAIN (COSTS OFF, BUFFERS, ANALYZE)
SELECT
  name,
  location,
  country
FROM
  circuits
ORDER BY
  position <-> POINT(2.349014, 48.864716)
LIMIT 10;
