BEGIN;

DROP TABLE IF EXISTS magic.sets, magic.cards;

CREATE TABLE magic.sets AS
  SELECT
    key             AS name,
    value - 'cards' AS data
  FROM
    magic.allsets,
    jsonb_each(data);

CREATE TABLE magic.cards AS
  WITH collection AS (
    SELECT
      key            AS set,
      value->'cards' AS data
    FROM
      magic.allsets,
    lateral jsonb_each(data)
  )

  SELECT
    set,
    jsonb_array_elements(data) AS data
  FROM
    collection;

COMMIT;
