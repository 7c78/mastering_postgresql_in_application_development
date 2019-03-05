BEGIN;

CREATE TABLE new_name (LIKE name including all);

INSERT INTO new_name
  SELECT
    <column list>
  FROM
    name
  WHERE
    <restrictions>;

DROP TABLE name;
ALTER TABLE new_name rename to name;

COMMIT;
