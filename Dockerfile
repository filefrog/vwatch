FROM ubuntu:18.04

ARG BUILD_DATE
ARG VCS_REF
LABEL maintainer="James Hunt <images@huntprod.com>" \
      summary="Watch for and react to upstream software releases from a container" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/filefrog/vwatch.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0.0"

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y perl jq curl \
 && rm -rf /var/lib/apt/lists/*

COPY detect/ /detect/
COPY diag /usr/local/bin/diag
ENTRYPOINT ["/detect/_go"]
CMD ["help"]
