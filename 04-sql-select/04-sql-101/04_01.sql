\set beginning '2017-04-01'
\set months 3

SELECT
  date,
  name,
  drivers.surname AS winner
FROM
  races
LEFT JOIN
  results ON results.raceid = races.raceid AND results.position = 1
LEFT JOIN
  drivers USING(driverid)
WHERE
  date >= date :'beginning' AND
  date < date :'beginning' + :months * INTERVAL '1 month';
