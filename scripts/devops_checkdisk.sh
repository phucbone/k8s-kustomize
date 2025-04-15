#!/bin/bash

DISK=$(df -h / | tail -1 | awk '{print $5}' | cut -d'%' -f1)
if [ $DISK -lt 90 ]; then
  echo "Disk đủ chỗ, bắt đầu deploy..."
else
  echo "Disk gần đầy, hoãn deploy!"
  exit 1
fi
