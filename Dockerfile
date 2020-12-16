FROM node:15.4-alpine3.10

ENV GLIBC_VERSION 2.32-r0

RUN set -x \
    && apk add --update libstdc++ which wget ca-certificates python make g++

# Install glibc (see https://discourse.gohugo.io/t/solved-bin-sh-hugo-not-found-in-docker-container/12983/6)

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk \
    && apk add glibc-${GLIBC_VERSION}.apk

RUN npm config set unsafe-perm true \
    && npm install -g preact-cli

