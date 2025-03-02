FROM python:3.9

WORKDIR /app

COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r /app/requirements.txt

EXPOSE 5000

CMD ["python", "app.py"]