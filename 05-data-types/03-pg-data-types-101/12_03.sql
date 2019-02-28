SELECT DISTINCT ON (ip)
  ip,
  SET_MASKLEN(ip, 27)       AS inet_27,
  SET_MASKLEN(ip::CIDR, 28) AS cidr_28
FROM
  access_log
LIMIT
  10;
