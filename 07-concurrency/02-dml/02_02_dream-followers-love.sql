INSERT INTO tweet.follower
  SELECT
    users.userid AS follower,
    f.userid AS following
  FROM
    tweet.users
  JOIN
    tweet.users f ON f.uname = substring(users.bio FROM 'in love with #?(.*).')
  WHERE
    users.bio ~ 'in love with';
