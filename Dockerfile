FROM ubuntu:15.10

# Install PHP, and Apache
RUN apt-get update && \
    apt-get -yq install \
        curl \
        apache2 \
        libapache2-mod-php5 \
        php5  

RUN apt-get -y install wget php5-mysql

# Copy code
RUN rm -r /var/www/html
COPY index.php /var/www/html/index.php

RUN ln -sf /dev/stdout /var/log/apache2/access.log
RUN ln -sf /dev/stderr /var/log/apache2/error.log

# Expose port and run apache
EXPOSE 80
CMD ["apachectl", "-DFOREGROUND"]
