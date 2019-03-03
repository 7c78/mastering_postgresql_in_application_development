BEGIN;

CREATE TABLE eav.support_contract_type (
  id   serial PRIMARY KEY,
  name text NOT NULL
);

INSERT INTO eav.support_contract_type(name)
  VALUES ('gold'), ('platinum');

CREATE TABLE eav.support_contract (
  id       serial PRIMARY KEY,
  type     integer NOT NULL REFERENCES eav.support_contract_type(id),
  validity DATERANGE NOT NULL,
  contract text,

  EXCLUDE USING GIST(type WITH =, validity WITH &&)
);

CREATE TABLE eav.customer(
  id       serial PRIMARY KEY,
  name     text NOT NULL,
  address  text
);

CREATE TABLE eav.support (
  customer  integer NOT NULL,
  contract  integer NOT NULL REFERENCES eav.support_contract(id),
  instances integer NOT NULL,

  PRIMARY KEY(customer, contract), CHECK(instances > 0)
);

COMMIT;
