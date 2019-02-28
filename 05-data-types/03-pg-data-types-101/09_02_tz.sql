BEGIN;

DROP TABLE IF EXISTS tstz;
CREATE TABLE tstz(ts TIMESTAMP, tstz TIMESTAMPTZ);

SET timezone TO 'Europe/Paris';
SELECT NOW();
INSERT INTO tstz VALUES(NOW(), NOW());

SET TIMEZONE TO 'Pacific/Tahiti';
SELECT NOW();
INSERT INTO tstz VALUES(NOW(), NOW());

SET TIMEZONE TO 'Europe/Paris';
table tstz;

SET TIMEZONE TO 'Pacific/Tahiti';
table tstz;

COMMIT;
