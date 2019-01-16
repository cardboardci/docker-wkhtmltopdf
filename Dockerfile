FROM alpine:3.8
COPY rootfs/ /

COPY provision/install.sh /tmp/install.sh
RUN sh /tmp/install.sh && rm -f /tmp/install.sh