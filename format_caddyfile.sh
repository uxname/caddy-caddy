#!/bin/bash

# Ensure the script exits immediately if a command fails or an undefined variable is used
set -euo pipefail

# Path to the Caddyfile
CADDYFILE="./data/Caddyfile"

# Check if the Caddyfile exists
if [[ ! -f "$CADDYFILE" ]]; then
  echo "Error: Caddyfile not found at $CADDYFILE"
  exit 1
fi

# Format the Caddyfile using Caddy inside a Docker container
if docker compose exec caddy caddy fmt --overwrite "/etc/caddy/Caddyfile"; then
  echo "Caddyfile formatted successfully!"
else
  echo "Error: Failed to format Caddyfile."
  exit 1
fi
