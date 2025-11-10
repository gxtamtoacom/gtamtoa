FROM wordpress:php8.3-apache

# Copy code
COPY . /var/www/html
WORKDIR /var/www/html

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer install --no-dev --optimize-autoloader

# Quyền thư mục
RUN chown -R www-data:www-data /var/www/html/web/wp-content

EXPOSE 80
