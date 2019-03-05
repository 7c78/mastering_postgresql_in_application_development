BEGIN;

CREATE TYPE tweet.action_t AS enum('rt', 'fav', 'de-rt', 'de-fav');

CREATE TABLE tweet.activity (
  id          bigserial PRIMARY KEY,
  messageid   bigint NOT NULL REFERENCES tweet.message(messageid),
  datetime    timestamptz NOT NULL DEFAULT now(),
  action      tweet.action_t NOT NULL,

  UNIQUE(messageid, datetime, action)
);

COMMIT;
