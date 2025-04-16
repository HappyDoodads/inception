FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y mariadb-server

RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld
RUN chmod 777 /var/run/mysqld

# RUN sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/mysql.sh /tmp/mysql.sh
RUN chmod +x /tmp/mysql.sh

EXPOSE 3306

ENTRYPOINT [ "bash", "/tmp/mysql.sh" ]
CMD [ "mysqld_safe", "--bind-address=0.0.0.0" ]