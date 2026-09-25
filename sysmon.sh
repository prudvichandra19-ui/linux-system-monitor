#!/usr/bin/env bash

THRESHOLD=85

clear
echo "=============================================="
echo "           LINUX SYSTEM HEALTH MONITOR        "
echo "=============================================="
echo "Hostname : $(hostname)"
echo "Uptime   : $(uptime -p)"
echo "Date     : $(date '+%Y-%m-%d %H:%M:%S')"
echo "----------------------------------------------"

# 1. Memory Usage
echo -e "\n[+] Memory Usage (RAM):"
free -h | awk 'NR==1{printf "%-10s %-10s %-10s\n", $1, $2, $3} NR==2{printf "%-10s %-10s %-10s\n", "RAM:", $2, $3}'

# 2. Disk Usage on Root Partition (/)
echo -e "\n[+] Disk Storage (/):"
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
echo "Root Partition Usage: ${DISK_USAGE}%"

if [ "$DISK_USAGE" -gt "$THRESHOLD" ]; then
    echo "⚠️  WARNING: Disk usage is above ${THRESHOLD}%!"
fi

# 3. Top 3 CPU Consuming Processes
echo -e "\n[+] Top 3 Processes by CPU Usage:"
echo "PID    USER       %CPU  COMMAND"
ps -eo pid,user,%cpu,comm --sort=-%cpu | head -n 4 | tail -n 3

echo -e "\n=============================================="
