SELECT
  COUNT(*)                                     AS all,
  COUNT(*) FILTER(WHERE country_code IS NULL)  AS no_country,
  COUNT(*) FILTER(WHERE admin1_code IS NULL)   AS no_region,
  COUNT(*) FILTER(WHERE admin2_code IS NULL)   AS no_district,
  COUNT(*) FILTER(WHERE feature_class IS NULL) AS no_class,
  COUNT(*) FILTER(WHERE feature_code IS NULL)  AS no_feat
FROM
  raw.geonames;
