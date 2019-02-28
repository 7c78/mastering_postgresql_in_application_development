SELECT
  PG_COLUMN_SIZE(UUID 'fbb850cc-dd26-4904-96ef-15ad8dfaff07') AS uuid_bytes,
  PG_COLUMN_SIZE('fbb850cc-dd26-4904-96ef-15ad8dfaff07')      AS uuid_string_bytes;
