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

# Validate the Caddyfile configuration
if docker compose exec caddy caddy validate --config "/etc/caddy/Caddyfile"; then
  echo "Caddyfile is valid!"
else
  echo "Error: Caddyfile is invalid."
  exit 1
fi
