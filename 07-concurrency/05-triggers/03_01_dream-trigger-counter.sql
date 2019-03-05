BEGIN;

CREATE TABLE twcache.counters (
  messageid  bigint NOT NULL REFERENCES tweet.message(messageid),
  rts        bigint,
  favs       bigint,

  UNIQUE(messageid)
);

CREATE OR REPLACE FUNCTION twcache.tg_update_counters ()
 RETURNS TRIGGER
 LANGUAGE PLPGSQL
AS $$
DECLARE
BEGIN
  INSERT INTO twcache.counters(messageid, rts, favs)
    SELECT
      NEW.messageid,
      CASE WHEN NEW.action = 'rt' THEN 1 ELSE 0 END,
      CASE WHEN NEW.action = 'fav' THEN 1 ELSE 0 END
    ON conflict (messageid)
     do UPDATE
           SET rts = CASE WHEN NEW.action = 'rt'
                          THEN counters.rts + 1

                          WHEN NEW.action = 'de-rt'
                          THEN counters.rts - 1

                          ELSE counters.rts
                      END,

               favs = CASE WHEN NEW.action = 'fav'
                           THEN counters.favs + 1

                           WHEN NEW.action = 'de-fav'
                           THEN counters.favs - 1

                           ELSE counters.favs
                       END
    WHERE
      counters.messageid = NEW.messageid;

  RETURN NULL;
END;
$$;

CREATE TRIGGER update_counters
  AFTER INSERT ON tweet.activity
  FOR EACH ROW EXECUTE PROCEDURE twcache.tg_update_counters();

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
  messageid,
  rts,
  favs
FROM
  twcache.counters;

ROLLBACK;
