FROM python:3.8-slim

RUN apt-get update && apt-get install -y gcc g++ && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt /app/

RUN pip install --no-cache-dir -r requirements.txt && \
    pip install --no-cache-dir --upgrade accelerate && \
    pip uninstall -y transformers accelerate && \
    pip install --no-cache-dir transformers accelerate

COPY . /app

EXPOSE 8081

CMD ["python3", "app.py"]