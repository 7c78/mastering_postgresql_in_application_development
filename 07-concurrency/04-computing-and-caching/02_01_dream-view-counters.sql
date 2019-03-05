CREATE VIEW tweet.message_with_counters AS
  SELECT
    messageid,
    message.userid,
    message.datetime,
    message.message,
    COUNT(*) FILTER(WHERE action = 'rt') - COUNT(*) FILTER(WHERE action = 'de-rt')   AS rts,
    COUNT(*) FILTER(WHERE action = 'fav') - COUNT(*) FILTER(WHERE action = 'de-fav') AS favs,
    message.location,
    message.lang,
    message.url
  FROM
    tweet.activity
  JOIN
    tweet.message using(messageid)
  GROUP BY
    message.messageid,
    activity.messageid;
