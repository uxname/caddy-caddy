#!/usr/bin/env bash

# Strict error handling and safety
set -euo pipefail

# Logging utility function
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

# Validate Caddyfile configuration using Docker Compose
validate_caddy_configuration() {
    if ! docker compose exec caddy caddy validate --config "$CADDY_CONFIG_PATH"; then
        log_error "Invalid Caddyfile configuration"
        exit 1
    fi
    log_info "Caddyfile configuration is valid"
}

# Main script execution
main() {
    validate_caddyfile_exists
    validate_caddy_configuration
}

# Run the main script
main "$@"