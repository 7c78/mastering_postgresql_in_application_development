START TRANSACTION isolation level repeatable read;

UPDATE
  tweet.message
SET
  rts = rts + 1
WHERE
  messageid = 1
RETURNING messageid, rts;
