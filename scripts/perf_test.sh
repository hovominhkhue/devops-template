#!/bin/bash
# Script to run performance tests

set -e

# Variables
NODE_SERVICE_URL="http://localhost:3000"
PYTHON_SERVICE_URL="http://localhost:8000"
DURATION="30s"
CONCURRENT_USERS=10

# Function to run performance test
run_perf_test() {
  local url=$1
  local service_name=$2
  echo "Running performance test for $service_name at $url..."
  if command -v hey &> /dev/null; then
    hey -z $DURATION -c $CONCURRENT_USERS $url
  else
    echo "Error: 'hey' tool is not installed. Please install it to run performance tests."
    exit 1
  fi
}

# Run performance tests
run_perf_test $NODE_SERVICE_URL "Node Service"
run_perf_test $PYTHON_SERVICE_URL "Python Service"

echo "Performance tests completed!"