CREATE TYPE color_t AS ENUM('blue', 'red', 'gray', 'black');

DROP TABLE IF EXISTS cars;
CREATE TABLE cars (
  brand   text,
  model   text,
  color   color_t
);

INSERT INTO cars(brand, model, color)
     VALUES ('ferari', 'testarosa', 'red'),
            ('aston martin', 'db2', 'blue'),
            ('bentley', 'mulsanne', 'gray'),
            ('ford', 'T', 'black');
