#!/bin/bash

# Biến lưu thông tin
HOST=$(hostname)
DISK=$(df -h / | tail -1 | awk '{print $5}' | cut -d'%' -f1)
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}') # Lấy % CPU

# In kết quả
echo "Hostname: $HOST"

# Disk
if [ $DISK -gt 80 ]; then
  echo "Warning: Disk usage > 80% ($DISK%)"
else
  echo "Disk OK: $DISK%"
fi

# echo "Disk usage: $DISK"
echo "CPU usage: $CPU%"
# DISK=$(df -h / | tail -1 | awk '{print $5}' | cut -d'%' -f1)
# echo "Disk usage: $DISK%"
