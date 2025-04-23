#!/bin/bash
# Script to verify deployment

set -e

# Variables
NODE_SERVICE_URL="http://localhost:3000/health"
PYTHON_SERVICE_URL="http://localhost:8000/health"

# Function to check service health
check_service() {
  local url=$1
  echo "Checking service at $url..."
  response=$(curl -s -o /dev/null -w "%{http_code}" $url)
  if [ "$response" -eq 200 ]; then
    echo "Service at $url is healthy."
  else
    echo "Service at $url is not healthy. HTTP status: $response"
    exit 1
  fi
}

# Check Node service
check_service $NODE_SERVICE_URL

# Check Python service
check_service $PYTHON_SERVICE_URL

echo "All services are healthy!"