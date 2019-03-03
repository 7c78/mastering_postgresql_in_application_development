SELECT
  r.name,
  reg.name AS region,
  d.name  AS district
FROM
  raw.geonames r
LEFT JOIN
  geoname.country ON country.iso = r.country_code
LEFT JOIN
  geoname.region reg ON reg.isocode = country.isocode
                     AND reg.regcode = r.admin1_code
LEFT JOIN
  geoname.district d ON d.isocode = country.isocode
                     AND d.regcode = r.admin1_code
                     AND d.discode = r.admin2_code
WHERE
  country_code = 'FR'
LIMIT 5
OFFSET 50;
