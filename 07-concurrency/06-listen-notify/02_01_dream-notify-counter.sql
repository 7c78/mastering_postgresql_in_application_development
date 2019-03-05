BEGIN;

CREATE OR REPLACE FUNCTION twcache.tg_notify_counters ()
 RETURNS trigger
 LANGUAGE plpgsql
AS $$
DECLARE
  channel text := TG_ARGV[0];
BEGIN
  PERFORM (
     WITH payload(messageid, rts, favs) AS (
       SELECT
        NEW.messageid,
        coalesce(
           CASE NEW.action
             WHEN 'rt'    THEN  1
             WHEN 'de-rt' THEN -1
            END,
           0
        ) AS rts,
        coalesce(
          CASE NEW.action
            WHEN 'fav'    THEN  1
            WHEN 'de-fav' THEN -1
           END,
          0
        ) AS favs
     )
     SELECT
      pg_notify(channel, row_to_json(payload)::text)
     FROM
      payload
  );
  RETURN NULL;
END;
$$;

CREATE TRIGGER notify_counters
  AFTER INSERT ON tweet.activity
  FOR EACH ROW EXECUTE PROCEDURE twcache.tg_notify_counters('tweet.activity');

COMMIT;
