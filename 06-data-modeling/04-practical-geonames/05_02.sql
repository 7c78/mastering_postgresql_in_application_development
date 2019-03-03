SELECT
  id,
  ROUND((hashtag.location <-> geoname.location)::numeric, 3) AS dist,
  country.iso,
  region.name AS region,
  district.name AS district
FROM
  hashtag
LEFT JOIN lateral (
  SELECT
    geonameid,
    isocode,
    regcode,
    discode,
    location
  FROM
    geoname.geoname
  ORDER BY
    location <-> hashtag.location
  LIMIT 1
) AS geoname ON TRUE
LEFT JOIN
  geoname.country USING(isocode)
LEFT JOIN
  geoname.region USING(isocode, regcode)
LEFT JOIN
  geoname.district USING(isocode, regcode, discode)
ORDER BY
  id
LIMIT 5;
