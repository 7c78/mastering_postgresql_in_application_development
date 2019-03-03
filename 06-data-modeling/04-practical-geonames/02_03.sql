SELECT
  neighbour.iso,
  neighbour.name,
  neighbour.capital,
  neighbour.tld
FROM
  geoname.neighbour AS border
JOIN
  geoname.country AS country ON border.isocode = country.isocode
JOIN
  geoname.country AS neighbour ON border.neighbour = neighbour.isocode
WHERE
  country.iso = 'FR';
