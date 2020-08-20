FROM php:7.4-apache

ARG HOST_USER_ID
ARG HOST_GROUP_ID

# Install required PHP excensions
RUN set -eux \
    && docker-php-ext-install \
    pdo \
    pdo_mysql \
    tokenizer

# Install required utilities
RUN set -eux \
    && apt-get update \
    && apt-get install -y \
    git \
    zip \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Install xdebug
RUN set -eux \
    && yes | pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini 

# Install composer
RUN set -eux \
	&& php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
	&& php composer-setup.php --install-dir=/bin --filename=composer \
	&& php -r "unlink('composer-setup.php');"

# Create wwww-data with host UID and GID
RUN set -eux \
    && usermod -u ${HOST_USER_ID} www-data \
    && groupmod -g ${HOST_GROUP_ID} www-data \
    && chown -R www-data:www-data /var/www

# Enable Apache modules
RUN a2enmod rewrite
RUN a2enmod ssl
RUN a2enmod headers

ADD xdebug-extra.ini /usr/local/etc/php/conf.d/xdebug-extra.ini
