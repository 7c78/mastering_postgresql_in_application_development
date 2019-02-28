CREATE TABLE seq(id serial);
SELECT setval('public.seq_id_seq'::regclass, 2147483647);
INSERT INTO public.seq VALUES (default);
