SELECT
  surname,
  constructors.name,
  position,
  FORMAT(
    '%s / %s',
    ROW_NUMBER() OVER(PARTITION BY constructorid ORDER BY position NULLS LAST),
    COUNT(*) OVER(PARTITION BY constructorid)
  ) AS "pos same constr"
FROM
  results
JOIN
  drivers USING(driverid)
JOIN
  constructors USING(constructorid)
WHERE
  raceid = 890
ORDER BY
  position;
