CREATE TABLE rates (
  currency text,
  validity daterange,
  rate     numeric,

  exclude using gist (currency with =, validity with &&)
);
