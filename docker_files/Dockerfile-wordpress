FROM php:7.3-apache
WORKDIR /var/www/html
RUN apt-get update && apt-get install -y wget \
    && docker-php-ext-install mysqli \
	&& wget -O wordpress.tar.gz https://en-au.wordpress.org/latest-en_AU.tar.gz \
    && tar -xzvf wordpress.tar.gz \
    && mv wordpress/* /var/www/html \
	&& chmod -R 755 wp-content \
	&& chown -R www-data:www-data . \
	&& curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& rm -rf wordpress/ wordpress.tar.gz \
	&& apt-get remove -y wget