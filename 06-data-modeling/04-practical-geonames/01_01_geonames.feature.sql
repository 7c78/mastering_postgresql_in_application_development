BEGIN;

CREATE SCHEMA if NOT EXISTS geoname;

CREATE TABLE geoname.class (
  class       char(1) NOT NULL PRIMARY KEY,
  description text
);

INSERT INTO geoname.class (class, description)
  VALUES ('A', 'country, state, region,...'),
        ('H', 'stream, lake, ...'),
        ('L', 'parks,area, ...'),
        ('P', 'city, village,...'),
        ('R', 'road, railroad '),
        ('S', 'spot, building, farm'),
        ('T', 'mountain,hill,rock,... '),
        ('U', 'undersea'),
        ('V', 'forest,heath,...');

create table geoname.feature (
  class       char(1) NOT NULL REFERENCES geoname.class(class),
  feature     text    NOT NULL,
  description text,
  comment     text,

  PRIMARY KEY(class, feature)
);

INSERT INTO geoname.feature
  SELECT
    substring(code FROM 1 for 1) AS class,
    substring(code FROM 3)       AS feature,
    description,
    comment
  FROM
    raw.feature
  WHERE
    feature.code <> 'null';

COMMIT;
