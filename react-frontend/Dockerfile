FROM node:alpine

WORKDIR /app

COPY . /app

RUN addgroup -S reactgroup && adduser -S reactuser -G reactgroup

RUN chown reactuser:reactgroup /app

USER reactuser

RUN npm ci && \
    npm cache clean --force

EXPOSE 3000

ENTRYPOINT ["npm", "start"]