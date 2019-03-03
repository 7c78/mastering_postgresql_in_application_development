INSERT INTO archive.older_versions(table_name, action, data)
  SELECT
    'hashtag',
    'delete',
    row_to_json(hashtag)
  FROM
    hashtag
  WHERE
    id = 720554371822432256
RETURNING table_name, date, action, jsonb_pretty(data) AS data;
