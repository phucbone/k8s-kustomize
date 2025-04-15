#!/bin/bash

#---> Grep Bash: Lọc Dữ Liệu
# Tùy chọn hữu ích:
# -i: Không phân biệt hoa thường.
# -n: Hiển thị số dòng.
# -v: Loại bỏ dòng khớp.

## Grep tìm kiếm text theo pattern.
# Tìm chuỗi
echo "Error: Disk full" | grep "Error"

# Lọc file
grep "500" /var/log/nginx/access.log

#---> Awk Bash: Trích Xuất và Xử Lý
##  Awk chia text thành cột, trích xuất dữ liệu.
# Trích cột
echo "user1 10.0.0.1 login" | awk '{print $2}'

# Kết hợp điều kiện
awk '$1 > 50 {print "High: " $0}' <<<"60% disk"

# Xử lý file
awk '{print $5}' /proc/meminfo

#---> Sed Bash: Sửa Text
# Options:
# -i: Ghi đè file.

## Sed thay thế, xóa, hoặc chỉnh sửa text.
# Thay thế
echo "Hello World" | sed 's/World/DevOps/'

# Thay trong file
sed -i 's/error/warning/' log.txt

# Xóa dòng
sed '/error/d' log.txt
