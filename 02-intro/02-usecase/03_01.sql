\set start '2017-02-01'

SELECT
  CAST(calendar.entry AS date)                     AS date,
  COALESCE(shares, 0)                              AS shares,
  COALESCE(trades, 0)                              AS trades,
  TO_CHAR(COALESCE(dollars, 0), 'L99G999G999G999') AS dollars
FROM
  GENERATE_SERIES(
    date :'start',
    date :'start' + INTERVAL '1 month' - INTERVAL '1 day',
    INTERVAL '1 day'
  ) AS calendar(entry)
LEFT JOIN
  factbook ON factbook.date = calendar.entry
ORDER BY
  date;
