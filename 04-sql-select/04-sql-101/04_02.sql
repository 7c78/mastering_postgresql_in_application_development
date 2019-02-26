\set beginning '2017-04-01'
\set months 3

SELECT
  date,
  name,
  drivers.surname AS winner
FROM races
  LEFT JOIN(
    SELECT
      raceid,
      driverid
    FROM
      results
    WHERE
      position = 1
  ) AS winners USING(raceid)
  LEFT JOIN
    drivers USING(driverid)
WHERE
  date >= date :'beginning'
  AND date < date :'beginning' + :months * interval '1 month';
