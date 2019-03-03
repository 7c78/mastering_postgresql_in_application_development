BEGIN;

CREATE SCHEMA IF NOT EXISTS sandbox;

CREATE TABLE sandbox.category (
  id   serial PRIMARY KEY,
  name text NOT NULL
);

INSERT INTO sandbox.category(name)
     VALUES ('sport'), ('news'), ('box office'), ('music');

CREATE TABLE sandbox.article (
  id       bigserial PRIMARY KEY,
  category integer REFERENCES sandbox.category(id),
  pubdate  timestamptz,
  title    text NOT NULL,
  content  text
);

CREATE TABLE sandbox.comment (
  id      bigserial PRIMARY KEY,
  article integer REFERENCES sandbox.article(id),
  pubdate timestamptz,
  content text
);

INSERT INTO sandbox.article(category, title, pubdate, content)
  SELECT
    RANDOM(1, 4)                                                      AS category,
    INITCAP(sandbox.lorem(5))                                         AS title,
    RANDOM( NOW() - INTERVAL '3 months', NOW() + INTERVAL '1 months') AS pubdate,
    sandbox.lorem(1
  FROM
    GENERATE_SERIES(1, 1000) AS t(x);

INSERT INTO sandbox.comment(article, pubdate, content)
  SELECT
    RANDOM(1, 1000)              AS article,
    NOW() + INTERVAL '1 months') AS pubdate,
    sandbox.lorem(150)           AS content
  FROM
    GENERATE_SERIES(1, 50000) AS t(x);

SELECT
  article.id,
  category.name,
  title
FROM
  sandbox.article
JOIN
  sandbox.category ON category.id = article.category
LIMIT 3;

SELECT
  COUNT(*),
  AVG(LENGTH(title))::int   as avg_title_length,
  AVG(LENGTH(content))::int as avg_content_length
FROM
  sandbox.article;

SELECT
  article.id,
  article.title,
  COUNT(*)
FROM
  sandbox.article
JOIN
  sandbox.comment ON article.id = comment.article
GROUP BY
  article.id
ORDER BY
  count DESC
LIMIT 5;

SELECT
  category.name,
  COUNT(distinct article.id) AS articles,
  COUNT(*) as comments
FROM
  sandbox.category
LEFT JOIN
  sandbox.article ON article.category = category.id
LEFT JOIN
  sandbox.comment ON comment.article = article.id
GROUP BY
  category.name
ORDER BY
  category.name;

COMMIT;
