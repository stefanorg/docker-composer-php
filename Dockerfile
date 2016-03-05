FROM php:cli

ENV HOME /root

RUN apt-get update -qq && \
	apt-get install -y -qq sudo \
		git-core \
		zlib1g zlib1g-dev \
		curl && \
	docker-php-ext-install zip mbstring && \
	apt-get -y clean


RUN echo "date.timezone = Europe/Rome" >> /usr/local/etc/php/php.ini

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/local/bin

WORKDIR /srv
