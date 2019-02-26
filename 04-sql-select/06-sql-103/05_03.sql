WITH points AS (
  SELECT
    year AS season,
    driverid,
    constructorid,
    SUM(points) AS points
  FROM
    results
  JOIN
    races USING(raceid)
  GROUP BY
    GROUPING SETS (
      (year, driverid),
      (year, constructorid)
    )
  HAVING
    SUM(points) > 0
  ORDER BY
    season,
    points DESC
), tops AS (
  SELECT
    season,
    MAX(points) FILTER(WHERE driverid IS NULL)      AS ctops,
    MAX(points) FILTER(WHERE constructorid IS NULL) AS dtops
  FROM
    points
  GROUP BY
    season
  ORDER BY
    season,
    dtops,
    ctops
), champs AS (
  SELECT
    tops.season,
    champ_driver.driverid,
    champ_constructor.constructorid,
    champ_constructor.points
  FROM
    tops
  JOIN
    points AS champ_driver
    ON champ_driver.season = tops.season
    AND champ_driver.constructorid IS NULL
    AND champ_driver.points = tops.dtops
  JOIN
    points AS champ_constructor
    ON champ_constructor.season = tops.season
    AND champ_constructor.driverid IS NULL
    AND champ_constructor.points = tops.ctops
)

SELECT
  season,
  FORMAT('%s %s', drivers.forename, drivers.surname) AS "Driver's Champion",
  constructors.name                                  AS "Contructor's champion"
FROM
  champs
JOIN
  drivers USING(driverid)
JOIN
  constructors USING(constructorid)
ORDER BY
  season;
