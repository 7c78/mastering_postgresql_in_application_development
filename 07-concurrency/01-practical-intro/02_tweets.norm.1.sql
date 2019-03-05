BEGIN;

CREATE SCHEMA IF NOT EXISTs tweet;

CREATE TABLE tweet.users (
  userid     bigserial PRIMARY KEY,
  uname      text NOT NULL,
  nickname   text NOT NULL,
  bio        text,
  picture    text,
  followers  bigint,
  following  bigint,
  listed     bigint,

  UNIQUE(name)
);

CREATE TABLE tweet.message (
  id         bigint PRIMARY KEY,
  userid     bigint REFERENCES tweet.users(userid),
  datetime   timestamptz NOT NULL,
  message    text,
  favs       bigint,
  rts        bigint,
  location   point,
  lang       text,
  url        text
);

COMMIT;
