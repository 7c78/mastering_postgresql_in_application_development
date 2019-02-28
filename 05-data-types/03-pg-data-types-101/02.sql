SELECT
  nspname,
  typname
FROM
  pg_type t TABLESAMPLE bernoulli(20)
JOIN
  pg_namespace n ON n.oid = t.typnamespace
WHERE
  nspname = 'pg_catalog'
  AND typname !~ '(^_|^pg_|^reg|_handler$)'
ORDER BY
  nspname,
  typname;
