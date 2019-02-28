set intervalstyle to postgres_verbose;

SELECT
  INTERVAL '1 month',
  INTERVAL '2 weeks',
  2 * INTERVAL '1 week',
  78389 * INTERVAL '1 ms';
