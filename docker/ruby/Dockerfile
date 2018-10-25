FROM ruby:2.5-alpine

RUN apk --no-cache add make gcc libc-dev postgresql-dev nodejs git tzdata

ENV USER coin
ENV PUID 1000
RUN addgroup -S -g $PUID $USER && \
    adduser -u $PUID -S -G $USER $USER

USER $USER

WORKDIR /var/www
