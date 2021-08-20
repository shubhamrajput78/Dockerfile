FROM ubuntu
RUN apt-get update && apt-get upgrade -y
RUN apt-get install nano curl software-properties-common -y
RUN apt-get install apache2 -y
RUN service apache2 start
RUN add-apt-repository ppa:ondrej/php
RUN apt-get update
RUN apt-get install -y \
            php7.4 \
            php7.4-mbstring \
            php7.4-intl    \
            php7.4-simplexml \
            php7.4-pdo  \
            php7.4-sqlite \
            php7.4-mysql \
            php7.4-mysqli \
            php7.4-gettext
RUN DEBIAN_FRONTEND=noninteractive apt-get install mysql-server mysql-client -y
ENV LOG_STDOUT **Boolean**
ENV LOG_STDERR **Boolean**
ENV LOG_LEVEL warn
ENV ALLOW_OVERRIDE All
ENV DATE_TIMEZONE UTC
ENV TERM dumb
ENV MYSQL_ROOT_PASSWORD root
ENV MYSQL_DATABASE test_db
ENV MYSQL_USER devuser
ENV  MYSQL_PASSWORD devpass
RUN service mysql start

VOLUME /var/www/html
VOLUME /var/log/httpd
VOLUME /var/lib/mysql
VOLUME /var/log/mysql
VOLUME /etc/apache2

EXPOSE 80
EXPOSE 3306
