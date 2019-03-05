WITH fairies AS (
  SELECT
    userid
  FROM
    tweet.users
  WHERE
    bio ~ '#Fairies'
)

INSERT INTO tweet.follower(follower, following)
  SELECT
    fairies.userid AS follower,
    users.userid   AS following
  FROM
    fairies CROSS JOIN tweet.users
  WHERE
    users.bio ~ 'of the fairies';
