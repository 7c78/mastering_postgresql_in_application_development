set lc_time to 'fr_FR';

SELECT
  TO_CHAR(ats, 'TMDay TMDD TMMonth, HHam') AS time,
  SUBSTRING(hash from 1 for 8)             AS hash,
  SUBSTRING(subject from 1 for 40) || '…'  AS subject
FROM
  commitlog
WHERE
  project = 'postgresql'
  AND ats >= date :'day'
  AND ats  < date :'day' + INTERVAL '1 day'
ORDER BY
  ats;
