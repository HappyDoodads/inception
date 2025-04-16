#!bin/bash

sleep 10

if [ -f /var/www/wordpress/wp-config.php ]
then
	echo "Wordpress already installed, skipping setup."
else
	# Install wordpress
	wp core download https://fr.wordpress.org/wordpress-6.7-fr_FR.tar.gz \
		--allow-root \
		--path='/var/www/wordpress'

	wp config create --allow-root --skip-check \
		--dbname=$SQL_DATABASE \
		--dbuser=$SQL_USER \
		--dbpass=$SQL_PASSWORD \
		--dbhost=mariadb:3306 \
		--path='/var/www/wordpress'

	wp core install --allow-root \
		--url=$DOMAIN_NAME \
		--title=Inception \
		--admin_user=$WP_ADMIN \
		--admin_password=$WP_ADMIN_PASSWORD \
		--admin_email=$WP_ADMIN_EMAIL --skip-email

	wp user create $WP_USER $WP_USER_EMAIL \
		--allow-root \
		--role=author \
		--user_pass=$WP_USER_PASSWORD

	wp theme install rufous --allow-root --activate \
		--path='/var/www/wordpress'
fi

exec "$@"