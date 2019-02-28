SELECT
  PG_TYPEOF(driverid),
  PG_TYPEOF(1)
FROM
  drivers
LIMIT 1;
