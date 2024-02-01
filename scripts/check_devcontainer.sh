#!/bin/bash

# Pre-commit hook to check for the existence of devcontainer.json and issue a warning in yellow if it's missing

# Path to the devcontainer.json file
# Update this if your devcontainer.json is in a specific directory
DEVCONTAINER_PATH="./devcontainer.json"

# ANSI color codes
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if devcontainer.json exists
if [ ! -f "$DEVCONTAINER_PATH" ]; then
    echo -e "${YELLOW}WARNING: devcontainer.json is missing.${NC}"
    echo "It's recommended to add a devcontainer.json file."
else
    echo "devcontainer.json found."
fi

# The script will always exit successfully, even if devcontainer.json is missing
exit 0
