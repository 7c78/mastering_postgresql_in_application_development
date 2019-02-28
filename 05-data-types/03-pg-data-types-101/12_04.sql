SELECT
  SET_MASKLEN(ip::CIDR, 24)               AS network,
  COUNT(*)                                AS requests,
  ARRAY_LENGTH(ARRAY_AGG(distinct ip), 1) AS ipcount
FROM
  access_log
GROUP BY
  network
HAVING
  ARRAY_LENGTH(ARRAY_AGG(DISTINCT ip), 1) > 1
ORDER BY
  requests desc,
  ipcount desc;
