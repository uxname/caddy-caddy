#!/bin/sh

# Check if the Caddyfile exists
if [ ! -f "./data/Caddyfile" ]; then
  echo "Caddyfile not found!"
  exit 1
fi

# Reload Caddy
if docker compose exec caddy caddy reload --config /etc/caddy/Caddyfile; then
  echo "Caddy reloaded successfully!"
else
  echo "Failed to reload Caddy."
  exit 1
fi
