(
  SELECT
    driverid,
    FORMAT('%s %s', drivers.forename, drivers.surname) AS name
  FROM
    results
  JOIN
    drivers USING(driverid)
  WHERE
    raceid     = 972
    AND points = 0
)
EXCEPT
(
  SELECT
    driverid,
    FORMAT('%s %s', drivers.forename, drivers.surname) AS name
  FROM
    results
  JOIN
    drivers USING(driverid)
  WHERE
    raceid     = 971
    AND points = 0
);
