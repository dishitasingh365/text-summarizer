FROM python:3.8-slim

RUN apt-get update && apt-get install -y gcc g++ && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app

ENV PYTHONPATH="/app/src"

EXPOSE 8081

CMD ["python3", "app.py"]