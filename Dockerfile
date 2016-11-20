FROM ubuntu:14.04
MAINTAINER andrea.monacchi@gmail.com

RUN apt-get update
RUN apt-get -y install unzip apache2 php5 php5-mysql php5-gd supervisor wget
RUN apt-get -y install mysql-server mysql-client
RUN apt-get clean all

RUN wget http://downloads.sourceforge.net/project/mjoelnir/Mjoelnir_0-3-1.zip && \
    unzip Mjoelnir_0-3-1.zip && \
    rm Mjoelnir_0-3-1.zip && \
    cp -R ./mjoelnir/advisor /var/www/html

# on mysql the password is given with -p without spaces
RUN (/usr/bin/mysqld_safe &); sleep 5; 
#RUN mysqladmin create mjoelnir; mysqlimport advisor /mjoelnir/mjoelnir.sql;

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80

CMD ["/usr/bin/supervisord"]
