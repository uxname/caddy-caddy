# Caddy with Docker Compose

This project sets up Caddy with Docker Compose and automatic HTTPS via Let's Encrypt.

## Prerequisites

- Docker and Docker Compose

## Setup

1. Clone the repository:

    ```bash
    git clone https://github.com/uxname/caddy-caddy.git caddy
    cd caddy
    ```

2. Modify the `Caddyfile` in `./data/Caddyfile` to configure your domains and reverse proxies. (See the provided
   `Caddyfile.example` for reference.)

3. Start the services:

    ```bash
    docker-compose up -d
    ```

## Management Scripts

- **Validate Caddyfile**:

    ```bash
    ./validate_caddyfile.sh
    ```

- **Format Caddyfile**:

    ```bash
    ./format_caddyfile.sh
    ```

- **Reload Caddy**:

    ```bash
    ./reload_caddy.sh
    ```

## Stopping the Server

To stop the server:

```bash
docker-compose down
```

## Project Structure

```plaintext
.
├── data/
│   ├── Caddyfile        # Your Caddy config
│   ├── caddy_data/      # Let's Encrypt data
│   └── caddy_config/    # Caddy config files
├── docker-compose.yml   # Docker Compose config
├── format_caddyfile.sh   # Format Caddyfile
├── reload_caddy.sh       # Reload Caddy
└── validate_caddyfile.sh # Validate Caddyfile
```
