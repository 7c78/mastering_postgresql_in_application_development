SELECT
  d::DATE as month,
  (d + INTERVAL '1 month' - INTERVAL '1 day')::DATE AS month_end,
  (d + INTERVAL '1 month')::DATE                    AS next_month,
  (d + INTERVAL '1 month')::DATE - d::DATE          AS days

FROM
  GENERATE_SERIES(
    date '2017-01-01',
    date '2017-12-01',
    INTERVAL '1 month'
  ) AS t(d);
