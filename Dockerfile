FROM python:3.11-slim

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# curl -> talk to Vault's HTTP API from the entrypoint (mounted in at runtime)
# netcat -> wait for postgres to be reachable before running migrations
# hadolint ignore=DL3008
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt gunicorn

COPY . .

EXPOSE 5000
