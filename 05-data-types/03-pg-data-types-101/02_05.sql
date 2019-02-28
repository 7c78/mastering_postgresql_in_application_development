WITH categories(id, categories) AS (
  SELECT
    id,
    REGEXP_SPLIT_TO_ARRAY(REGEXP_SPLIT_TO_TABLE(themes, ','), ' > ') AS categories
  FROM
    opendata.archives_planete
 )

SELECT
  categories[1] AS category,
  categories[2] AS subcategory,
  COUNT(*)
FROM
  categories
GROUP BY
  ROLLUP(category,subcategory);
