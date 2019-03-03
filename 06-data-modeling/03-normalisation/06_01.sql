CREATE TABLE sandbox.article (
  id       bigserial PRIMARY KEY,
  category integer REFERENCES sandbox.category(id),
  pubdate  timestamptz,
  title    text NOT NULL,
  content  text
);
