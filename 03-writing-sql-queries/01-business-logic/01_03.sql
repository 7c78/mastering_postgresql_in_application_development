SELECT
  name,
  milliseconds * INTERVAL '1 ms' AS duration,
  PG_SIZE_PRETTY(bytes)          AS bytes
FROM
  track
WHERE
  albumid = 193
ORDER BY
  trackid;
