FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y php-fpm php-mysql mariadb-client wget

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN mkdir -p /run/php

RUN mkdir -p /var/www/html
RUN chown -R www-data:www-data /var/www/html
RUN wget https://github.com/vrana/adminer/releases/download/v5.2.1/adminer-5.2.1-en.php
RUN mv ./adminer-5.2.1-en.php /var/www/html/index.php
# RUN adduser --uid 82 --group --system www-data

EXPOSE 9000

ENTRYPOINT [ "/usr/sbin/php-fpm7.3", "-F" ]