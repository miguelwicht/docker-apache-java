FROM php:5.6-apache
MAINTAINER Miguel dos Santos Vaz Dias Wicht "miguel.wicht@3spin.de"

RUN apt-get update && apt-get install -y --fix-missing \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng12-dev \
        zlib1g-dev \
        openjdk-7-jre-headless \
        openjdk-7-jdk \
        wget \
        zipalign \
        zip \
        nano \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) pdo_mysql pcntl gd zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Activate mod_rewrite
RUN a2enmod rewrite

# Enable Nano
ENV TERM xterm
