CREATE OR REPLACE FUNCTION random (
  a timestamptz,
  b timestamptz
)
RETURNS timestamptz
VOLATILE
LANGUAGE SQL
AS $$
  SELECT
    a + RANDOM(0, EXTRACT(EPOCH FROM (b-a))::int) * INTERVAL '1 sec';
$$;
