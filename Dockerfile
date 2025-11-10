# DÙNG IMAGE CHUẨN VIỆT NAM 2025 – ĐÃ FIX EXIT CODE 2
FROM php:8.3-apache

# Cài đủ extension + tăng RAM cho Composer
ENV COMPOSER_MEMORY_LIMIT=-1
RUN docker-php-ext-install mysqli pdo_mysql \
    && a2enmod rewrite \
    && apt-get update && apt-get install -y git unzip libzip-dev \
    && docker-php-ext-install zip \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy code Bedrock
COPY . /var/www/html
WORKDIR /var/www/html

# Chạy Composer không bị lỗi RAM
RUN composer install --no-dev --optimize-autoloader --no-interaction

# Quyền thư mục
RUN chown -R www-data:www-data /var/www/html

# Port
EXPOSE 80
