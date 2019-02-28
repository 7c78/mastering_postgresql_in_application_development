SELECT
  oprname,
  oprcode::regproc,
  oprleft::regtype,
  oprright::regtype,
  oprresult::regtype
FROM
  pg_operator
 WHERE
  oprname = '='
  AND oprleft::regtype = 'bigint'::regtype;
