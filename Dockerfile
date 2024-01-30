FROM node:16-alpine as node

RUN mkdir  /home/node/app

WORKDIR /home/node/app

COPY package*.json ./


RUN npm install

COPY . .

RUN  npm run  build --prod

#serving to nginx

FROM nginx:latest



COPY --from=node  /home/node/app/dist/angular-build  /usr/share/nginx/html


EXPOSE 4200


