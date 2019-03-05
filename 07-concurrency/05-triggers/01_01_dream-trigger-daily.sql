BEGIN;

CREATE TABLE twcache.daily_counters (
  day     date NOT NULL PRIMARY KEY,
  rts     bigint,
  de_rts  bigint,
  favs    bigint,
  de_favs bigint
);

CREATE OR REPLACE FUNCTION twcache.tg_update_daily_counters ()
 RETURNS TRIGGER
 LANGUAGE PLPGSQL
AS $$
DECLARE
BEGIN
  update twcache.daily_counters
     set rts = CASE WHEN NEW.action = 'rt'
                    THEN rts + 1
                    ELSE rts
                END,
         de_rts = CASE WHEN NEW.action = 'de-rt'
                    THEN de_rts + 1
                    ELSE de_rts
                END,
         favs = CASE WHEN NEW.action = 'fav'
                     THEN favs + 1
                     ELSE favs
                 END,
         de_favs = CASE WHEN NEW.action = 'de-fav'
                     THEN de_favs + 1
                     ELSE de_favs
                 END
   WHERE
    daily_counters.day = current_date;

  IF NOT FOUND
  THEN
      INSERT INTO twcache.daily_counters(day, rts, de_rts, favs, de_favs)
        SELECT
          current_date,
          CASE WHEN NEW.action = 'rt'
            THEN 1 ELSE 0
          END,
          CASE WHEN NEW.action = 'de-rt'
              THEN 1 ELSE 0
          END,
          CASE WHEN NEW.action = 'fav'
              THEN 1 ELSE 0
          END,
          CASE WHEN NEW.action = 'de-fav'
              THEN 1 ELSE 0
          END;
  END IF;

  RETURN NULL;
END;
$$;

CREATE TRIGGER update_daily_counters
         AFTER INSERT
            ON tweet.activity
      FOR EACH ROW
       EXECUTE PROCEDURE twcache.tg_update_daily_counters();

INSERT INTO tweet.activity(messageid, action)
  VALUES (7, 'rt'),
        (7, 'fav'),
        (7, 'de-fav'),
        (8, 'rt'),
        (8, 'rt'),
        (8, 'rt'),
        (8, 'de-rt'),
        (8, 'rt');

SELECT
  day,
  rts,
  de_rts,
  favs,
  de_favs
FROM
  twcache.daily_counters;

ROLLBACK;
