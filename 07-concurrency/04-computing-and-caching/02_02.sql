SELECT
  messageid,
  rts,
  nickname
FROM
  tweet.message_with_counters
JOIN
  tweet.users using(userid)
WHERE
  messageid BETWEEN 1 AND 6
ORDER BY
  messageid;
