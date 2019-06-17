FROM alpine:edge

RUN set -ex \
    && echo '@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing' >>/etc/apk/repositories \
    && apk update \
    && apk add --no-cache tinyproxy \
    && apk add --no-cache openconnect@testing

COPY files /
WORKDIR /root
EXPOSE 8888
CMD /root/run
