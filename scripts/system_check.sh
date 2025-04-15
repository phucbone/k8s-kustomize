#!/bin/bash

# Hàm kiểm tra disk
check_disk() {
  echo "Debug: Checking $1" >&2
  local DISK=$(df -h "$1" | tail -1 | awk '{print $5}' | cut -d'%' -f1)
  echo "Debug: DISK=$DISK" >&2
  if [ $DISK -gt 80 ]; then
    echo "Cảnh báo: Disk $1 vượt $DISK% (ngưỡng 80%)"
  else
    echo "Disk $1 ổn: $DISK%"
  fi
}



# Hàm kiểm tra CPU
check_cpu() {
  local CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}')
  if [ $(echo "$CPU > $1" | bc) -eq 1 ]; then
    echo "Cảnh báo: CPU vượt $CPU% (ngưỡng $1%)"
  else
    echo "CPU ổn: $CPU%"
  fi
}

# Hàm ghi log
log_result() {
  local TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
  echo "[$TIMESTAMP] $1" >>"system_log.txt"
}

# Gọi hàm
check_disk "/"
check_cpu 90
log_result "Kiểm tra hoàn tất trên $(hostname)"
