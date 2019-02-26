SELECT
  a::text                          AS left,
  b::text                          AS right,
  (a = b):: text                   AS "=",
  (a IS DISTINCT FROM b)::TEXT     AS "is distinct",
  (a IS NOT DISTINCT FROM b)::TEXT AS "is not distinct FROM"
FROM
  (VALUES(TRUE), (FALSE), (null)) t1(a)
CROSS JOIN
  (VALUES(TRUE), (FALSE), (NULL)) t2(b);
