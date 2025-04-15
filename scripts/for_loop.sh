#!/bin/bash

#--> Lặp qua danh sách
for ITEM in "apple" "banana" "orange"; do
  echo "Fruit: $ITEM"
done

#--> Lặp qua phạm vi số
# Tips: {1..3} là cú pháp Bash 4+, nếu dùng Bash cũ, thay bằng seq 1 3.
for i in {1..3}; do
  echo "Số: $i"
done

#--> Lặp qua output lệnh
for FILE in $(ls *.txt); do
  echo "File: $FILE"
done
