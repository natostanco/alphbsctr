FROM alpine:edge

VOLUME ["/var/run/dbus"]

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
 && apk update \
 && apk add mono make dbus \
 && wget http://mir7.ovh.net/ovh-applications/hubic/hubiC-Linux/2.1.0/hubiC-Linux-2.1.0.53-linux.tar.gz \
 && tar -xf hubiC-Linux-2.1.0.53-linux.tar.gz \
 && cd hubic \
 && make install \
 && apk del --purge make \
 && cd .. \
 && rm -r hubiC-Linux-2.1.0.53-linux.tar.gz hubic /var/cache/apk/*

CMD ["/usr/local/bin/hubic"]

