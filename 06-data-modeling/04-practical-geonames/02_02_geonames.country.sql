BEGIN;

CREATE SCHEMA IF NOT EXISTS geoname;

CREATE TABLE geoname.continent (
  code char(2) PRIMARY KEY,
  name text
);

INSERT INTO geoname.continent(code, name)
  VALUES ('AF', 'Africa'),
         ('NA', 'North America'),
         ('OC', 'Oceania'),
         ('AN', 'Antarctica'),
         ('AS', 'Asia'),
         ('EU', 'Europe'),
         ('SA', 'South America');

CREATE TABLE geoname.country(
  isocode   integer PRIMARY KEY,
  iso       char(2) NOT NULL,
  iso3      char(3) NOT NULL,
  fips      text,
  name      text,
  capital   text,
  continent char(2) REFERENCES geoname.continent(code),
  tld       text,
  geonameid bigint
);

INSERT INTO geoname.country
  SELECT
    isocode,
    iso,
    iso3,
    fips,
    name,
    capital,
    continent,
    tld,
    geonameid
  FROM
    raw.country;

CREATE TABLE geoname.neighbour (
  isocode   integer NOT NULL REFERENCES geoname.country(isocode),
  neighbour integer NOT NULL REFERENCES geoname.country(isocode),

  PRIMARY KEY(isocode, neighbour)
);

INSERT INTO geoname.neighbour
  WITH n AS (
    SELECT
      isocode,
      regexp_split_to_table(neighbours, ',') AS neighbour
    FROM
      raw.country
  )

  SELECT
    n.isocode,
    country.isocode
  FROM
    n
  JOIN
    geoname.country ON country.iso = n.neighbour;

COMMIT;
