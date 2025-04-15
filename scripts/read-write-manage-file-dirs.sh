#!/bin/bash

#---> Write
## Ghi mới hoặc ghi đè (>)
# Tạo file mới hoặc đè lên file cũ.
echo "Hello DevOps" >output.txt

## Thêm vào file (>>)
# Thêm vào cuối file, không xóa nội dung cũ.
echo "Dòng mới" >>output.txt

## Ghi từ lệnh
df -h >disk_usage.txt

#---> Read
## Đọc toàn bộ file
cat output.txt

## Đọc từng dòng
while read LINE; do
  echo "Dòng: $LINE"
done <output.txt

## Đọc đầu/cuối
head -n 2 output.txt # 2 dòng đầu
tail -n 2 output.txt # 2 dòng cuối

#---> Manage file
## Kiểm tra file
if [ -f "output.txt" ]; then
  echo "File tồn tại"
fi

## Xóa file
rm output.txt

## Tạo thư mục
mkdir logs

## Di chuyển/đổi tên
mv output.txt logs/output.txt
