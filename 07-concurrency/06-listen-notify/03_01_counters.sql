BEGIN;

CREATE SCHEMA IF NOT EXISTS twcache;

CREATE TABLE twcache.counters (
  messageid   bigint NOT NULL PRIMARY KEY,
  rts         bigint,
  favs        bigint
);

COMMIT;
