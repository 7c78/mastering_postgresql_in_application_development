SELECT
  customer.id,
  customer.name,
  ctype.name,
  rtime.value::interval AS "resp. time",
  etime.value::interval AS "esc. time"
FROM
  eav.customer
JOIN
  eav.support ON support.customer = customer.id
JOIN
  eav.support_contract AS contract ON support.contract = contract.id
JOIN
  eav.support_contract_type AS ctype ON ctype.id = contract.type
JOIN
  eav.params AS rtime ON rtime.entity = ctype.name
                      AND rtime.parameter = 'response time'
JOIN
  eav.params AS etime ON etime.entity = ctype.name
                      AND etime.parameter = 'escalation time';
