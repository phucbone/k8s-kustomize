#!/bin/bash

# Lặp cho đến khi điều kiện đúng (ngược với while).
COUNT=1
until [ $COUNT -gt 5 ]; do
  echo "Đếm: $COUNT"
  COUNT=$((COUNT + 1))
done
