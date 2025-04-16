#!/bin/bash

if [ -d "/var/lib/mysql/$SQL_DATABASE" ]
then
	echo "Database $SQL_DATABASE already exists, skipping setup."
else
	service mysql start

	mysql -u root -e "SET PASSWORD FOR root@localhost = PASSWORD(\"${SQL_ROOT_PASSWORD}\");"
	mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
	mysql -e "CREATE USER IF NOT EXISTS ${SQL_USER}@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
	mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO ${SQL_USER}@'%';"
	mysql -e "FLUSH PRIVILEGES;"
	mysqladmin -uroot -p$SQL_ROOT_PASSWORD shutdown
fi

exec "$@"