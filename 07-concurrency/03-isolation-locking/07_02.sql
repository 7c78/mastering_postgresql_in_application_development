SELECT
  COUNT(*) FILTER(WHERE action = 'rt') - COUNT(*) FILTER(WHERE action = 'de-rt')   AS rts,
  COUNT(*) FILTER(WHERE action = 'fav') - COUNT(*) FILTER(WHERE action = 'de-fav') AS favs
FROM
  tweet.activity
JOIN
  tweet.message using(messageid)
WHERE
  messageid = :id;
