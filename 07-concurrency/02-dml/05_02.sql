BEGIN;

DELETE FROM
  tweet.users
WHERE
  userid = 22
  AND uname = 'CLAUDIUS'
RETURNING *;

COMMIT;
