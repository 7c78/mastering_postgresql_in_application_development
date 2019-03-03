CREATE TABLE rates(
  currency text,
  validity daterange,
  rate     numeric,

  exclude using gist (currency WITH =, validity WITH &&)
);
