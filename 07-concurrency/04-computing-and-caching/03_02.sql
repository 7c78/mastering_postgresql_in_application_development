SELECT
  messageid,
  rts,
  nickname,
  SUBSTRING(message FROM E'[^\n]+') AS first_line
FROM
  twcache.message
JOIN
  tweet.users USING(userid)
WHERE
  messageid = 3
ORDER BY
  messageid;
