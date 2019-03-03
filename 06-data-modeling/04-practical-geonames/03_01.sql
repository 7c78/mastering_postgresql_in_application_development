SELECT
  geonameid,
  name,
  admin1_code,
  admin2_code
FROM
  raw.geonames
WHERE
  country_code = 'FR'
LIMIT 5
OFFSET 50;
