FROM node:alpine as build
WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install --production --no-cache

COPY . .
RUN npm run build

FROM alpine:latest
WORKDIR /usr/share/app
COPY --from=build /app/build .
