SELECT
  tag,
  COUNT(*)
FROM
  hashtag,
  UNNEST(hashtags) AS t(tag)
GROUP BY
  tag
ORDER BY
  count DESC
LIMIT 10;
