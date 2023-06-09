# Nuxt 3 Docker Container

This is a base container to get Nuxt running inside a Docker container.

To use this in your project, import the Docker container.

FROM brandondbest/nuxt:3

| Docker Tag             | NPM Version | Nuxt Version |
|------------------------|-------------|--------------|
| brandondbest/nuxt:3    | latest      | latest       |
| brandondbest/nuxt:3-18 | 18          | 3            |
| brandondbest/nuxt:3-17 | 17          | 3            |

---

## Build The Image
```
docker build -t brandondbest/nuxt .
```

Tag the image to the top level:
```
docker build -t brandondbest/nuxt:3 -t brandondbest/nuxt:3-18 .
```

### Push the Image

```
docker push brandondbest/nuxt
```

Push a tagged Image:
```
docker push brandondbest/nuxt:3;
docker push brandondbest/nuxt:3-18;
```

For information on the requirements for each Laravel version:
https://laravel.com/docs/10.x/releases

### Create the Image for Additional Processors

```
docker buildx create --name nuxt3
docker buildx use nuxt3
docker buildx build --platform linux/amd64,linux/arm64 -t brandondbest/nuxt:3 -t brandondbest/nuxt:3-17 --push .
```


---

## Original Setup

Before running Docker compose, setup nuxt.

```
mkdir ~/Sites/nuxt;
cd ~/Sites/nuxt;
npx nuxi init .;
```