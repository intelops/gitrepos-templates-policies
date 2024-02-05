#!/bin/bash

# Pre-commit hook to check Dockerfile base images

# Function to check Dockerfile
check_dockerfile() {
    # Check if the file is a Dockerfile
    if [[ $1 == *"Dockerfile"* ]]; then
        echo "Checking $1..." # Debug line to see which file is being checked
        # Look for the base image in the FROM instruction
        base_image=$(grep '^FROM' "$1" | awk '{print $2}')
        echo "Found base image: $base_image" # Debug line to see the found base image

        # Check if the base image is from cgr.dev/chainguard
        if [[ $base_image != cgr.dev/chainguard* ]]; then
            echo "Error: Base image in $1 is not from cgr.dev/chainguard"
            return 1
        fi
    fi
    return 0 # Explicitly return success
}

# Export the function to be used in the find command
export -f check_dockerfile

# Initialize a flag to indicate error
error_found=false

# Find all Dockerfiles and check them
find . -type f -exec bash -c 'check_dockerfile "$0"' {} \; | while read line; do
    echo "$line"
    if [[ "$line" == *"Error:"* ]]; then
        error_found=true
    fi
done

if [ "$error_found" = true ]; then
    echo "Commit failed due to non-compliant Dockerfile(s)."
    exit 1
else
    echo "All Dockerfiles are compliant."
fi
