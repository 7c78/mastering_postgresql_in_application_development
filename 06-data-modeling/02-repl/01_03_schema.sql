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
  title    text NOT NULL,
  content  text
);

CREATE TABLE sandbox.commenta (
  id      bigserial PRIMARY KEY,
  article integer REFERENCES sandbox.article(id),
  content text
 );

INSERT INTO sandbox.article(category, title, content)
  SELECT
    RANDOM(1, 4)              AS category,
    INITCAP(sandbox.lorem(5)) AS title,
    sandbox.lorem(100)        AS content
  FROM
    generate_series(1, 1000) AS t(x);

INSERT INTO sandbox.comment(article, content)
  SELECT
    random(1, 1000)    AS article,
    sandbox.lorem(150) AS content
  FROM
    generate_series(1, 50000) AS t(x);

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
  AVG(length(title))::int   AS avg_title_length,
  AVG(length(content))::int AS avg_content_length
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
  COUNT(DISTINCT article.id) AS articles,
  COUNT(*)                   AS comments
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

ROLLBACK;
