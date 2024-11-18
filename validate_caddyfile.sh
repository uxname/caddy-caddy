#!/bin/bash

# Check if the Caddyfile exists
if [ ! -f "./data/Caddyfile" ]; then
  echo "Caddyfile not found!"
  exit 1
fi

# Validate the Caddyfile configuration
docker compose exec caddy caddy validate --config /etc/caddy/Caddyfile

# Check if the command was successful
if [ $? -eq 0 ]; then
  echo "Caddyfile is valid!"
else
  echo "Caddyfile is invalid."
fi
