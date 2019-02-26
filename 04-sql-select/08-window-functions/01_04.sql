SELECT
  x,
  ARRAY_AGG(x) OVER ()    AS frame,
  SUM(x) OVER ()          AS sum,
  x::FLOAT/SUM(x) OVER () AS paty
FROM
  GENERATE_SERIES(1, 3) AS t(x);
