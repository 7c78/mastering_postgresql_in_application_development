CREATE TABLE sandbox.article (
  category integer REFERENCES sandbox.category(id),
  pubdate  timestamptz,
  title    text NOT NULL,
  content  text,

  PRIMARY KEY(category, title)
);
