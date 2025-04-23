FROM httpd:2.4

COPY php-fpm.conf /usr/local/apache2/conf/extra/php-fpm.conf

RUN echo "Include conf/extra/php-fpm.conf" >> /usr/local/apache2/conf/httpd.conf

# デフォルトの index.html を削除しておく！
RUN rm -f /usr/local/apache2/htdocs/index.html
