#!/bin/bash

service mysql start

mysql -e "CREATE DATABASE IF NOT EXISTS '${SQL_DATABASE}';"
mysql -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON '${SQL_DATABASE}'.* TO '${SQL_USER}'@'%';"
mysql -u${SQL_ROOT_USER} -p${SQL_ROOT_PASSWORD} -e "ALTER USER '${SQL_ROOT_USER}'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"
mysqladmin -u${SQL_ROOT_USER} -p${SQL_ROOT_PASSWORD} shutdown

exec "$@"