SELECT
  id,
  REGEXP_SPLIT_TO_TABLE(themes, ',')
FROM
  opendata.archives_planete
WHERE
  id = 'IF39599';
