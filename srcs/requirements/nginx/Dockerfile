FROM debian:buster

RUN apt update; \
	apt install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes \
		-out /etc/nginx/ssl/inception.crt \
		-keyout /etc/nginx/ssl/inception.key \
		-subj "/C=FR/ST=IDF/L=Nice/O=42/OU=42/CN=jdemers.42.fr/UID=jdemers"

RUN mkdir -p /var/run/nginx