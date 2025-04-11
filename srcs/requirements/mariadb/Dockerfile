FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y mariadb-server

COPY ./tools/mysql.sh /tmp/mysql.sh
RUN chmod +x /tmp/mysql.sh

RUN sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT [ "bash", "/tmp/mysql.sh" ]