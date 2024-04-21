FROM node:18-alpine

RUN mkdir -p /usr/src/app

WORKDIR  /usr/src/app

COPY package*.json ./

RUN npm install

COPY  . .

EXPOSE 7777

CMD npm run start