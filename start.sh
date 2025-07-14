#!/bin/sh

# Start the tailscale daemon in the background
tailscaled &

# Connect to your network using the auth key and advertise as an exit node
tailscale up --authkey=${TAILSCALE_AUTHKEY} --hostname=render-free-vpn --advertise-exit-node &

# Start a minimal web server using nc to respond to Render's health checks
while true; do echo -e 'HTTP/1.1 200 OK\n\nOK' | nc -l -p ${PORT} -w 1; done
