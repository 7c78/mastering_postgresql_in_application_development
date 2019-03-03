CREATE ROLE dbowner WITH login;
CREATE ROLE app WITH login;

CREATE ROLE critical  WITH login IN role app inherit;
CREATE ROLE notsomuch WITH login IN role app inherit;
CREATE ROLE dontcare  WITH login IN role app inherit;

ALTER USER critical  SET synchronous_commit TO remote_apply;
ALTER USER notsomuch SET synchronous_commit TO local;
ALTER USER dontcare  SET synchronous_commit TO off;
