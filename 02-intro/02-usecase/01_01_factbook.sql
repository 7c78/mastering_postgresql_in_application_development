BEGIN;

CREATE TABLE factbook (
  year    int,
  date    date,
  shares  text,
  trades  text,
  dollars text
);

\COPY factbook FROM 'factbook.csv' WITH DELIMITER E'\t' NULL ''

ALTER TABLE factbook
  ALTER shares  type bigint USING replace(shares, ',', '')::bigint,
  ALTER trades  type bigint USING replace(trades, ',', '')::bigint,
  ALTER dollars type bigint USING substring(replace(dollars, ',', '') FROM 2)::numeric;
