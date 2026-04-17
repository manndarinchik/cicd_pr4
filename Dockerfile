FROM python:3.9-alpine AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir --target=/install -r requirements.txt

FROM gcr.io/distroless/python3
WORKDIR /app
COPY --from=builder /install /app/install
COPY app.py .
ENV PYTHONPATH=/app/install
CMD ["app.py"]