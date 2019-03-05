SELECT
  users.userid AS follower,
  users.uname,
  f.userid AS following,
  f.uname
FROM
  tweet.users
JOIN
  tweet.users f ON f.uname = substring(users.bio FROM 'in love with #?(.*).')
WHERE
  users.bio ~ 'in love with';
