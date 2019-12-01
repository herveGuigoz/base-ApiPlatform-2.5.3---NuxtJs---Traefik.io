ARG NODE_VERSION=13

FROM node:${NODE_VERSION}-alpine

ENV HOST 0.0.0.0

# Create app directory.
RUN mkdir -p /usr/src/client
WORKDIR /usr/src/client

RUN apk add python make g++

# Prevent the reinstallation of node modules at every changes in the source code.
COPY package.json yarn.lock ./
RUN yarn install

COPY . ./

CMD yarn dev

EXPOSE 3000
