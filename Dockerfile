# syntax=docker/dockerfile:1

# https://kairos.io/docs/advanced/bundles/

FROM alpine AS build
FROM scratch

COPY run.sh /run.sh
COPY ./assets /assets
ENTRYPOINT ["/run.sh"]
