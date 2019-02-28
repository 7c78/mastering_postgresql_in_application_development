SELECT
  id,
  REGEXP_SPLIT_TO_ARRAY(REGEXP_SPLIT_TO_TABLE(themes, ','), ' > ') AS categories
FROM
  opendata.archives_planete
WHERE
  id = 'IF39599';
