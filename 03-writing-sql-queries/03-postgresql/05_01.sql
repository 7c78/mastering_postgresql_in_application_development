SELECT
  datname,
  PG_DATABASE_SIZE(datname) AS bytes
FROM
  pg_database
ORDER BY
  bytes DESC;
