BEGIN;

CREATE TABLE geoname.geoname (
  geonameid  bigint PRIMARY KEY,
  name       text,
  location   point,
  isocode    integer,
  regcode    text,
  discode    text,
  class      char(1),
  feature    text,
  population bigint,
  elevation  bigint,
  timezone   text,

  FOREIGN KEY(isocode)                   REFERENCES geoname.country(isocode),
  FOREIGN KEY(isocode, regcode)          REFERENCES geoname.region(isocode, regcode),
  FOREIGN KEY(isocode, regcode, discode) REFERENCES geoname.district(isocode, regcode, discode),
  FOREIGN KEY(class)                     REFERENCES geoname.class(class),
  FOREIGN KEY(class, feature)            REFERENCES geoname.feature(class, feature)
);

INSERT INTO geoname.geoname
  WITH geo AS (
    SELECT
      geonameid,
      name,
      point(longitude, latitude) AS location,
      country_code,
      admin1_code,
      admin2_code,
      feature_class,
      feature_code,
      population,
      elevation,
      timezone
    FROM
      raw.geonames
  )

  SELECT
    geo.geonameid,
    geo.name,
    geo.location,
    country.isocode,
    region.regcode,
    district.discode,
    feature.class,
    feature.feature,
    population,
    elevation,
    timezone
  FROM
    geo
  LEFT JOIN
    geoname.country ON country.iso = geo.country_code
  LEFT JOIN
    geoname.region ON region.isocode = country.isocode
                   AND region.regcode = geo.admin1_code
  LEFT JOIN
    geoname.district ON district.isocode = country.isocode
                     AND district.regcode = geo.admin1_code
                     AND district.discode = geo.admin2_code

  LEFT JOIN
    geoname.feature ON feature.class = geo.feature_class
                    AND feature.feature = geo.feature_code;

CREATE INDEX ON geoname.geoname USING GIST(location);

COMMIT;
