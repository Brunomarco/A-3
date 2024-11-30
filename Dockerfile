FROM python:3.9 AS development
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .

FROM python:3.9-slim AS production
WORKDIR /app
COPY --from=development /app /app
COPY --from=development /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages
CMD ["python", "app.py"]
