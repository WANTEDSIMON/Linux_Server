# Use the official Apache image
FROM httpd:latest

# Fix the Apache ServerName warning
RUN echo "ServerName localhost" >> /usr/local/apache2/conf/httpd.conf

# Fix permission issues by ensuring the logs directory is writable
RUN mkdir -p /usr/local/apache2/logs && chmod -R 777 /usr/local/apache2/logs

# Expose port 80
EXPOSE 80
