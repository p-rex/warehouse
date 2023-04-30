FROM node:18.15.0-alpine3.17

RUN 
RUN apk update && \
    apk upgrade --available && \
    apk add bash vim curl npm git && \
    apk add --update python3

#npm install axios

RUN npm install -g gatsby-cli

RUN adduser -D docker # Adding -D to avoid password requirements
USER docker

WORKDIR /usr/src
