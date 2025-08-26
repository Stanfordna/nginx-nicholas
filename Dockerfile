FROM nginx:stable-alpine-slim AS build

RUN touch /var/run/nginx.pid && \
adduser -D nicholas && \
chown -R nicholas:nicholas /var/cache /var/run && \
mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.off
 
COPY nginx_nicholas.conf /etc/nginx/conf.d/nginx_nicholas.conf

WORKDIR /etc/nginx/conf.d/

EXPOSE 80 443
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]

# FROM scratch AS production