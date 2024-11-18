#!/bin/sh

# Check if the Caddyfile exists
if [ ! -f "./data/Caddyfile" ]; then
  echo "Caddyfile not found!"
  exit 1
fi

# Validate the Caddyfile configuration
if docker compose exec caddy caddy validate --config /etc/caddy/Caddyfile; then
  echo "Caddyfile is valid!"
else
  echo "Caddyfile is invalid."
  exit 1
fi
