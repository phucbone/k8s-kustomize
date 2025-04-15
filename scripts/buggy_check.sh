#!/bin/bash

# Thiếu $ trước biến
DISK_USAGE=df -h / | tail -1 | awk '{print $5}'
if [ DISK_USAGE -gt 80 ]; then # Sai cú pháp
  echo "Disk cao: $DISK_USAGE"
else
  echo "Disk OK: $DISK_USAGE"
fi

# Lệnh lỗi không xử lý
cat /nonexistent/log
echo "Tiếp tục chạy" # Không nên chạy
