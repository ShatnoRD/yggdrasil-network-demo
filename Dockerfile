FROM alpine:3.18.3

RUN \
    apk add \
    --no-cache \
    --no-check-certificate \
    --allow-untrusted \
    --no-scripts \
    curl \
    yggdrasil \
    socat \
    supervisor

CMD supervisord -c /etc/supervisord.conf