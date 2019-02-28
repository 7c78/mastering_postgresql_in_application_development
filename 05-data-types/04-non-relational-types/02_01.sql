CREATE TYPE rate_t AS (
  currency text,
  validity daterange,
  value    numeric
);

CREATE TABLE rate OF rate_t (
  EXCLUDE USING GIST (currency WITH =, validity WITH &&)
);

INSERT INTO rate(currency, validity, value)

SELECT
  currency,
  validity,
  rate
FROM
  rates;
