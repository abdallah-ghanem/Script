# Use a base image
FROM nginx:alpine

# Copy Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Set permissions and create directories
RUN mkdir -p /var/cache/nginx/client_temp/var/run/nginx/tmp/nginx \
    && chown -R nginx:nginx /var/cache/nginx/client_temp/var/run/nginx/tmp/nginx

# Copy web content
COPY html /usr/share/nginx/html

# Set non-root user
USER nginx
