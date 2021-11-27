
################
## DEVELOPMENT ##
################
FROM node:16.13.0-bullseye AS development

WORKDIR /app

COPY package*.json yarn.lock ./

RUN npm run install

COPY . .

RUN npm run build

EXPOSE 8081

################
## PRODUCTION ##
################
FROM node:16.13.0-bullseye AS production

RUN apt-get update && apt-get install -y nginx

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY nginx.conf /etc/nginx/nginx.conf

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

COPY . .

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 80