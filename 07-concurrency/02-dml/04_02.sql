SELECT
  uname,
    message
FROM
  tweet.message
LEFT JOIN
  tweet.users USING(userid)
ORDER BY
  messageid
LIMIT 4;
