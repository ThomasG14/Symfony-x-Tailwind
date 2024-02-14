FROM php:8.2-fpm

RUN apt-get update \
    && apt-get install -y libzip-dev zip libpq-dev libicu-dev libpng-dev \
    && docker-php-ext-install zip pdo pdo_pgsql gd \
    && apt-get clean \
    && docker-php-ext-install intl

COPY --from=composer /usr/bin/composer /usr/bin/composer
WORKDIR /opt/epack/epack-api-maj-auto
COPY . .

USER 1000:1000
