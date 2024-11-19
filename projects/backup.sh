#!/bin/bash

# Variables

SOURCE_DIR="/home/abdallah/backup"
LOG_FILE="backup.log"
REMOTE_HOST="home@172.21.90.191"
REMOTE_DIR="/home/"

# Functions

perform_backup(){
	rsync -avz "$SOURCE_DIR" "$REMOTE_HOST":"$REMOTE_DIR" > "$LOG_FILE" 2>&1
	if [ $? -eq 0 ];
	then
		echo "BackUp Successful: $(date)" >> "$LOG_FILE"
	else
		echo "BackUp Fail: $(date)" >> "$LOG_FILE"
	fi
}

# Run the backup 
perform_backup
