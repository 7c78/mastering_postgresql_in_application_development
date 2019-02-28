SELECT
  currency,
  validity,
  rate
FROM
  rates
WHERE
  currency = 'Euro'
ORDER BY
  validity
LIMIT 10;
