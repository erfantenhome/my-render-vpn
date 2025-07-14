#!/bin/sh

# Start the tailscale daemon in the background
tailscaled &

# Connect to your network using the auth key and advertise as an exit node
tailscale up --authkey=${TAILSCALE_AUTHKEY} --hostname=render-free-vpn --advertise-exit-node &

# Start a minimal web server that just responds "OK" on the port Render provides
caddy respond --listen :${PORT} "OK"
