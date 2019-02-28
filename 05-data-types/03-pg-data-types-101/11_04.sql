WITH perc_arrays AS (
  SELECT
    project,
    AVG(cts-ats) AS average,
    PERCENTILE_CONT(ARRAY[0.5, 0.9, 0.95, 0.99]) WITHIN GROUP(ORDER BY cts-ats) AS parr
  FROM
    commitlog
  WHERE
    ats <> cts
  GROUP BY
    project
)

SELECT
  project,
  average,
  parr[1] AS median,
  parr[2] AS "%90th",
  parr[3] AS "%95th",
  parr[4] AS "%99th"
FROM
  perc_arrays;
