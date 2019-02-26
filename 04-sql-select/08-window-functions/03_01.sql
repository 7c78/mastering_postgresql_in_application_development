SELECT
  surname,
  position                                             AS pos,
  ROW_NUMBER() OVER(ORDER BY fastestlapspeed::NUMERIC) AS fast,
  ntile(3) OVER w                                      AS "group",
  lag(code, 1) OVER w                                  AS "prev",
  lead(code, 1) OVER w                                 AS "next"
FROM
  results
JOIN
  drivers USING(driverid)
WHERE
  raceid = 890
WINDOW
  w AS (ORDER BY position)
ORDER BY
  position;
