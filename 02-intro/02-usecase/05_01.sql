\set start '2017-02-01'

WITH computed_data AS (
  SELECT
    CAST(date AS date)                                                           AS date,
    TO_CHAR(date, 'Dy')                                                          AS day,
    COALESCE(dollars, 0)                                                         AS dollars,
    LAG(dollars, 1) OVER(PARTITION BY EXTRACT('isodow' FROM date) ORDER BY date) AS last_week_dollars
  FROM
    generate_series(
      date :'start' - INTERVAL '1 week',
      date :'start' + INTERVAL '1 month' - INTERVAL '1 day',
      INTERVAL '1 day'
    ) AS calendar(date)
  LEFT JOIN
    factbook USING(date)
)

SELECT
  date,
  day,
  TO_CHAR(COALESCE(dollars, 0), 'L99G999G999G999') AS dollars,
  CASE
    WHEN dollars IS NOT NULL AND dollars <> 0
    THEN round(100.0 * (dollars - last_week_dollars) / dollars, 2)
  END AS "WoW %"
FROM
  computed_data
WHERE
  date >= date :'start'
ORDER BY
  date;
