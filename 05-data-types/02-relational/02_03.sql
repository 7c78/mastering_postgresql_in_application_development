SELECT
  oprname,
  oprleft::regtype,
  oprcode::regproc
FROM
  pg_operator
WHERE
  oprname = '='
  AND oprleft::regtype::TEXT ~ 'int|time|text|circle|ip'
ORDER BY
  oprleft;
