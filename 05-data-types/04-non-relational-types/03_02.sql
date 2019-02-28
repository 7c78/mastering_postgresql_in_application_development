CREATE TABLE docs (
  id      serial PRIMARY KEY,
  content xml
);

INSERT INTO docs(content)
     VALUES ('<?xml version="1.0"?>
<html xmlns="http://www.w3.org/1999/xhtml">
<body>hello</body>
</html>');

SELECT
  id,
  STRIPTAGS(content)
FROM
  docs;
