BEGIN;

CREATE SCHEMA IF NOT EXISTS raw;

-- Must be run as a Super User in your database instance
-- create extension if not exists btree_gist;

DROP TABLE IF EXISTS raw.rates, rates;

CREATE TABLE raw.rates(
  currency TEXT,
  date     DATE,
  rate     NUMERIC
);

\COPY raw.rates FROM 'rates.csv' WITH CSV DELIMITER ';'

CREATE TABLE RATES(
  currency TEXT,
  validity DATERANGE,
  rate     NUMERIC,

  EXCLUDE USING GIST (currency WITH =, validity WITH &&)
);

INSERT INTO rates(currency, validity, rate)
  SELECT
    currency,
    daterange(DATE, LEAD(DATE) OVER(PARTITION BY currency ORDER BY DATE), '[)') AS validity,
    rate
  FROM
    raw.rates
  ORDER BY
    date;

COMMIT;
