#!/bin/sh

echo "Setting up the reverse proxy..."
caddy reverse-proxy --from :11434 --to :11435