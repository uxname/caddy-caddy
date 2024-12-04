#!/bin/bash

# Exit immediately if a command fails, an undefined variable is used, or a pipe fails
set -euo pipefail

# Define the path to the Caddyfile
CADDYFILE="./data/Caddyfile"

# Check if the Caddyfile exists
if [[ ! -f "$CADDYFILE" ]]; then
  echo "Error: Caddyfile not found at $CADDYFILE"
  exit 1
fi

# Reload Caddy using the specified configuration
if docker compose exec caddy caddy reload --config "/etc/caddy/Caddyfile"; then
  echo "Caddy reloaded successfully!"
else
  echo "Error: Failed to reload Caddy."
  exit 1
fi
