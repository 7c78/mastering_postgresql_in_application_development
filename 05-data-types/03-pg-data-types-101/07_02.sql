SELECT
  uuid_generate_v4()
FROM
  generate_series(1, 10) AS t(x);
