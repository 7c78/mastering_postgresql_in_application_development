SELECT
  amopopr::regoperator
FROM
  pg_opclass c
JOIN
  pg_am am ON am.oid = c.opcmethod
JOIN
  pg_amop amop ON amop.amopfamily = c.opcfamily
WHERE
  opcintype = 'ip4r'::regtype
  AND am.amname = 'gist';
