#!/bin/bash

PROJECT_NAME="DemoProject"
SOURCE_DIR="/home/ubuntu/demo-project"
BACKUP_DIR="/home/ubuntu/backups"
DATE=$(date +"%Y%m%d_%H%M%S")
TODAY_PATH=$(date +%Y/%m/%d)

DEST_DIR="$BACKUP_DIR/$PROJECT_NAME/$TODAY_PATH"
mkdir -p $DEST_DIR

BACKUP_FILE="$PROJECT_NAME_$DATE.zip"

# Create backup
zip -r $DEST_DIR/$BACKUP_FILE $SOURCE_DIR > /dev/null

# Upload to Google Drive
rclone copy $DEST_DIR/$BACKUP_FILE gdrive:BackupFolder

# Delete old backups (7 days)
find $BACKUP_DIR/$PROJECT_NAME -type f -mtime +7 -delete

echo "Backup Completed: $BACKUP_FILE"
