FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y php-fpm php-mysql mariadb-client wget

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN mkdir -p /run/php

RUN mkdir -p /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY tools/auto_config.sh /tmp/auto_config.sh
RUN chmod +x /tmp/auto_config.sh

EXPOSE 9000

WORKDIR /var/www/wordpress
ENTRYPOINT [ "bash", "/tmp/auto_config.sh" ]