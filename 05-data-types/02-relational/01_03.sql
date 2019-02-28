SELECT
  DATE(DATE '0001-01-01' + x * interval '1 day')
FROM
  GENERATE_SERIES(-2, 1) AS t(x);
