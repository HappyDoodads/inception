FROM debian:buster

RUN apt-get update -y; \
	apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes \
		-out /etc/nginx/ssl/inception.crt \
		-keyout /etc/nginx/ssl/inception.key \
		-subj "/C=FR/ST=IDF/L=Nice/O=42Nice/OU=42/CN=jdemers.42.fr/UID=jdemers"

COPY conf/default /etc/nginx/sites-enabled/default

# RUN	chmod 755 /var/www/wordpress
# RUN chown -R www-data:www-data /var/www/wordpress

CMD [ "nginx", "-g", "daemon off;" ]