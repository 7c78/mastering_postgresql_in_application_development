SELECT
  races.date,
  races.name,
  drivers.surname AS pole_position,
  results.position
FROM
  races
  /*
   * We want only the pole position from the races
   * know the result of and still list the race when
   * we don't know the results.
  */
LEFT JOIN
  results ON races.raceid = results.raceid AND results.grid = 1
LEFT JOIN
  drivers USING(driverid)
WHERE
  date >= '2017-05-01'
  AND date < '2017-08-01'
ORDER BY
  races.date;
