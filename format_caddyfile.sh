#!/usr/bin/env bash

# Strict error handling and safety
set -euo pipefail

# Logging utility functions
log_error() {
   echo "[ERROR] $*" >&2
}

log_info() {
   echo "[INFO] $*"
}

# Configuration constants
readonly CADDYFILE_LOCAL_PATH="./data/Caddyfile"
readonly CADDYFILE_CONTAINER_PATH="/etc/caddy/Caddyfile"

# Validate local Caddyfile existence
validate_caddyfile_exists() {
   if [[ ! -f "$CADDYFILE_LOCAL_PATH" ]]; then
       log_error "Caddyfile not found at ${CADDYFILE_LOCAL_PATH}"
       exit 1
   fi
}

# Format Caddyfile configuration
format_caddyfile() {
   if docker compose exec caddy caddy fmt --overwrite "$CADDYFILE_CONTAINER_PATH"; then
       log_info "Caddyfile formatted successfully"
   else
       log_error "Failed to format Caddyfile"
       exit 1
   fi
}

# Main script execution
main() {
   validate_caddyfile_exists
   format_caddyfile
}

# Run the main script
main "$@"