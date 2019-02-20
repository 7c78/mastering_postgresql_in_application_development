SELECT
  datname,
  pg_database_size(datname) AS bytes
FROM pg_database
ORDER BY bytes DESC;
