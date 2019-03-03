BEGIN;

CREATE SCHEMA IF NOT EXISTS v;
CREATE SCHEMA IF NOT EXISTS cache;

CREATE VIEW v.season_points AS
  SELECT
    year AS season,
    driver,
    constructor,
    points
  FROM
    seasons
  LEFT JOIN LATERAL(
    /*
    * For each season, compute points by driver and by constructor.
    * As we're not interested into points per season for everybody
    * involved, we don't add the year into the grouping sets.
    */
    SELECT
      drivers.surname   AS driver,
      constructors.name AS constructor,
      SUM(points)       AS points
    FROM
      results
    JOIN
      races USING(raceid)
    JOIN
      drivers USING(driverid)
    JOIN
      constructors USING(constructorid)
    WHERE
      races.year = seasons.year
    GROUP BY
      GROUPING SETS(drivers.surname, constructors.name)
    ORDER BY
      drivers.surname IS NOT NULL,
      points DESC
    ) AS points ON TRUE
  ORDER BY
    year,
    driver IS NULL,
    points DESC;

CREATE MATERIALIZED VIEW cache.season_points as
  SELECT * FROM v.season_points;

CREATE INDEX ON cache.season_points(season);

COMMIT;
