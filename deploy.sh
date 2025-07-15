#!/bin/bash
set -e

# Define variables
COMPOSE_FILE="docker-compose.yml"
NETWORK_NAME="monitoring_net"

echo " Checking Docker network: $NETWORK_NAME..."
docker network inspect "$NETWORK_NAME" >/dev/null 2>&1 || docker network create "$NETWORK_NAME"

echo " Starting unified Mattermost + Monitoring stack..."
docker compose -f "$COMPOSE_FILE" up -d --build

echo " All services launched successfully and are running in background containers."
