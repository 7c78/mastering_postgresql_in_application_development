INSERT INTO sandbox.article (category, pubdate, title)
  VALUES
    (2, now(), 'Hot from the Press'),
    (2, now(), 'Hot from the Press')
  RETURNING *;
