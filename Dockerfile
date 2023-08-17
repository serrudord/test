FROM php:8.0.8-fpm-alpine3.14

LABEL maintainer="Rolando Serrudo <rolando@mycorreo.com.ar>" \
    url="https://hub.docker.com/r/rserrudo/php/" \
    source="https://github.com/rserrudo/docker-php"

# Extensión GD
  RUN apk add --no-cache \
  freetype \
  libjpeg-turbo \
  libpng \
  freetype-dev \
  libjpeg-turbo-dev \
  libpng-dev \
  && docker-php-ext-configure gd \
    --with-freetype=/usr/include/ \
    # --with-png=/usr/include/ \ # No longer necessary as of 7.4; https://github.com/docker-library/php/pull/910#issuecomment-559383597
    --with-jpeg=/usr/include/ \
  && docker-php-ext-install -j$(nproc) gd \
  && docker-php-ext-enable gd \
  && apk del --no-cache \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev

# Extensión MYSQLI
  RUN docker-php-ext-install mysqli && \
  docker-php-ext-enable mysqli

# Extensión PDO
  RUN docker-php-ext-install pdo pdo_mysql && \
  docker-php-ext-enable pdo_mysql

# Limpieza
  RUN rm -rf /tmp/*
