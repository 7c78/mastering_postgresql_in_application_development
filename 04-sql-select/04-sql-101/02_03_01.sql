SELECT
  date::date,
  EXTRACT('isodow' FROM date)                                 AS dow,
  TO_CHAR(date, 'dy')                                         AS day,
  EXTRACT('isoyear' FROM date)                                AS "iso year",
  EXTRACT('week' FROM date)                                   AS week,
  EXTRACT('day' FROM(date + INTERVAL '2 month - 1 day'))      AS feb,
  EXTRACT('year' FROM date)                                   AS year,
  EXTRACT('day' FROM(date + INTERVAL '2 month - 1 day')) = 29 AS leap
FROM
  generate_series(date '2000-01-01',
                  date '2010-01-01',
                  INTERVAL '1 year') AS t(date);
