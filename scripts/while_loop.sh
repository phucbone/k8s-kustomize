#!/bin/bash

# Lặp khi điều kiện đúng.
# Tips: Dùng $(( )) để tính toán số học.
COUNT=1
while [ $COUNT -le 5 ]; do
  echo "Đếm: $COUNT"
  COUNT=$((COUNT + 1))
done
