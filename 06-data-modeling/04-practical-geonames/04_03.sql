SELECT
  continent.name,
  COUNT(*),
  ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER(), 2)         AS pct,
  REPEAT('■', (100 * COUNT(*) / SUM(COUNT(*)) OVER())::int) AS hist
FROM
  geoname.geoname
JOIN
  geoname.country USING(isocode)
JOIN
  geoname.continent ON continent.code = country.continent
GROUP BY
  continent.name
ORDER BY
  continent.name;
