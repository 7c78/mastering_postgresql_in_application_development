SELECT
  surname,
  position                                             AS pos,
  ROW_NUMBER() OVER(ORDER BY fastestlapspeed::NUMERIC) AS fast,
  NTILE(3) OVER w                                      AS "group",
  LAG(code, 1) OVER w                                  AS "prev",
  LEAD(code, 1) OVER w                                 AS "next"
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
