BEGIN;

CREATE SCHEMA IF NOT EXISTS tweet;

CREATE TABLE tweet.users(
  userid     bigserial PRIMARY KEY,
  uname      text NOT NULL,
  nickname   text,
  bio        text,
  picture    text,

  UNIQUE(uname)
);

CREATE TABLE tweet.follower (
  follower   bigint NOT NULL REFERENCES tweet.users(userid),
  following  bigint NOT NULL REFERENCES tweet.users(userid),

  PRIMARY KEY(follower, following)
);

CREATE TABLE tweet.list (
  listid     bigserial PRIMARY KEY,
  owner      bigint NOT NULL REFERENCES tweet.users(userid),
  name       text NOT NULL,

  UNIQUE(owner, name)
);

CREATE TABLE tweet.membership (
  listid     bigint NOT NULL REFERENCES tweet.list(listid),
  member     bigint NOT NULL REFERENCES tweet.users(userid),
  datetime   timestamptz NOT NULL,

  PRIMARY KEY(listid, member)
);

CREATE TABLE tweet.message (
  messageid  bigserial PRIMARY KEY,
  userid     bigint NOT NULL REFERENCES tweet.users(userid),
  datetime   timestamptz NOT NULL default now(),
  message    text NOT NULL,
  favs       bigint,
  rts        bigint,
  location   point,
  lang       text,
  url        text
);

COMMIT;
