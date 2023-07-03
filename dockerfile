FROM node:17-alpine

WORKDIR /nuxt

RUN apk add nano \
    procps \
    bash

# update and install dependency
RUN apk update && apk upgrade

# Move package.json and lock file into position
COPY ./package.json /nuxt/package.json
COPY ./package-lock.json /nuxt/package-lock.json

COPY ./deploy/local/bash/nuxt-init.sh /usr/local/bin/nuxt-init
RUN chmod 0777 /usr/local/bin/nuxt-init

# copy the app, note .dockerignore
RUN npm install
RUN npm i -g nuxt
RUN npm run build

#ENTRYPOINT ["tail", "-f", "/dev/null"]
ENTRYPOINT ["npm", "run", "dev"]