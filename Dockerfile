FROM node:latest

WORKDIR /usr/src/app

ARG PORT

COPY package.json ./
COPY yarn.lock ./

RUN yarn

COPY . .

EXPOSE ${PORT}
CMD yarn start