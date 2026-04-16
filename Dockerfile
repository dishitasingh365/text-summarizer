FROM python:3.8-slim

WORKDIR /app

COPY requirements.txt /app/

RUN pip install --no-cache-dir -r requirements.txt && \
    pip install --no-cache-dir --upgrade accelerate && \
    pip uninstall -y transformers accelerate && \
    pip install --no-cache-dir transformers accelerate

COPY . /app

EXPOSE 8081

CMD ["python3", "app.py"]