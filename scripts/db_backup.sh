#!/bin/bash
# Script to backup DB

set -e

# Variables
BACKUP_DIR="./backups"
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
DB_NAME="your_database_name"
DB_USER="your_database_user"
DB_HOST="localhost"
DB_PORT="5432"
BACKUP_FILE="$BACKUP_DIR/${DB_NAME}_backup_$TIMESTAMP.sql"

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Perform the database backup
echo "Starting database backup..."
pg_dump -h $DB_HOST -p $DB_PORT -U $DB_USER $DB_NAME > $BACKUP_FILE

if [ $? -eq 0 ]; then
  echo "Database backup completed successfully: $BACKUP_FILE"
else
  echo "Database backup failed!"
  exit 1
fi