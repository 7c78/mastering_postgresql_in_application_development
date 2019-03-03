SELECT
  class,
  feature,
  description,
  COUNT(*)
FROM
  feature
LEFT JOIN
  geoname using(class,feature)
GROUP BY
  class,
  feature
ORDER BY
  count DESC
LIMIT 10;
