#!/usr/bin/env bash

# Name of your n8n container (change if different)
CONTAINER_NAME="n8n"

# Export all workflows
docker exec -it $CONTAINER_NAME n8n export:workflow --all --output=/home/node/workflows.json

# Export all credentials
docker exec -it $CONTAINER_NAME n8n export:credentials --all --output=/home/node/credentials.json

# Copy them to current directory
docker cp $CONTAINER_NAME:/home/node/workflows.json ./workflows.json
docker cp $CONTAINER_NAME:/home/node/credentials.json ./credentials.json

