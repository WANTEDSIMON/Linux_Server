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
```
run app with:

docker-compose up -d --build

go to localhost, http://localhost/
minimum app :


![image](https://github.com/user-attachments/assets/f87d3be7-8cea-4428-b812-b82ee162629a)

What’s New in v2?
🔹 Custom index.html (no default Apache page).

1. update dockerfile:
```
# Use the official Apache image
FROM httpd:latest

# Fix the Apache ServerName warning
RUN echo "ServerName localhost" >> /usr/local/apache2/conf/httpd.conf

# Fix permission issues by ensuring the logs directory is writable
RUN mkdir -p /usr/local/apache2/logs && chmod -R 777 /usr/local/apache2/logs

# Expose port 80
EXPOSE 80

```
2. docker-compose.yml
```
services:
  apache:
    build: .
    container_name: apache_container
    ports:
      - "80:80"
    restart: unless-stopped
    volumes:
      - ./website:/usr/local/apache2/htdocs  # Mounts website files into Apache
```

3. Create folder "website"

mkdir website

4. add index.html inside "website" folder

5. index webpage code:
```
<!DOCTYPE html>
<html>
<head>
    <title>Apache Page</title>
</head>
<body>
    <h1>Hello World!</h1>
</body>
</html>

```

6. Command when done:
```
docker-compose down
docker-compose up -d --build
```

Result image:

![image](https://github.com/user-attachments/assets/b24ac64a-bb38-48fa-b6c4-b5766a6c7c5e)



