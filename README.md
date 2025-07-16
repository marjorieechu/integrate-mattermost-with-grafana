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
