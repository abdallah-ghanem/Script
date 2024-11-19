#!/bin/bash

# Variables
LOG_DIR="/home/abdallah/app"
MAX_LOG_SIZE=50 #5 MB
MAX_LOG_AGE=30 #30 Days

# Functions to rotate logs
rotate_logs(){
	for log_file in "$LOG_DIR"/*.log;
	do
		if [ $(stat -c%s "$log_file") -gt  $MAX_LOG_SIZE ];
		then
			mv "$log_file" "$log_file.$(date +'%Y%m%d')"
			gzip  "$log_file.$(date +'%Y%m%d')"
			echo "Log rotated: $log_file"
		fi
	done
}

# Functions clean up old logs
clean_old_logs(){
	find "LOG_DIR" -name "*.gz" -mtime +$MAX_LOG_AGE -exec rm {} \;
	echo "Old logs clean up"
}

# Run the functions
rotate_logs
clean_old_logs
