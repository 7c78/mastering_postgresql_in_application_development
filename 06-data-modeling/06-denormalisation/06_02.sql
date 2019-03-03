SELECT
  currency,
  validity,
  rate
FROM
  rates
WHERE
  currency = 'Euro'
  AND validity @> date '2017-05-18';
