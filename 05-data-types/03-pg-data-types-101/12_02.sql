SELECT DISTINCT ON (ip)
  ip,
  SET_MASKLEN(ip, 24)       AS inet_24,
  SET_MASKLEN(ip::CIDR, 24) AS cidr_24
FROM
  access_log
LIMIT
  10;
