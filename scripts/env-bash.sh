#!/bin/bash

#---> Quản Lý Biến trong Bash DevOps: Biến Môi Trường và Scope Hiệu Quả

## Biến Cơ Bản
NAME="DevOps"
echo "$NAME"

## Liệt kê tất cả biến môi trường
env

#---> Cách Quản Lý Biến trong Bash
## Scope Biến Bash
# Tips: Luôn dùng local trong hàm để tránh xung đột.
# Local: Chỉ dùng trong hàm/script hiện tại.
my_function() {
  local MY_VAR="Local"
  echo "$MY_VAR"
}
my_function
echo "$MY_VAR" # Rỗng

# Global: Dùng trong toàn shell nếu không khai báo local.
MY_VAR="Global"
my_function() {
  echo "$MY_VAR"
}
my_function # In "Global"

## Export Bash
# Export biến để chia sẻ với subprocess/script khác:
MY_VAR="DevOps"
export MY_VAR
bash -c 'echo $MY_VAR' # In "DevOps"

# Không Export Bash
MY_VAR="DevOps"
bash -c 'echo $MY_VAR' # Rỗng

## Biến Môi Trường từ File
# Dùng source
# Tạo config.env
DB_HOST="localhost"
DB_PORT=5432

# Load
source ./config.env
echo "$DB_HOST:$DB_PORT"


