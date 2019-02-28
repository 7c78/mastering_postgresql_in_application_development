SELECT
  nspname,
  typname
FROM
  pg_type t
JOIN
  pg_namespace n ON n.oid = t.typnamespace
WHERE
  nspname = 'pg_catalog'
  AND typname !~ '(^_|^pg_|^reg|_handler$)'
ORDER BY
  nspname,
  typname;
