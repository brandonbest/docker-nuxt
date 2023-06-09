FROM node:17-alpine

WORKDIR /app

RUN apk add nano \
    procps \
    bash

# update and install dependency
RUN apk update && apk upgrade

# Move package.json and lock file into position
COPY ./package.json /app/package.json
COPY ./package-lock.json /app/package-lock.json

# copy the app, note .dockerignore
RUN npm install
RUN npm run build

#ENTRYPOINT ["tail", "-f", "/dev/null"]
ENTRYPOINT ["npm", "run", "dev"]