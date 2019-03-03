BEGIN;

CREATE SCHEMA IF NOT EXISTS raw;

CREATE TABLE raw.geonames (
  geonameid      bigint,
  name           text,
  asciiname      text,
  alternatenames text,
  latitude       double precision,
  longitude      double precision,
  feature_class  text,
  feature_code   text,
  country_code   text,
  cc2            text,
  admin1_code    text,
  admin2_code    text,
  admin3_code    text,
  admin4_code    text,
  population     bigint,
  elevation      bigint,
  dem            bigint,
  timezone       text,
  modification   date
 );

CREATE TABLE raw.country (
  iso                text,
  iso3               text,
  isocode            integer,
  fips               text,
  name               text,
  capital            text,
  area               double precision,
  population         bigint,
  continent          text,
  tld                text,
  currency_code      text,
  currency_name      text,
  phone              text,
  postal_code_format text,
  postal_code_regex  text,
  languages          text,
  geonameid          bigint,
  neighbours         text,
  fips_equiv         text
);

\COPY raw.country FROM 'countryInfoData.txt' WITH CSV DELIMITER E'\t'

CREATE TABLE raw.feature (
  code        text,
  description text,
  comment     text
);

\COPY raw.feature FROM 'featureCodes_en.txt' WITH CSV DELIMITER E'\t'

CREATE TABLE raw.admin1 (
  code       text,
  name       text,
  ascii_name text,
  geonameid  bigint
);

\COPY raw.admin1 FROM 'admin1CodesASCII.txt' WITH CSV DELIMITER E'\t'

CREATE TABLE raw.admin2 (
  code       text,
  name       text,
  ascii_name text,
  geonameid  bigint
);

\COPY raw.admin2 FROM 'admin2Codes.txt' WITH CSV DELIMITER E'\t'

COMMIT;
