WITH counts AS (
  SELECT
    driverid,
    forename,
    surname,
    COUNT(*)                   AS races,
    bool_and(position IS NULL) AS never_finished
  FROM
    drivers
  JOIN
    results USING(driverid)
  JOIN
    races using(raceid)
  GROUP BY
    driverid
)

SELECT
  driverid,
  forename,
  surname,
  races
FROM
  counts
WHERE
  never_finished
ORDER BY
  races DESC;
