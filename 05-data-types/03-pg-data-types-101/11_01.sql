SELECT
  project,
  hash,
  author,
  ats,
  committer,
  cts,
  subject
FROM
  commitlog
WHERE
  project = 'postgresql'
ORDER BY
  ats DESC
LIMIT 1;
