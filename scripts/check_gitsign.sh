#!/bin/bash

# Pre-commit hook to check if the latest commit is signed using gitsign

# Get the hash of the latest commit
latest_commit=$(git rev-parse HEAD)

# Check if the latest commit is signed
signed_commit=$(git verify-commit $latest_commit 2>&1)

# Check for a valid signature
if [[ $signed_commit == *"Validated Git signature: true"* ]]; then
    echo "Latest commit is signed with gitsign."
else
    echo "WARNING: The latest commit is not signed with gitsign."
    # Optionally, you can uncomment the next line to block the commit
    # exit 1
fi

exit 0
