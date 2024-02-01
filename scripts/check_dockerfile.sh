#!/bin/bash

# Pre-commit hook to check Dockerfile base images

# Function to check Dockerfile
check_dockerfile() {
    # Check if the file is a Dockerfile
    if [[ $1 == *"Dockerfile"* ]]; then
        # Look for the base image in the FROM instruction
        base_image=$(grep '^FROM' "$1" | awk '{print $2}')

        # Check if the base image is from cgr.dev/chianguard
        if [[ $base_image != cgr.dev/chianguard* ]]; then
            echo "Error: Base image in $1 is not from cgr.dev/chianguard"
            return 1
        fi
    fi
    return 0
}

# Export the function to be used in the find command
export -f check_dockerfile

# Find all Dockerfiles and check them
if find . -type f -exec bash -c 'check_dockerfile "$0"' {} \; | grep -q 'Error'; then
    echo "Commit failed due to non-compliant Dockerfile(s)."
    exit 1
fi

# If all checks pass
echo "All Dockerfiles are compliant."
exit 0
