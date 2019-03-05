BEGIN;

CREATE SCHEMA IF NOT EXISTS moma;

CREATE TABLE moma.artist (
  constituentid   integer NOT NULL PRIMARY KEY,
  name            text NOT NULL,
  bio             text,
  nationality     text,
  gender          text,
  begin           integer,
  "end"           integer,
  wiki_qid        text,
  ulan            text
);

\COPY moma.artist FROM 'artists/artists.2017-05-01.csv' WITH CSV HEADER DELIMITER ','

COMMIT;
