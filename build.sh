#!/bin/bash
# Build helper script - ensures asset directory exists before building

# Create asset directory if it doesn't exist
if [ ! -d "asset" ]; then
    echo "Creating asset/ directory..."
    mkdir -p asset
    echo "Note: asset/ directory created but is empty. Add your SVG files to asset/ before building."
fi

# Build Docker image
docker compose up -d --build
