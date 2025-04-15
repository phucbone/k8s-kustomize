#!/bin/bash

LOG_FILE="system_log.txt"

if [ -f "$LOG_FILE" ]; then
  echo "Phân tích $LOG_FILE..."
  while read LINE; do
    if echo "$LINE" | grep -q "Cảnh báo"; then
      echo "Tìm thấy lỗi: $LINE"
    fi
  done <"$LOG_FILE"
else
  echo "Không tìm thấy $LOG_FILE"
fi
