BEGIN;

CREATE TABLE hashtag (
  id         bigint PRIMARY KEY,
  date       timestamptz,
  uname      text,
  message    text,
  location   point,
  hashtags   text[]
);

WITH matches AS (
  SELECT
    id,
    REGEXP_MATCHES(message, '(#[^ ,]+)', 'g') AS match
  FROM
  tweet
), hashtags AS (
  SELECT
    id,
    ARRAY_AGG(MATCH[1] ORDER BY match[1]) AS hashtags
  FROM
    matches
GROUP BY
  id
)

INSERT INTO hashtag(id, date, uname, message, location, hashtags)
  SELECT
    id,
    date + hour AS date,
    uname,
    message,
    POINT(longitude, latitude),
    hashtags
  FROM
    hashtags
  JOIN
    tweet using(id);

COMMIT;
