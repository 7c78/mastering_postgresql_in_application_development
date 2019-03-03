CREATE SCHEMA if not exists archive;

CREATE TYPE archive.action_t AS enum('insert', 'update', 'delete');

CREATE TABLE archive.older_versions (
  table_name text,
  date       timestamptz DEFAULT NOW(),
  action     archive.action_t,
  data       jsonb
);
