# Docker Project: Disk Space Alert

This project contains a Dockerfile that packages a custom Bash script (`disk-space-alert.sh`) into a lightweight Ubuntu container.

## Purpose
The container runs the script automatically upon startup, checking the disk space of the container's root partition and alerting if it exceeds a defined threshold (80%).

## How to build and run

```bash
# Build the Docker image
docker build -t mon-alerte-disque .

# Run the container
docker run mon-alerte-disque
