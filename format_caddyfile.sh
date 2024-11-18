#!/bin/sh

# Check if the Caddyfile exists
if [ ! -f "./data/Caddyfile" ]; then
  echo "Caddyfile not found!"
  exit 1
fi

# Format the Caddyfile using Caddy (with --overwrite flag to apply changes)
if docker compose exec caddy caddy fmt --overwrite /etc/caddy/Caddyfile; then
  echo "Caddyfile formatted successfully!"
else
  echo "Failed to format Caddyfile."
  exit 1
fi
