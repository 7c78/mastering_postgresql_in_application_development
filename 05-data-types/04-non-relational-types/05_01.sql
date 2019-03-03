CREATE TABLE color (
  id serial PRIMARY KEY,
  name text
);

CREATE TABLE cars (
  brand  text,
  model  text,
  color  integer REFERENCES color(id)
);

INSERT INTO color(name)
     VALUES ('blue'), ('red'),
            ('gray'), ('black');

INSERT INTO cars(brand, model, color)
  SELECT brand, model, color.id
  FROM (
    VALUES('ferari', 'testarosa', 'red'),
          ('aston martin', 'db2', 'blue'),
          ('bentley', 'mulsanne', 'gray'),
          ('ford', 'T', 'black')
  ) AS data(brand, model, color)
  JOIN
    color ON color.name = data.color;
