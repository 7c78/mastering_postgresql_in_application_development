WITH rec AS (
  SELECT
    rec.*
  FROM
    json_each($1) AS t,
    json_populate_record(NULL::twcache.counters, value) AS rec
)

INSERT INTO twcache.counters(messageid, rts, favs)
  SELECT
    messageid,
    rts,
    favs
  FROM
    rec
ON conflict (messageid) DO UPDATE
  SET
    rts  = counters.rts + excluded.rts,
    favs = counters.favs + excluded.favs
  WHERE
    COUNTERS.messageid = excluded.messageid
