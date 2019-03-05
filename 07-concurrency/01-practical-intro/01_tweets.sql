BEGIN;

CREATE TABLE tweet (
  id         bigint PRIMARY KEY,
  date       date,
  hour       time,
  uname      text,
  nickname   text,
  bio        text,
  message    text,
  favs       bigint,
  rts        bigint,
  latitude   double precision,
  longitude  double precision,
  country    text,
  place      text,
  picture    text,
  followers  bigint,
  following  bigint,
  listed     bigint,
  lang       text,
  url        text
 );

\COPY tweet FROM 'tweets.csv' WITH CSV HEADER DELIMITER ';'

COMMIT;
