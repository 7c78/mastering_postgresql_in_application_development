SELECT
  code,
  FORMAT('%s %s', forename, surname) AS fullname,
  forename,
  surname AS fullname
FROM
  drivers;
