FROM php:8.0.21-cli-alpine3.15 as base
LABEL maintainer="Rémi Marseille <marseille@ekino.com>"
ARG APCU_VERSION
ARG COMPOSER_VERSION
ARG ICONV_VERSION
ARG MEMCACHED_VERSION
ARG MODD_VERSION
ARG MUSL_VERSION
ARG PHP_CS_FIXER_VERSION
ARG REDIS_VERSION
ARG SECURITY_CHECKER_VERSION
ARG SSH2_VERSION
ARG XDEBUG_VERSION
ARG TARGETARCH
# iconv issue https://github.com/docker-library/php/issues/240
ENV COMPOSER_NO_INTERACTION=1 \
    COMPOSER_MEMORY_LIMIT=-1 \
    TERM=xterm \
    LD_PRELOAD="/usr/lib/preloadable_libiconv.so php" \
    PHP_CPPFLAGS="$PHP_CPPFLAGS -std=c++11"

FROM base as base-amd64
ARG MODD_ARCH="linux64"

FROM base as base-arm64
ARG MODD_ARCH="linux64"

FROM base-${TARGETARCH}
ARG MODD_URL="https://github.com/cortesi/modd/releases/download/v${MODD_VERSION}/modd-${MODD_VERSION}-${MODD_ARCH}.tgz"
COPY run.sh .
RUN sh run.sh

