WITH races_per_decade AS (
  SELECT
    EXTRACT('year' FROM DATE_TRUNC('decade', date)) AS decade,
    COUNT(*) AS nbraces
  FROM
    races
  GROUP BY
    decade
  ORDER BY
    decade
)
SELECT
  decade,
  nbraces,
  CASE
    WHEN
      lag(nbraces, 1) OVER(ORDER BY decade) IS NULL
    THEN
      ''
    WHEN
      nbraces - lag(nbraces, 1) OVER(ORDER BY decade) < 0
    THEN
      format('-%3s', lag(nbraces, 1) OVER(ORDER BY decade) - nbraces)
    ELSE
      format('+%3s', nbraces - lag(nbraces, 1) OVER(ORDER BY decade))
  END AS evolution
FROM
  races_per_decade;
