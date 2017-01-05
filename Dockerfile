FROM php:5.5

RUN pear install doc.php.net/PhD

WORKDIR /app
