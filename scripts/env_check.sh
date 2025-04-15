#!/bin/bash

# Biến global
LOG_DIR="/var/log/myapp"
export LOG_DIR

# Hàm kiểm tra disk
check_disk() {
  local DISK=$(df -h "$1" | tail -1 | awk '{print $5}' | cut -d'%' -f1)
  if [ "$DISK" -gt "${DISK_THRESHOLD:-80}" ]; then
    echo "Cảnh báo: Disk $1 vượt $DISK% (ngưỡng ${DISK_THRESHOLD:-80}%)"
  else
    echo "Disk $1 ổn: $DISK%"
  fi
}

# Hàm ghi log
log_status() {
  local MESSAGE="$1"
  if [ -d "$LOG_DIR" ]; then
    echo "$(date): $MESSAGE" >>"$LOG_DIR/status.log"
  else
    echo "Lỗi: $LOG_DIR không tồn tại" >&2
    exit 1
  fi
}

# Gọi hàm
check_disk "/"
log_status "Kiểm tra disk hoàn tất"

# Dùng biến môi trường từ pipeline (nếu có)
if [ -n "$CI_JOB_ID" ]; then
  echo "Chạy trong CI, job ID: $CI_JOB_ID"
fi
