#!/bin/bash

# Threshold Variables (as percentages)
CPU=1       # CPU threshold
MEMORY=1    # Memory threshold
DISK=1      # Disk usage threshold

# Function to check CPU usage
check_cpu_usage() {
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    # Use bc for floating-point comparison
    if [ "$(echo "$cpu_usage > $CPU" | bc -l)" -eq 1 ]; then
        echo "High CPU usage: $cpu_usage%"
    fi
}

# Function to check Memory usage
check_memory_usage() {
    mem_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
    # Use bc for floating-point comparison
    if [ "$(echo "$mem_usage > $MEMORY" | bc -l)" -eq 1 ]; then
        echo "High MEMORY usage: $mem_usage%"
    fi
}

# Function to check Disk usage
check_disk_usage() {
    disk_usage=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
    # Disk usage is an integer, so normal comparison works
    if [ "$disk_usage" -gt "$DISK" ]; then
        echo "High DISK usage: $disk_usage%"
    fi
}

# Run checks
check_cpu_usage
check_memory_usage
check_disk_usage

