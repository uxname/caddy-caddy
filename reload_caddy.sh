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
readonly CADDYFILE_PATH="./data/Caddyfile"
readonly CADDY_CONFIG_PATH="/etc/caddy/Caddyfile"

# Validate Caddyfile existence
validate_caddyfile_exists() {
   if [[ ! -f "$CADDYFILE_PATH" ]]; then
       log_error "Caddyfile not found at ${CADDYFILE_PATH}"
       exit 1
   fi
}

# Reload Caddy configuration
reload_caddy_configuration() {
   if docker compose exec caddy caddy reload --config "$CADDY_CONFIG_PATH"; then
       log_info "Caddy configuration reloaded successfully"
   else
       log_error "Failed to reload Caddy configuration"
       exit 1
   fi
}

# Main script execution
main() {
   validate_caddyfile_exists
   reload_caddy_configuration
}

# Run the main script
main "$@"