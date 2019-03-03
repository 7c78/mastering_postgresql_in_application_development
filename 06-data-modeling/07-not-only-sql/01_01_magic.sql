BEGIN;

CREATE SCHEMA IF NOT EXISTS magic;

CREATE TABLE magic.allsets(data jsonb);

COMMIT;
