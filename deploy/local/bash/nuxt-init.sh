#!/bin/bash

FILE=/nuxt/nuxt.config.ts
if [ -f "$FILE" ]; then
    echo "Nuxt is already setup"
    exit
fi

echo "Setting up nuxt"

mkdir /nuxt/nuxt

npx nuxi init /nuxt/nuxt

mv -f /nuxt/nuxt/* /nuxt
mv -f /nuxt/nuxt/.npmrc /nuxt
mv -f /nuxt/nuxt/.gitignore /nuxt

rm -rf /nuxt/nuxt

echo "PORT=3107" > /nuxt/.env

echo "Nuxt setup complete"