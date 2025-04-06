FROM node:alpine as build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install --production --no-cache
COPY . .
RUN npm run build


FROM nginx:alpine
RUN sed -i 's|pid\s\+/var/run/nginx.pid;|pid /tmp/nginx.pid;|g' /etc/nginx/nginx.conf
RUN sed -i '/^user/d' /etc/nginx/nginx.conf
RUN addgroup -S react && adduser -D -G react react
RUN mkdir -p /var/cache/nginx/{client_temp,proxy_temp} && \
    chown -R react:react /var/cache/nginx
RUN chmod 1777 /tmp
COPY --from=build /app/build /usr/share/nginx/html
RUN rm -rf /var/cache/apk/*

USER react
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
