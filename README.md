# integrate-mattermost-with-grafana

To integrate Mattermost service with Grafana in order to visualize set panels based on Prometheus scraping.

# Mattermost + Monitoring Stack

This project integrates [Mattermost](https://mattermost.com/) with a complete observability stack using Docker Compose. It includes:

- **Mattermost** for team communication
- **PostgreSQL** and **Redis** as Mattermost dependencies
- **Grafana** for dashboards
- **Prometheus** for metrics collection
- **Postgres Exporter** and **Redis Exporter** for exposing metrics

## Stack Overview

| Component         | Purpose                              |
| ----------------- | ------------------------------------ |
| Mattermost        | Self-hosted collaboration platform   |
| PostgreSQL        | Primary database for Mattermost      |
| Redis             | Caching and message brokering        |
| Prometheus        | Monitoring system and time series DB |
| Grafana           | Visualization and dashboarding       |
| Redis Exporter    | Export Redis metrics to Prometheus   |
| Postgres Exporter | Export PostgreSQL metrics            |

## Docker Compose Version Compatibility

> **Note:**  
> The installed Docker Compose version on this environment is `1.25.0`.  
> Because of this, the `docker-compose.yml` file uses version **'3'** instead of newer Compose specs like `'3.8'` or `'3.9'`.  
> This ensures compatibility with older Docker Compose releases that do **not support top-level `networks:` or `volumes:` keys in the same way** as newer versions.

If you're using a newer version of Docker Compose (e.g., v2+), you can consider upgrading the file format to take advantage of newer features.

## Setup Instructions

Clone the repository

```bash
git clone
cd mattermost-monitoring

Create a .env at the root of project

Deploy stack with
- chmod +x deploy.sh
- ./deploy.sh

Access the services:
 Mattermost: http://localhost:8065
 Grafana: http://localhost:3000
 Prometheus: http://localhost:9090



Happy Monitoring.......
```

# services:

# # Mattermost dependencies

# postgres:

# image: postgres:16-alpine

# restart: unless-stopped

# environment:

# POSTGRES_USER: ${PG_USER}

# POSTGRES_PASSWORD: ${PG_PASS}

# POSTGRES_DB: ${PG_DB}

# volumes:

# - mattermost-db:/var/lib/postgresql/data

# networks:

# - monitoring_net

# redis:

# image: redis:alpine

# restart: unless-stopped

# networks:

# - monitoring_net

# mattermost:

# image: mattermost/mattermost-team-edition:latest

# container_name: mattermost

# restart: unless-stopped

# environment:

# MM_SQLSETTINGS_DRIVERNAME: postgres

# MM_SQLSETTINGS_DATASOURCE: postgres://${PG_USER}:${PG_PASS}@postgres:5432/${PG_DB}?sslmode=disable

# MM_BLEVESETTINGS_INDEXDIR: /mattermost/data/bleve-indexes

# MM_FILESETTINGS_DIRECTORY: /mattermost/data

# MM_LOGSETTINGS_ENABLEPROMETHEUS: true

# ports:

# - "8065:8065"

# - "8067:8067" # Prometheus metrics

# volumes:

# - mattermost-data:/mattermost/data

# depends_on:

# - postgres

# - redis

# networks:

# - monitoring_net

# # Monitoring

# prometheus:

# image: prom/prometheus

# container_name: prometheus

# volumes:

# - ./prometheus/prometheus.yml:/etc/prometheus/prometheus.yml

# ports:

# - "9090:9090"

# networks:

# - monitoring_net

# grafana:

# image: grafana/grafana

# container_name: grafana

# ports:

# - "3000:3000"

# volumes:

# - grafana-storage:/var/lib/grafana

# - ./grafana/provisioning/dashboards:/etc/grafana/provisioning/dashboards

# - ./grafana/provisioning/datasources:/etc/grafana/provisioning/datasources

# - ./grafana/provisioning/mattermost.yaml:/etc/grafana/provisioning/dashboards/mattermost.yaml

# environment:

# GF_SECURITY_ADMIN_USER: ${GF_USER}

# GF_SECURITY_ADMIN_PASSWORD: ${GF_PASS}

# networks:

# - monitoring_net

# redis-exporter:

# image: oliver006/redis_exporter

# ports:

# - "9121:9121"

# networks:

# - monitoring_net

# postgres-exporter:

# image: quay.io/prometheuscommunity/postgres-exporter

# environment:

# DATA_SOURCE_NAME: postgres://${PG_USER}:${PG_PASS}@postgres:5432/${PG_DB}?sslmode=disable

# ports:

# - "9187:9187"

# networks:

# - monitoring_net

# volumes:

# mattermost-db:

# mattermost-data:

# grafana-storage:

# networks:

# monitoring_net:

# driver: bridge

# version: "3.9"

# services:

# # === Database Services ===

# postgres:

# image: postgres:16-alpine

# restart: unless-stopped

# environment:

# POSTGRES_USER: ${PG_USER}

# POSTGRES_PASSWORD: ${PG_PASS}

# POSTGRES_DB: ${PG_DB}

# volumes:

# - mattermost-db:/var/lib/postgresql/data

# networks:

# - default

# - monitoring_net

# redis:

# image: redis:alpine

# restart: unless-stopped

# networks:

# - default

# - monitoring_net

# # === Mattermost App ===

# mattermost:

# image: mattermost/mattermost-team-edition:latest

# container_name: mattermost

# restart: unless-stopped

# environment:

# MM_SQLSETTINGS_DRIVERNAME: postgres

# MM_SQLSETTINGS_DATASOURCE: postgres://${PG_USER}:${PG_PASS}@postgres:5432/${PG_DB}?sslmode=disable

# MM_BLEVESETTINGS_INDEXDIR: /mattermost/data/bleve-indexes

# MM_FILESETTINGS_DIRECTORY: /mattermost/data

# MM_LOGSETTINGS_ENABLEPROMETHEUS: true

# ports:

# - "8065:8065"

# - "8067:8067" # Prometheus metrics

# volumes:

# - mattermost-data:/mattermost/data

# depends_on:

# - postgres

# - redis

# networks:

# - default

# - monitoring_net

# # === Monitoring Tools ===

# prometheus:

# image: prom/prometheus

# container_name: prometheus

# volumes:

# - ./prometheus/prometheus.yml:/etc/prometheus/prometheus.yml

# ports:

# - "9090:9090"

# networks:

# - monitoring_net

# grafana:

# image: grafana/grafana

# container_name: grafana

# ports:

# - "3000:3000"

# volumes:

# - grafana-storage:/var/lib/grafana

# - ./grafana/provisioning/dashboards:/etc/grafana/provisioning/dashboards

# - ./grafana/provisioning/datasources:/etc/grafana/provisioning/datasources

# - ./grafana/provisioning/mattermost.yaml:/etc/grafana/provisioning/dashboards/mattermost.yaml

# environment:

# GF_SECURITY_ADMIN_USER: ${GF_USER}

# GF_SECURITY_ADMIN_PASSWORD: ${GF_PASS}

# networks:

# - monitoring_net

# redis-exporter:

# image: oliver006/redis_exporter

# ports:

# - "9121:9121"

# networks:

# - monitoring_net

# postgres-exporter:

# image: quay.io/prometheuscommunity/postgres-exporter

# environment:

# DATA_SOURCE_NAME: postgres://${PG_USER}:${PG_PASS}@postgres:5432/${PG_DB}?sslmode=disable

# ports:

# - "9187:9187"

# networks:

# - monitoring_net

# volumes:

# mattermost-db:

# mattermost-data:

# grafana-storage:

# networks:

# monitoring_net:

# external: true
