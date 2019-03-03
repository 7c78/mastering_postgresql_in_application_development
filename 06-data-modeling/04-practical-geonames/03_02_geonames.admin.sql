BEGIN;

CREATE SCHEMA IF NOT EXISTS geoname;

CREATE TABLE geoname.region (
  isocode   integer NOT NULL REFERENCES geoname.country(isocode),
  regcode   text NOT NULL,
  name      text,
  geonameid bigint,

  PRIMARY KEY(isocode, regcode)
);

INSERT INTO geoname.region
  WITH admin AS(
    SELECT
      regexp_split_to_array(code, '[.]') AS code,
      name,
      geonameid
  FROM
    raw.admin1
  )

  SELECT
    country.isocode AS isocode,
    code[2]         AS regcode,
    admin.name,
    admin.geonameid
  FROM
    admin
  JOIN
    geoname.country ON country.iso = code[1];

CREATE TABLE geoname.district (
  isocode   integer NOT NULL,
  regcode   text NOT NULL,
  discode   text NOT NULL,
  name      text,
  geonameid bigint,

  PRIMARY KEY(isocode, regcode, discode),
  FOREIGN KEY(isocode, regcode)
  REFERENCES geoname.region(isocode, regcode)
);

INSERT INTO geoname.district
  WITH admin AS (
    SELECT
    regexp_split_to_array(code, '[.]') AS code,
    name,
    geonameid
  FROM
    raw.admin2
  )

  SELECT
    region.isocode,
    region.regcode,
    code[3],
    admin.name,
    admin.geonameid
  FROM
    admin
  JOIN
    geoname.country ON country.iso = code[1]
  JOIN
    geoname.region ON region.isocode = country.isocode AND region.regcode = code[2];

COMMIT;
