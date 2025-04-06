FROM nginx:alpine

COPY conf.d /etc/nginx/conf.d

COPY entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

RUN mkdir -p /var/cache/nginx/client_temp && chown -R nginx:nginx /var/cache/nginx

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
