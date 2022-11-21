FROM php:8.1-fpm

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    openssl \
    # clear cache
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Extensions
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions \
    exif \
    bcmath \
    opcache \
    sockets \
    imagick \
    gd \
    intl \
    mcrypt \
    mysqli \
    sodium \
    ssh2 \
    zip \
    dom \
    fileinfo \
    hash \
    iconv \
    json \
    ftp \
    pcre \
    SimpleXML \
    zlib \
    mbstring \
    @composer

# Set working directory
WORKDIR /var/www/app/

# Copy existing application directory permissions
COPY . .

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
COPY ./docker/php.ini $PHP_INI_DIR/conf.d/

# This is to run the enterpoint
COPY ./docker/entrypoint.sh /usr/local/bin/entrypoint

RUN chmod +x /usr/local/bin/entrypoint
ENTRYPOINT ["entrypoint"]

CMD ["php-fpm"]
