#!/bin/bash

# Options:
# -x: Đường dẫn tuyệt đối
# -e: Dừng nếu lệnh fail
# $? để xem kết quả lệnh trước
set -x
DISK=$(df -h / | tail -1 | awk '{print $5}')
echo "Disk: $DISK"

set -e
ls /nonexistent # Lỗi, script dừng
echo "Không chạy tới đây"

ls /nonexistent
if [ $? -ne 0 ]; then
  echo "Lệnh thất bại"
fi
