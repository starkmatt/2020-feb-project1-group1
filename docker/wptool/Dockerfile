FROM alpine:3.11
WORKDIR /var/www/html
RUN apt-get update \
	&& curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& php wp-cli.phar config create --dbhost=terraform-20200413074641219700000001.clum5efcsimh.ap-southeast-2.rds.amazonaws.com --dbname=wordpress --dbuser=db_root2904 --dbpass=bluegrass9032 --allow-root --skip-check \
	&& php wp-cli.phar core install --url=localhost --title=Example --admin_user=admin --admin_password=admin --admin_email=admin@example.com --allow-root \
	&& rm -rf wp-cli.phar