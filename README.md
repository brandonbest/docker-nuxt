# Nuxt 3 Minimal Starter

Look at the [Nuxt 3 documentation](https://nuxt.com/docs/getting-started/introduction) to learn more.

# Local Setup

### Create Local Files

Assuming the local directory is ~/Sites/nuxt.test:

```
mkdir ~/Sites/nuxt.test;
cat ~/Sites/nuxt.test/dockerfile;
cat ~/Sites/nuxt.test/dockerfile.yml;
```

### Fill in the Files

Create a new `dockerfile` with the following:
```
FROM brandondbest/nuxt:3

RUN nuxt-init

RUN npm install
```

Also create `dockerfile.yml`

```
version: '3.1'
services:
    # Nuxt Application
    nuxt:
        container_name: nuxt
        build:
            context: ..
            dockerfile: ./dockerfile
        environment:
            VIRTUAL_HOST: ${VIRTUAL_HOST:-nuxt.test}
            VIRTUAL_PORT: ${VIRTUAL_PORT:-3000}
        restart: on-failure
        volumes:
            - ${DATA_DIR:-~/Sites/nuxt.test}:/nuxt/
            - /nuxt/node_modules
```


# Docker Container Tag

The dockerfile is located in the root directory. To create a new tagged release:

```
docker buildx build --platform linux/amd64,linux/arm64 -t brandondbest/nuxt:3 -t brandondbest/nuxt:3-17 --push .
```

Tags:
- nuxt:3
- nuxt:3-<npm version>
- nuxt:3-17