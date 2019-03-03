CREATE TABLE tweet (
  id      bigint PRIMARY KEY,
  date    timestamptz,
  message text,
  tags    text
);
