FROM nginx:stable-alpine-slim AS build

RUN touch /var/run/nginx.pid && \
adduser -D nonroot && \
chown -R nonroot:nonroot /var/cache /var/run

WORKDIR /home/nonroot

ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]

# FROM scratch AS production