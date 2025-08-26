FROM nginx:stable-alpine-slim AS build

RUN touch /var/run/nginx.pid && \
adduser -D nicholas && \
chown -R nicholas:nicholas /var/cache /var/run && \
mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.off && \
mkdir /etc/nginx/ssl/nicholasstanford.dev

WORKDIR /etc/nginx/conf.d/
COPY nginx_nicholas.conf ./nginx_nicholas.conf

EXPOSE 42069

USER nicholas
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]

# FROM scratch AS production
