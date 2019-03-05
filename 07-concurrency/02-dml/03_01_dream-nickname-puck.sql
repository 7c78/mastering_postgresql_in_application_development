BEGIN;

UPDATE
  tweet.users
SET
  nickname = 'Robin Goodfellow'
WHERE
  userid = 17 AND uname = 'Puck'
RETURNING
  users.*;

COMMIT;
