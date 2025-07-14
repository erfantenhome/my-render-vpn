# Use the official Tailscale image
FROM tailscale/tailscale:latest

# Copy our startup script into the container
COPY start.sh .
RUN chmod +x ./start.sh

# Command to run when the container starts
CMD ["./start.sh"]
