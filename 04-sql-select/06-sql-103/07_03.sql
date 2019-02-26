(
  SELECT
    name,
    location,
    country
  FROM
    circuits
  ORDER BY
    position <-> POINT(2.349014, 48.864716)
)
EXCEPT
(
  SELECT
    name,
    location,
    country
  FROM
    circuits
  ORDER BY
    point(lng, lat) <-> POINT(2.349014, 48.864716)
)
;
