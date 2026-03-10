#!/bin/bash

LOG_DIR="/var/log/nodeapp"
BACKUP_DIR="/var/log/nodeapp/backups"

mkdir -p $BACKUP_DIR

tar -czf $BACKUP_DIR/logs_$(date +%F).tar.gz -C $LOG_DIR .

# Optionally, remove old logs after backup
# find $LOG_DIR -name "*.log" -mtime +7 -delete  # remove logs older than 7 days

# Or clear the log files instead of deleting
> $LOG_DIR/application.log  # assuming the log file name