UPDATE
  tweet.users
SET
  nickname = CASE WHEN uname ~ ' '
                THEN substring(uname FROM '[^ ]* (.*)')
                ELSE uname
             END
WHERE
  nickname IS NULL
RETURNING users.*;
