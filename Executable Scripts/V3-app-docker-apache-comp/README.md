# Createing minimum apache app

V1 and V2 are localy to show what the objectiv is later on the server.

Files in V1 and V2 are mostly the same but in V2 we update som of them and in v3 add github action to publish on Server.


1. Step 1: Dockerfile
```dockerfile
# Use the official Apache image
FROM httpd:latest

# Expose port 80 for web traffic
EXPOSE 80
```

- Uses httpd:latest (small & optimized).
- No extra configurations, just Apache serving static files.

2. Step 2: docker-compose.yml
```docker-compose.yml
services:
  apache:
    build: .
    container_name: apache_container
    ports:
      - "80:80"
    restart: unless-stopped
    volumes:
      - ./website:/usr/local/apache2/htdocs
```
run app with:

docker-compose up -d --build

go to localhost
minimum app :


![image](https://github.com/user-attachments/assets/f87d3be7-8cea-4428-b812-b82ee162629a)
