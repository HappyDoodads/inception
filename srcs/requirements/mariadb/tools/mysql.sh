#!/bin/bash

service mysql start

mysqladmin -u root -p password "$SQL_ROOT_PASSWORD"
# mysql -u root -e "SET PASSWORD FOR 'root'@'%' = PASSWORD('${SQL_ROOT_PASSWORD}');"
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS ${SQL_USER}@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO ${SQL_USER}@'%';"
mysql -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p"$SQL_ROOT_PASSWORD" shutdown

exec mysqld_safe