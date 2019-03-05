CREATE SCHEMA IF NOT EXISTS twcache;

CREATE MATERIALIZED VIEW twcache.message AS
  SELECT
    messageid,
    userid,
    datetime,
    message,
    rts,
    favs,
    location,
    lang,
    url
  FROM
    tweet.message_with_counters;

CREATE UNIQUE INDEX ON twcache.message(messageid);
