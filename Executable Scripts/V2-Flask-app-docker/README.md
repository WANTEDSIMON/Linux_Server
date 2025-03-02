
# Usin docker localy with (flask)

1. First install docker
Installed from: https://www.docker.com/


2. Change the **app.py** `if __name__ == '__main__': app.run(debug=True)` to:
```py
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
```

3. Add requirements.txt include "flask":
```PowerShell
"flask" | Out-File -FilePath requirements.txt
```

4. Create dockerfile
```PowerShell
New-Item -ItemType File -Path Dockerfile
```

5. Edit the dockerfile to include
```dockerfile
FROM python:3.9

WORKDIR /app

COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r /app/requirements.txt

EXPOSE 5000

CMD ["python", "app.py"]
```

6. Run the Docker:
```sh
docker build -t flask-app .
```
7. Run the Flask app in a container:
```sh
docker run -d -p 5000:5000 --name flask_container flask-app
```

Img of the result:

![New Endpoint](img_readme/img_docker_first-run.png)
