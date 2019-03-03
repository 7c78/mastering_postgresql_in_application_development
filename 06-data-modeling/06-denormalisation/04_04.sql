SELECT
  driver,
  constructor,
  points
FROM
  cache.season_points
WHERE
  season = 2017
  AND points > 150;
