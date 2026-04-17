FROM gcr.io/distroless/python3
WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py app.py

EXPOSE 5000
CMD ["python", "app.py"]
