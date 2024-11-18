#!/bin/bash

# Check if the Caddyfile exists
if [ ! -f "./data/Caddyfile" ]; then
  echo "Caddyfile not found!"
  exit 1
fi

# Reload Caddy
docker compose exec caddy caddy reload --config /etc/caddy/Caddyfile

# Check if the command was successful
if [ $? -eq 0 ]; then
  echo "Caddy reloaded successfully!"
else
  echo "Failed to reload Caddy."
fi
