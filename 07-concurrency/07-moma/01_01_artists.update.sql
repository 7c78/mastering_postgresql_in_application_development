BEGIN;

CREATE TEMP TABLE BATCH (
  LIKE moma.artist INCLUDING ALL
) ON COMMIT drop;

\copy batch FROM 'artists/artists.2017-06-01.csv' WITH CSV HEADER DELIMITER ','

WITH upd AS (
  UPDATE moma.artist
  SET (name, bio, nationality, gender, begin, "end", wiki_qid, ulan) = (
    batch.name,
    batch.bio,
    batch.nationality,
    batch.gender,
    batch.begin,
    batch."end",
    batch.wiki_qid,
    batch.ulan
  )
FROM
  batch
WHERE
  batch.constituentid = artist.constituentid
  AND (artist.name, artist.bio, artist.nationality, artist.gender, artist.begin, artist."end",artist.wiki_qid, artist.ulan) <> (batch.name, batch.bio, batch.nationality,
  batch.gender, batch.begin, batch."end",
  batch.wiki_qid, batch.ulan)

RETURNING artist.constituentid
),

ins AS (
INSERT INTO moma.artist
  SELECT
    constituentid,
    name,
    bio,
    nationality,
    gender,
    begin,
    "end",
    wiki_qid,
    ulan
  FROM
    batch
  WHERE not exists (
    SELECT 1
    FROM
      moma.artist
    WHERE
      artist.constituentid = batch.constituentid
)
RETURNING artist.constituentid
)

SELECT
  (
    SELECT
      count(*)
    FROM
      upd
    ) AS updates,
  (
    SELECT
      count(*)
    FROM
      ins
  ) AS inserts;

COMMIT;
