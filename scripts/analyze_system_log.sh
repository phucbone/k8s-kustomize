#!/bin/bash

LOG_FILE="system_log.txt"

# Kiểm tra file
if [ ! -f "$LOG_FILE" ]; then
  echo "Không tìm thấy $LOG_FILE"
  exit 1
fi

# Grep: Tìm lỗi
echo "Các lỗi trong log:"
grep "ERROR" "$LOG_FILE"

# Awk: Trích xuất % usage
echo "Danh sách usage:"
awk '/usage/ {print $5}' "$LOG_FILE"

# Sed: Thay ERROR thành WARNING
echo "Chuyển ERROR thành WARNING:"
sed 's/ERROR/WARNING/' "$LOG_FILE"

# Ghi log đã xử lý
sed 's/ERROR/WARNING/' "$LOG_FILE" >"processed_log.txt"
echo "Log đã xử lý lưu vào processed_log.txt"
