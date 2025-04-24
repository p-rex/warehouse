FROM php:8.2-fpm

RUN apt-get update && \
    apt-get install -y procps && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

COPY index.php .
