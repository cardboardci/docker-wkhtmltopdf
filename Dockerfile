FROM cardboardci/ci-core:disco
USER root

ARG VERSION=0.12.5

COPY provision/pkglist /cardboardci/pkglist
RUN apt-get update \
    && xargs -a /cardboardci/pkglist apt-get install --no-install-recommends -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl -SL  "https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/${VERSION}/wkhtmltox-${VERSION}_linux-generic-amd64.tar.xz" | tar -xJ \
    && cp wkhtmltox/bin/* /usr/bin/ \
    && rm -rf wkhtmltox

USER cardboardci

##
## Image Metadata
##
ARG build_date
ARG version
ARG vcs_ref
LABEL maintainer = "CardboardCI" \
    \
    org.label-schema.schema-version = "1.0" \
    \
    org.label-schema.name = "wkhtmltopdf" \
    org.label-schema.version = "${version}" \
    org.label-schema.build-date = "${build_date}" \
    org.label-schema.release= = "CardboardCI version:${version} build-date:${build_date}" \
    org.label-schema.vendor = "cardboardci" \
    org.label-schema.architecture = "amd64" \
    \
    org.label-schema.summary = "Render HTML into PDFs" \
    org.label-schema.description = "wkhtmltopdf is a command line tools to render HTML into PDF" \
    \
    org.label-schema.url = "https://gitlab.com/cardboardci/images/wkhtmltopdf" \
    org.label-schema.changelog-url = "https://gitlab.com/cardboardci/images/wkhtmltopdf/releases" \
    org.label-schema.authoritative-source-url = "https://cloud.docker.com/u/cardboardci/repository/docker/cardboardci/wkhtmltopdf" \
    org.label-schema.distribution-scope = "public" \
    org.label-schema.vcs-type = "git" \
    org.label-schema.vcs-url = "https://gitlab.com/cardboardci/images/wkhtmltopdf" \
    org.label-schema.vcs-ref = "${vcs_ref}" \