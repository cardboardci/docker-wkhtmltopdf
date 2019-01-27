FROM alpine:3.8
COPY rootfs/ /

RUN echo "Marked as WIP from previous project (jrbeverylabs/dockerfiles/docker-wkhtmltopdf)"