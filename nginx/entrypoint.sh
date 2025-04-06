#!/bin/sh
# Подстановка переменных окружения в шаблон конфигурации nginx
envsubst '$FRONTEND_PORT $BACKEND_PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf
# Запуск nginx в режиме foreground
exec nginx -g 'daemon off;'