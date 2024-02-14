#!/bin/bash

# Path to the Dockerfile
DOCKERFILE_PATH="./Dockerfile"

# Check for the existence of the Dockerfile
if [ ! -f "$DOCKERFILE_PATH" ]; then
    echo "Error: Dockerfile does not exist in the project."
    exit 1
fi

# Count the number of FROM instructions in the Dockerfile
from_count=$(grep -c '^FROM ' "$DOCKERFILE_PATH")

# Check if the Dockerfile is multi-stage
if [ "$from_count" -lt 2 ]; then
    echo "Error: Dockerfile is not a multi-stage Dockerfile."
    exit 1
fi

echo "Dockerfile exists and is a multi-stage Dockerfile."
exit 0
