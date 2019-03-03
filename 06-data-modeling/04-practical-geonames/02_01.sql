SELECT
  currency_code,
  currency_name,
  COUNT(*)
FROM
  raw.country
GROUP BY
  currency_code,
  currency_name
ORDER BY
  count DESC
LIMIT 5;
