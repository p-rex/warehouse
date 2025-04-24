FROM httpd:2.4

# envsubst を使うために gettext をインストール
RUN apt-get update && \
    apt-get install -y gettext procps && \
    rm -rf /var/lib/apt/lists/*

COPY php-fpm.conf.template /usr/local/apache2/conf/extra/php-fpm.conf.template
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh \
 && echo "Include conf/extra/php-fpm.conf" >> /usr/local/apache2/conf/httpd.conf

# デフォルトの index.html を削除しておく！
RUN rm -f /usr/local/apache2/htdocs/index.html

ENTRYPOINT ["/entrypoint.sh"]
CMD ["httpd-foreground"]
