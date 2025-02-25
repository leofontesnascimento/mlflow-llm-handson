FROM python:3.9-slim

RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt
# RUN pip install mlflow transformers sentence-transformers

COPY . /app
WORKDIR /app

CMD ["mlflow", "server", "--host", "0.0.0.0"]