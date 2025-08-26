# n8n-queue-workflows

IMPORT/EXPORT
docker exec -it n8n sh
# Export all workflows
n8n export:workflow --all --output=/home/node/.n8n/workflows.json
# Export all credentials
n8n export:credentials --all --output=/home/node/.n8n/credentials.json
$ Copy
docker cp n8n:/home/node/.n8n/workflows.json ./workflows.json
docker cp n8n:/home/node/.n8n/credentials.json ./credentials.json
# Import
docker exec -it n8n sh -c "n8n import:workflow --input=/home/node/.n8n/workflows.json"
docker exec -it n8n sh -c "n8n import:credentials --input=/home/node/.n8n/credentials.json"

RUN
docker compose up -d --scale n8n-worker=3

OLD compose
services:
  n8n:
    image: n8nio/n8n:latest
    container_name: n8n
    restart: unless-stopped
    ports:
      - "5678:5678"
    environment:
      TZ: Europe/Zagreb
      N8N_BASIC_AUTH_ACTIVE: "true"
      N8N_BASIC_AUTH_USER: igor
      N8N_BASIC_AUTH_PASSWORD: changeme
      N8N_ENCRYPTION_KEY: 8f3b2f1d6a0b4f37e3b6a7c9b1f2d3e48c0a9b6d1c3e5f7a9d2c4e6f8a0b2c3  # use your own!
      N8N_SECURE_COOKIE: "false"
      N8N_HOST: 49.13.225.178
      N8N_PROTOCOL: http
      WEBHOOK_URL: http://49.13.225.178:5678/
    volumes:
      - n8n_data:/home/node/.n8n

volumes:
  n8n_data: {}
