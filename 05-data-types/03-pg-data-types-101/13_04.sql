SELECT
  rate
FROM
  rates
WHERE
  currency = 'Euro'
  AND validity @> DATE '2017-05-18';
