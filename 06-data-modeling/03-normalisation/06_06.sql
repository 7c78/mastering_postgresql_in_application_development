CREATE TABLE sandboxpk.article (
  id       bigserial   PRIMARY KEY,
  category integer     NOT NULL REFERENCES sandbox.category(id),
  pubdate  timestamptz NOT NULL,
  title    text        NOT NULL,
  content  text,

  UNIQUE(category, pubdate, title)
);
