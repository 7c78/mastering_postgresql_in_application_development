BEGIN;

CREATE SCHEMA IF NOT EXISTS sample;

DROP TABLE IF EXISTS sample.geonames;

CREATE TABLE sample.geonames AS
  SELECT
    /*
    * We restrict the “export” to some columns only, so as to
    * further reduce the size of the exported file available to
    * download with the book.
    */
    geonameid,
    name,
    longitude,
    latitude,
    feature_class,
    feature_code,
    country_code,
    admin1_code,
    admin2_code,
    population,
    elevation,
    timezone
    /*
    * We only keep 1% of the 11 millions rows here.
    */
  FROM
    raw.geonames TABLESAMPLE bernoulli(1);

\COPY sample.geonames TO 'allCountries.sample.copy'

COMMIT;
