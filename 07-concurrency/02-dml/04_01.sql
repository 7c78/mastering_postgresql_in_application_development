INSERT INTO tweet.message(userid, message)
  SELECT
    userid,
    $2
  FROM
    tweet.users
  WHERE
    users.uname = $1
    OR users.nickname = $1
