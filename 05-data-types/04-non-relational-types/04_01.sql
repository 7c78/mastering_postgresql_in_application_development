CREATE TABLE js(id serial PRIMARY KEY, extra json);
INSERT INTO js(extra)
     VALUES ('[1, 2, 3, 4]'),
            ('[2, 3, 5, 8]'),
            ('{"key": "value"}');
