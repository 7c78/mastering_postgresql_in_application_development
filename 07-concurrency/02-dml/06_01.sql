BEGIN;

EXPLAIN (ANALYZE, COSTS OFF, TIMING OFF)
  UPDATE
    public.foo
  SET
    f1 = forename, f2 = surname
  FROM
    f1db.drivers
  WHERE
    drivers.driverid = foo.id
    AND foo.id IN (1, 2, 3)
RETURNING foo.*, drivers.code;

ROLLBACK;
