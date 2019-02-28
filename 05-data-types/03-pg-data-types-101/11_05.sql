\set day '2017-06-01'

SELECT
  ats::TIME,
  SUBSTRING(hash FROM 1 for 8)            AS hash,
  SUBSTRING(subject FROM 1 for 40) || '…' AS subject
FROM
  commitlog
WHERE
  project = 'postgresql'
  AND ats >= DATE :'day'
  AND ats  < DATE :'day' + INTERVAL '1 day'
ORDER BY
  ats;
