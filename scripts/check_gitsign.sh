#!/bin/bash

# Pre-commit hook to check if last commit was signed using gitsign and contains a valid tlog index

# Get the hash of the latest commit
latest_commit=$(git rev-parse HEAD)

# Check if the latest commit is signed and contains a valid tlog index
if [[ $(git verify-commit $latest_commit 2>&1) == *"Validated Git signature: true"* && $(git verify-commit $latest_commit 2>&1) == *"tlog index: "*[0-9]* ]]; then
    echo "Latest commit is signed with gitsign and contains a valid tlog index."
    exit 0
else
    echo "WARNING: The latest commit is either not signed with gitsign or does not contain a valid tlog index."
    exit 1
fi

exit 0