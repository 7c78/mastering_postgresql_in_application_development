SELECT
  code,
  forename || ' ' || surname AS fullname,
  forename,
  surname AS fullname
FROM
  drivers;
