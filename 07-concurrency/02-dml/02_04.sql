SELECT
  follower.uname  AS follower,
  follower.bio    AS "follower's bio",
  following.uname AS following
FROM
  tweet.follower AS follows
JOIN
  tweet.users AS follower ON follows.follower = follower.userid
JOIN
  tweet.users AS following ON follows.following = following.userid;
