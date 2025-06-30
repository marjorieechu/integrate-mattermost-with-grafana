#!/bin/bash
set -e

# Define paths (edit if needed)
MM_STACK="mattermost-stack/docker-compose.mattermost.yml"
MON_STACK="monitoring-stack/docker-compose.monitoring.yml"
NETWORK_NAME="monitoring_net"

echo "🔧 Checking Docker network: $NETWORK_NAME..."
docker network inspect "$NETWORK_NAME" >/dev/null 2>&1 || docker network create "$NETWORK_NAME"

echo "🚀 Starting Mattermost stack..."
docker compose -f "$MM_STACK" up -d --build

echo "📊 Starting Monitoring stack..."
docker compose -f "$MON_STACK" up -d --build

echo "✅ All services launched successfully and are running in background containers."
