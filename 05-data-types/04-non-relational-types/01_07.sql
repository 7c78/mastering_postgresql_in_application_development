SELECT
  tag,
  COUNT(*)
FROM
  hashtag,
  unnest(hashtags) AS t(tag)
GROUP BY
  tag
ORDER BY
  count DESC
LIMIT 10;
