SELECT
  a::TEXT,
  b::TEXT                                                                 AS "a=b",
  FORMAT('%s = %s', COALESCE(a::TEXT, 'null'), COALESCE(b::TEXT, 'null')) AS op,
  FORMAT('is %s', COALESCE((a=b)::TEXT, 'null'))                          AS result
FROM
  (VALUES(TRUE), (FALSE), (NULL)) v1(a)
CROSS JOIN
  (VALUES(TRUE), (FALSE), (NULL)) v2(b);
