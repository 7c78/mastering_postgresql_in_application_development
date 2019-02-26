CREATE TABLE test(id SERIAL, f1 TEXT DEFAULT 'unknown');
INSERT INTO test(f1) VALUES(DEFAULT),(NULL),('foo');
table test;
