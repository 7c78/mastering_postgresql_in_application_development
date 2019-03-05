BEGIN;

WITH deleted_rows AS (
  DELETE FROM
    tweet.users
  WHERE NOT EXISTS (
    SELECT 1
    FROM
      tweet.message
    WHERE
      userid = users.userid
  )
 RETURNING *
)

SELECT
  MIN(userid),
  MAX(userid),
  COUNT(*),
  array_agg(uname)
FROM
  deleted_rows;

COMMIT;
