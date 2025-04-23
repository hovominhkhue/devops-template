#!/bin/bash
# Script to initialize project

set -e

echo "Initializing project setup..."

# Install dependencies
echo "Installing dependencies..."
if [ -f "package.json" ]; then
  npm install
fi

if [ -f "requirements.txt" ]; then
  pip install -r requirements.txt
fi

# Set up Terraform
echo "Initializing Terraform..."
if [ -d "terraform" ]; then
  cd terraform
  terraform init
  cd ..
fi

# Set up Docker
echo "Building Docker images..."
if [ -f "docker-compose.yml" ]; then
  docker-compose build
fi

echo "Project setup complete!"