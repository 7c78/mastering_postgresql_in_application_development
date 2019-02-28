BEGIN;

DROP TABLE IF EXISTS access_log;

CREATE TABLE access_log
 (
  ip      INET,
  ts      TIMESTAMPTZ,
  request TEXT,
  status  INTEGER
 );

\COPY access_log FROM 'access.csv' WITH csv delimiter ';'

COMMIT;
