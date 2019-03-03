CREATE TABLE sandboxpk.comment (
  a_category integer     NOT NULL,
  a_pubdate  timestamptz NOT NULL,
  a_title    text        NOT NULL,
  pubdate    timestamptz,
  content    text,

  PRIMARY KEY(a_category, a_pubdate, a_title, pubdate, content),

  FOREIGN KEY(a_category, a_pubdate, a_title)
  REFERENCES sandboxpk.article(category, pubdate, title)
);
