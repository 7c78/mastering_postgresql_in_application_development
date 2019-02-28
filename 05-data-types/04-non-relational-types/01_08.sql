SELECT
  name,
  SUBSTRING(timezone, '/(.*)') AS tz,
  COUNT(*)
FROM
  hashtag

LEFT JOIN LATERAL (
  SELECT *
  FROM
    geonames
  ORDER BY
    location <-> hashtag.location
  LIMIT 1
) AS geoname ON true

WHERE
  hashtags @> array['#Hiring', '#Retail']
GROUP BY
  name,
    tz
ORDER BY
  count DESC
LIMIT 10;
