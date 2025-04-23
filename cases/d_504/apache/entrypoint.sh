#!/bin/sh

# 環境変数でプレースホルダを置換
envsubst < /usr/local/apache2/conf/extra/php-fpm.conf.template > /usr/local/apache2/conf/extra/php-fpm.conf

# Apache起動
exec httpd-foreground
