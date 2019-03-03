\set comments 3
\set articles 1

SELECT
  category.name AS category,
  article.pubdate,
  title,
  JSONB_PRETTY(comments) AS comments
FROM
  sandbox.category
/*
* Classic implementation of a Top-N query
* to fetch 3 most articles per category
*/
LEFT JOIN LATERAL (
  SELECT
    id,
    title,
    article.pubdate,
    jsonb_agg(comment) AS comments
  FROM
    sandbox.article
  /*
   * Classic implementation of a Top-N query
   * to fetch 3 most recent comments per article
   */
  LEFT JOIN LATERAL (
    SELECT
      comment.pubdate,
      substring(comment.content FROM 1 FOR 25) || '…' AS content
    FROM
      sandbox.comment
    WHERE
      comment.article = article.id
    ORDER BY
      comment.pubdate DESC
    LIMIT :comments
  ) AS comment ON TRUE   -- required with a lateral join

  WHERE
    category = category.id
  GROUP BY
    article.id
  ORDER BY
    article.pubdate DESC
  LIMIT :articles
) AS article ON TRUE -- required with a lateral join

ORDER BY
  category.name,
  article.pubdate DESC;
