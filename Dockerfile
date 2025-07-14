# Use the official Tailscale image
FROM tailscale/tailscale:latest

# Add the Caddy web server to respond to Render's health checks
COPY --from=caddy:2 /usr/bin/caddy /usr/bin/caddy

# Copy our startup script into the container
COPY start.sh .
RUN chmod +x ./start.sh

# Command to run when the container starts
CMD ["./start.sh"]
