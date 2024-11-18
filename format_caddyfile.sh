#!/bin/bash

# Check if the Caddyfile exists
if [ ! -f "./data/Caddyfile" ]; then
  echo "Caddyfile not found!"
  exit 1
fi

# Format the Caddyfile using Caddy (with --overwrite flag to apply changes)
docker compose exec caddy caddy fmt --overwrite /etc/caddy/Caddyfile

# Check if the command was successful
if [ $? -eq 0 ]; then
  echo "Caddyfile formatted successfully!"
else
  echo "Failed to format Caddyfile."
fi
