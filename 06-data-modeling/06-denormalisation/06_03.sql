\pset format wrapped
\pset columns 57

EXPLAIN
  SELECT
    currency,
    validity,
    rate
  FROM
    rates
   WHERE
    currency = 'Euro'
    AND validity @> date '2017-05-18';
